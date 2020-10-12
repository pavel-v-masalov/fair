CREATE OR REPLACE package          Pkg_allocation_calc as

 procedure main(p_date in date
               ,p_calc_type in varchar2);

end Pkg_allocation_calc;

/


CREATE OR REPLACE package body          Pkg_allocation_calc as
----------------------------------------------------------------------------------------
 procedure allocation_drivers_calc(p_date in date, p_calc_type in varchar2) as

 begin
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_drivers_calc','Перевзвешивание драйверов');
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_drivers_calc','Очистка временной таблицы dm.drivers_alloccalc_tmp');

  execute immediate 'truncate table dm.drivers_alloccalc_tmp' ;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_drivers_calc','Расчёт драйверов');

  insert /*+ append */into dm.drivers_alloccalc_tmp (stage, cc_from, cc_to, driver, max_cnt, max_flag, stop_allocation_flag)
  /*select d.stage
        ,d.cc_from
        ,d.cc_to
        --,d.driver
        ,case max_flag
           when 0
           then d.driver
           else d.driver + (1 - d.sum_driver) / sum(max_flag) over (partition by d.stage, d.cc_from)
         end  as driver
        --,sum(max_flag) over (partition by d.stage, d.cc_from) cnt
        --,d.sum_driver
        --,d.max_flag
  from (
  select d.stage
        ,d.cc_from
        ,d.cc_to
        ,d.driver
        ,sum(d.driver) over (partition by d.stage, d.cc_from) sum_driver
        ,case d.driver when max(d.driver) over (partition by d.stage, d.cc_from) then 1 else 0 end max_flag
        --,d.*
  from dwh.drivers d
  where d.valid_to_dttm = date '2400-01-01'
    and d.period_start_dt <= p_date
    and d.period_end_dt   >= p_date
    and upper(d.flag) = p_calc_type
  ) d*/
  with
  dwh_drivers as (
  select d.stage
        ,d.cc_from
        ,d.cc_to
        ,round(d.driver,4)  as driver
        ,case when mt.col_mircode is null then 'N' else 'Y' end  as stop_allocation_flag
  from dwh.drivers d
    left join dwh.mircode m on d.cc_from = m.col_mircode
                           and m.valid_to_dttm = date '2400-01-01'
                           and (m.col_mircode in ('CORP','NPLS')
                             or m.col_mircode like 'LS%'
                             or m.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                               )
    left join dwh.mircode mt on d.cc_to = mt.col_mircode
                            and mt.valid_to_dttm = date '2400-01-01'
                            and (mt.col_mircode in ('CORP','NPLS')
                              or mt.col_mircode like 'LS%'
                              or mt.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                                )
  where d.valid_to_dttm = date '2400-01-01'
    and d.period_start_dt <= p_date
    and d.period_end_dt   >= p_date
    and upper(d.flag) = p_calc_type
    and m.col_mircode is null
  ),

  dr_calc as (
  select d.stage
        ,d.cc_from
        ,d.cc_to
        ,round(ratio_to_report(d.driver) over (partition by d.stage, d.cc_from),4) as driver
        --,case rank() over (partition by d.stage, d.cc_from order by d.driver desc) when 1 then 1 else 0 end  as max_flag
        ,d.stop_allocation_flag
  from (select d.stage
              ,d.cc_from
              ,d.cc_to
              ,d.driver
              ,d.stop_allocation_flag
        from dwh_drivers d
        union all
        select 'Stage_02'  as stage
              ,d.cc_from
              ,d.cc_to
              ,d.driver
              ,d.stop_allocation_flag
        from dwh_drivers d
         join dwh.mircode mf on d.cc_from = mf.col_mircode
                            and mf.categoryrus = 'Бэк-офис'
         join dwh.mircode mt on d.cc_to = mt.col_mircode
                            and nvl(mt.categoryrus,'zxc') != 'Бэк-офис'
        where d.stage = 'Stage_01') d
  )

  select d.stage
        ,d.cc_from
        ,d.cc_to
        ,d.driver
        ,sum(d.max_flag) over (partition by d.stage, d.cc_from) max_cnt
        ,d.max_flag
        ,d.stop_allocation_flag
  from (
  select d.stage
        ,d.cc_from
        ,d.cc_to
        ,d.driver
        --,sum(d.max_flag) over (partition by d.stage, d.cc_from) max_cnt
        ,case rank() over (partition by d.stage, d.cc_from order by d.driver desc) when 1 then 1 else 0 end  as max_flag
        ,d.stop_allocation_flag
  from dr_calc d) d
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_drivers_calc','Сбор статистики drivers_alloccalc_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('drivers_alloccalc_tmp')
                               ,estimate_percent => 100);
  exception
  when others
  then dm.u_log('vizhdanov.Pkg_allocation_calc'
                            ,'allocation_drivers_calc'
                            ,sqlerrm);
       raise;
  end allocation_drivers_calc;

----------------------------------------------------------------------------------------
 procedure allocation_plan_calc(p_date in date) as

 begin
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт плановых аллокаций');
---------------------------------

  -- Перевзвешиваем драйвера
  allocation_drivers_calc(p_date, 'PLAN');

---------------------------------

  -- Очищаем временную таблицу план dm.allocation_plan_tmp (план_tmp)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Очистка таблицы dm.allocation_plan_tmp');

  execute immediate 'truncate table dm.allocation_plan_tmp' ;

  -- Загружаем в план_tmp расходы для аллокаций
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Загрузка расходов');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Start'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         m.col_mircode  as cc_from,
         m.col_mircode  as cc_to,
         t.navision_key,
         t.budget_item_key,
         1  as driver,
         t.group_currency_key  as currency_key,

         round(t.plan_sum,2)      as amnt_plan_s,
         round(t.plan_sum_rur,2)  as amnt_plan_s_rur,
         round(t.plan_sum,2)      as amnt_after_alloc_plan_s,
         round(t.plan_sum_rur,2)  as amnt_after_alloc_plan_s_rur,

         round(t.plan_cum_total,2)      as amnt_plan_cum,
         round(t.plan_cum_total_rur,2)  as amnt_plan_cum_rur,
         round(t.plan_cum_total,2)      as amnt_after_alloc_plan_cum,
         round(t.plan_cum_total_rur,2)  as amnt_after_alloc_plan_cum_rur,

         'N'  as allocation_flag,
         case when mf.mircode_key is null and aos.branch_key is null then 'N' else 'Y' end  as stop_allocation_flag
  from (select t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key, osg.group_currency_key
             , sum(t.plan_sum)     plan_sum
             , sum(t.plan_sum_rur) plan_sum_rur
             , sum(t.plan_cum_total)     plan_cum_total
             , sum(t.plan_cum_total_rur) plan_cum_total_rur
        from DWH.COSTS_PLAN t
          left join DWH.ORG_STRUCTURE_GROUP osg on t.group_key = osg.group_key
                                               and osg.valid_to_dttm  = date '2400-01-01'
        where t.month_dt = p_date
          and t.valid_to_dttm = date '2400-01-01'
        group by t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key, osg.group_currency_key) t

    /*left*/ join dwh.mircode m on t.mircode_key = m.mircode_key
                           and m.valid_to_dttm  = date '2400-01-01'
    left join dwh.mircode mf on t.mircode_key = mf.mircode_key
                            --and m.col_mircode = mf.col_mircode
                            and mf.valid_to_dttm = date '2400-01-01'
                            and (mf.col_mircode in ('CORP','NPLS')
                              or mf.col_mircode like 'LS%'
                              or mf.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                                )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 1 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------
  -- Загружаем в план_tmp аллокации Direct
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Direct');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Direct'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end  as driver,
         t.currency_key,

         t.amnt_after_alloc_plan_s      as amnt_plan_s,
         t.amnt_after_alloc_plan_s_rur  as amnt_plan_s_rur,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_plan_s      as amnt_after_alloc_plan_s,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_plan_s_rur  as amnt_after_alloc_plan_s_rur,

         t.amnt_after_alloc_plan_cum      as amnt_plan_cum,
         t.amnt_after_alloc_plan_cum_rur  as amnt_plan_cum_rur,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_plan_cum      as amnt_after_alloc_plan_cum,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_plan_cum_rur  as amnt_after_alloc_plan_cum_rur,

         'Y'  as allocation_flag,
         t.stop_allocation_flag

  from dm.allocation_plan_tmp t
    /*left join dwh.mircode m on t.cc_from = m.col_mircode
                           and m.valid_to_dttm = date '2400-01-01'
                           and (m.col_mircode in ('CORP','NPLS')
                             or m.col_mircode like 'LS%'
                             or m.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                               )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null*/
  where/* m.mircode_key is null
    and aos.branch_key is null
    and */t.stage = 'Start'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 2 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в план_tmp аллокации Stage_00
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Stage_00');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_plan_s,
         t.amnt_plan_s_rur,
         t.amnt_after_alloc_plan_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s,
         t.amnt_after_alloc_plan_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s_rur,

         t.amnt_plan_cum,
         t.amnt_plan_cum_rur,
         t.amnt_after_alloc_plan_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum,
         t.amnt_after_alloc_plan_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_00'  as stage,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_plan_s      as amnt_plan_s,
         t.amnt_after_alloc_plan_s_rur  as amnt_plan_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)      as amnt_after_alloc_plan_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)  as amnt_after_alloc_plan_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_plan_cum      as amnt_plan_cum,
         t.amnt_after_alloc_plan_cum_rur  as amnt_plan_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)      as amnt_after_alloc_plan_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)  as amnt_after_alloc_plan_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_plan_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_00'
  where t.stage = 'Start'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 3 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в план_tmp аллокации Stage_01
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Stage_01');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_plan_s,
         t.amnt_plan_s_rur,
         t.amnt_after_alloc_plan_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s,
         t.amnt_after_alloc_plan_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s_rur,

         t.amnt_plan_cum,
         t.amnt_plan_cum_rur,
         t.amnt_after_alloc_plan_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum,
         t.amnt_after_alloc_plan_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_01'  as stage,
         t.cc_from_00,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_plan_s      as amnt_plan_s,
         t.amnt_after_alloc_plan_s_rur  as amnt_plan_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)      as amnt_after_alloc_plan_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)  as amnt_after_alloc_plan_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_plan_cum      as amnt_plan_cum,
         t.amnt_after_alloc_plan_cum_rur  as amnt_plan_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)      as amnt_after_alloc_plan_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)  as amnt_after_alloc_plan_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_plan_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_01'
  where t.stage = 'Stage_00'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 4 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в план_tmp аллокации Stage_02
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Stage_02');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_plan_s,
         t.amnt_plan_s_rur,
         t.amnt_after_alloc_plan_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s,
         t.amnt_after_alloc_plan_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s_rur,

         t.amnt_plan_cum,
         t.amnt_plan_cum_rur,
         t.amnt_after_alloc_plan_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum,
         t.amnt_after_alloc_plan_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_02'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_plan_s      as amnt_plan_s,
         t.amnt_after_alloc_plan_s_rur  as amnt_plan_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)      as amnt_after_alloc_plan_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)  as amnt_after_alloc_plan_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_plan_cum      as amnt_plan_cum,
         t.amnt_after_alloc_plan_cum_rur  as amnt_plan_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)      as amnt_after_alloc_plan_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)  as amnt_after_alloc_plan_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_plan_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_02'
    /*left join (select \*+ no_merge *\
                      d.cc_from
                     ,d.cc_to
                     ,ratio_to_report(d.driver) over (partition by d.cc_from) as driver
               from dm.drivers_alloccalc_tmp d
                 join dwh.mircode mf on d.cc_from = mf.col_mircode
                                    and mf.categoryrus = 'Бэк-офис'
                join dwh.mircode mt on d.cc_to = mt.col_mircode
                                     and nvl(mt.categoryrus,'zxc') != 'Бэк-офис'
               where d.stage = 'Stage_01'
              ) d on t.cc_to = d.cc_from*/
  where t.stage = 'Stage_01'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 5 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в план_tmp аллокации Stage_03
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Stage_03');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_plan_s,
         t.amnt_plan_s_rur,
         t.amnt_after_alloc_plan_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s-t.summ1)-trunc((t.amnt_plan_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s,
         t.amnt_after_alloc_plan_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_s_rur-t.summ1rur)-trunc((t.amnt_plan_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_s_rur,

         t.amnt_plan_cum,
         t.amnt_plan_cum_rur,
         t.amnt_after_alloc_plan_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum-t.summ2)-trunc((t.amnt_plan_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum,
         t.amnt_after_alloc_plan_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_plan_cum_rur-t.summ2rur)-trunc((t.amnt_plan_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_plan_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_03'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_plan_s      as amnt_plan_s,
         t.amnt_after_alloc_plan_s_rur  as amnt_plan_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)      as amnt_after_alloc_plan_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)  as amnt_after_alloc_plan_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_plan_cum      as amnt_plan_cum,
         t.amnt_after_alloc_plan_cum_rur  as amnt_plan_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)      as amnt_after_alloc_plan_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)  as amnt_after_alloc_plan_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_plan_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_plan_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_03'
  where t.stage = 'Stage_02'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 6 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в план_tmp аллокации Stage_04 (корректировка)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Расчёт аллокации Stage_04');

  insert into dm.allocation_plan_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur, allocation_flag, stop_allocation_flag)

  select group_key,
         branch_key,
         dm.s_allocation.nextval  as line_key,
         line_source_key,
         stage,
         cc_from_00,
         cc_from_01,
         cc_from_02,
         cc_from_03,
         cc_from,
         cc_to,
         navision_key,
         budget_item_key,
         driver,
         currency_key,

         amnt_plan_s,
         amnt_plan_s_rur,
         amnt_after_alloc_plan_s,
         amnt_after_alloc_plan_s_rur,

         amnt_plan_cum,
         amnt_plan_cum_rur,
         amnt_after_alloc_plan_cum,
         amnt_after_alloc_plan_cum_rur,

         allocation_flag,
         stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         --dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Stage_04'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to  as cc_to,
         t.navision_key,
         t.budget_item_key,
         -1  as driver,
         t.currency_key,

         sum(t.amnt_after_alloc_plan_s)      as amnt_plan_s,
         sum(t.amnt_after_alloc_plan_s_rur)  as amnt_plan_s_rur,
         -1*sum(t.amnt_after_alloc_plan_s)      as amnt_after_alloc_plan_s,
         -1*sum(t.amnt_after_alloc_plan_s_rur)  as amnt_after_alloc_plan_s_rur,

         sum(t.amnt_after_alloc_plan_cum)      as amnt_plan_cum,
         sum(t.amnt_after_alloc_plan_cum_rur)  as amnt_plan_cum_rur,
         -1*sum(t.amnt_after_alloc_plan_cum)      as amnt_after_alloc_plan_cum,
         -1*sum(t.amnt_after_alloc_plan_cum_rur)  as amnt_after_alloc_plan_cum_rur,

         'Y'  as allocation_flag,
         'N'  as stop_allocation_flag
  from dm.allocation_plan_tmp t
  where t.allocation_flag = 'Y'
    and t.stop_allocation_flag = 'N'
  group by t.group_key, t.branch_key, t.cc_to, t.navision_key, t.budget_item_key, t.currency_key)
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики 7 allocation_plan_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Переносим план_tmp в dm.allocation_plan
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Очистка таблицы dm.allocation_plan');

  delete from dm.allocation_plan where month_dt = p_date;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Загрука витрины плана рассчитанными данными');

  insert into dm.allocation_plan(month_dt, branch_key, group_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_plan_s, amnt_plan_s_rur,
  amnt_after_alloc_plan_s, amnt_after_alloc_plan_s_rur, amnt_plan_cum, amnt_plan_cum_rur, amnt_after_alloc_plan_cum,
  amnt_after_alloc_plan_cum_rur)

  select p_date  as month_dt,
         t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         t.stage,
         --case t.stage when 'Stage_04' then 'Y' else 'N' end  as correction_flg,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,
         t.amnt_plan_s,
         t.amnt_plan_s_rur,
         t.amnt_after_alloc_plan_s,
         t.amnt_after_alloc_plan_s_rur,
         t.amnt_plan_cum,
         t.amnt_plan_cum_rur,
         t.amnt_after_alloc_plan_cum,
         t.amnt_after_alloc_plan_cum_rur
  from dm.allocation_plan_tmp t
  where t.allocation_flag = 'Y'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_plan_calc','Сбор статистики allocation_plan');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_plan')
                               ,estimate_percent => 100);
 exception
   when others
   then dm.u_log('vizhdanov.Pkg_allocation_calc'
                             ,'allocation_plan_calc'
                             ,sqlerrm);
        raise;
 end allocation_plan_calc;


----------------------------------------------------------------------------------------
 procedure allocation_forecast_calc(p_date in date) as

 begin
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт прогнозных аллокаций');
---------------------------------

  -- Перевзвешиваем драйвера
  allocation_drivers_calc(p_date, 'FORECAST');

---------------------------------

  -- Очищаем временную таблицу план dm.allocation_forecast_tmp (прогноз_tmp)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Очистка таблицы dm.allocation_forecast_tmp');

  execute immediate 'truncate table dm.allocation_forecast_tmp' ;

  -- Загружаем в прогноз_tmp расходы для аллокаций
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Загрузка расходов');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Start'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         m.col_mircode  as cc_from,
         m.col_mircode  as cc_to,
         t.navision_key,
         t.budget_item_key,
         1  as driver,
         t.group_currency_key  as currency_key,

         round(t.forecast_sum,2)      as amnt_forecast_s,
         round(t.forecast_sum_rur,2)  as amnt_forecast_s_rur,
         round(t.forecast_sum,2)      as amnt_after_alloc_forecast_s,
         round(t.forecast_sum_rur,2)  as amnt_after_alloc_fc_s_rur,

         round(t.forecast_cum_total,2)      as amnt_forecast_cum,
         round(t.forecast_cum_total_rur,2)  as amnt_forecast_cum_rur,
         round(t.forecast_cum_total,2)      as amnt_after_alloc_forecast_cum,
         round(t.forecast_cum_total_rur,2)  as amnt_after_alloc_fc_cum_rur,

         'N'  as allocation_flag,
         case when mf.mircode_key is null and aos.branch_key is null then 'N' else 'Y' end  as stop_allocation_flag
  from (select t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key, osg.group_currency_key
             , sum(t.forecast_sum)     forecast_sum
             , sum(t.forecast_sum_rur) forecast_sum_rur
             , sum(t.forecast_cum_total)     forecast_cum_total
             , sum(t.forecast_cum_total_rur) forecast_cum_total_rur
        from DWH.COSTS_FORECAST t
          left join DWH.ORG_STRUCTURE_GROUP osg on t.group_key = osg.group_key
                                               and osg.valid_to_dttm  = date '2400-01-01'
        where t.month_dt = p_date
          and t.valid_to_dttm = date '2400-01-01'
        group by t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key, osg.group_currency_key) t

    /*left*/ join dwh.mircode m on t.mircode_key = m.mircode_key
                           and m.valid_to_dttm  = date '2400-01-01'
    left join dwh.mircode mf on t.mircode_key = mf.mircode_key
                            --and m.col_mircode = mf.col_mircode
                            and mf.valid_to_dttm = date '2400-01-01'
                            and (mf.col_mircode in ('CORP','NPLS')
                              or mf.col_mircode like 'LS%'
                              or mf.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                                )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 1 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------
  -- Загружаем в прогноз_tmp аллокации Direct
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Direct');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Direct'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end  as driver,
         t.currency_key,

         t.amnt_after_alloc_forecast_s      as amnt_forecast_s,
         t.amnt_after_alloc_fc_s_rur  as amnt_forecast_s_rur,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_forecast_s      as amnt_after_alloc_forecast_s,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_fc_s_rur  as amnt_after_alloc_fc_s_rur,

         t.amnt_after_alloc_forecast_cum      as amnt_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur  as amnt_forecast_cum_rur,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_forecast_cum      as amnt_after_alloc_forecast_cum,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_fc_cum_rur  as amnt_after_alloc_fc_cum_rur,

         'Y'  as allocation_flag,
         t.stop_allocation_flag

  from dm.allocation_forecast_tmp t
  /*  left join dwh.mircode m on t.cc_from = m.col_mircode
                           and m.valid_to_dttm = date '2400-01-01'
                           and (m.col_mircode in ('CORP','NPLS')
                             or m.col_mircode like 'LS%'
                             or m.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                               )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null*/
  where /*m.mircode_key is null
    and aos.branch_key is null
    and*/ t.stage = 'Start'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 2 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в прогноз_tmp аллокации Stage_00
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Stage_00');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_forecast_s,
         t.amnt_forecast_s_rur,
         t.amnt_after_alloc_forecast_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_s,
         t.amnt_after_alloc_fc_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_s_rur,

         t.amnt_forecast_cum,
         t.amnt_forecast_cum_rur,
         t.amnt_after_alloc_forecast_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_00'  as stage,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_forecast_s      as amnt_forecast_s,
         t.amnt_after_alloc_fc_s_rur  as amnt_forecast_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)      as amnt_after_alloc_forecast_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)  as amnt_after_alloc_fc_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_forecast_cum      as amnt_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur  as amnt_forecast_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)      as amnt_after_alloc_forecast_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)  as amnt_after_alloc_fc_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_forecast_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_00'
  where t.stage = 'Start'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 3 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в прогноз_tmp аллокации Stage_01
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Stage_01');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_forecast_s,
         t.amnt_forecast_s_rur,
         t.amnt_after_alloc_forecast_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_s,
         t.amnt_after_alloc_fc_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_s_rur,

         t.amnt_forecast_cum,
         t.amnt_forecast_cum_rur,
         t.amnt_after_alloc_forecast_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_01'  as stage,
         t.cc_from_00,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_forecast_s      as amnt_forecast_s,
         t.amnt_after_alloc_fc_s_rur  as amnt_forecast_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)      as amnt_after_alloc_forecast_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)  as amnt_after_alloc_fc_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_forecast_cum      as amnt_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur  as amnt_forecast_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)      as amnt_after_alloc_forecast_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)  as amnt_after_alloc_fc_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_forecast_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_01'
  where t.stage = 'Stage_00'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 4 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в прогноз_tmp аллокации Stage_02
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Stage_02');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_forecast_s,
         t.amnt_forecast_s_rur,
         t.amnt_after_alloc_forecast_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_s,
         t.amnt_after_alloc_fc_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_s_rur,

         t.amnt_forecast_cum,
         t.amnt_forecast_cum_rur,
         t.amnt_after_alloc_forecast_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_02'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_forecast_s      as amnt_forecast_s,
         t.amnt_after_alloc_fc_s_rur  as amnt_forecast_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)      as amnt_after_alloc_forecast_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)  as amnt_after_alloc_fc_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_forecast_cum      as amnt_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur  as amnt_forecast_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)      as amnt_after_alloc_forecast_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)  as amnt_after_alloc_fc_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_forecast_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_02'
    /*left join (select \*+ no_merge *\
                      d.cc_from
                     ,d.cc_to
                     ,ratio_to_report(d.driver) over (partition by d.cc_from) as driver
               from dm.drivers_alloccalc_tmp d
                 join dwh.mircode mf on d.cc_from = mf.col_mircode
                                    and mf.categoryrus = 'Бэк-офис'
                join dwh.mircode mt on d.cc_to = mt.col_mircode
                                     and nvl(mt.categoryrus,'zxc') != 'Бэк-офис'
               where d.stage = 'Stage_01'
              ) d on t.cc_to = d.cc_from*/
  where t.stage = 'Stage_01'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 5 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в прогноз_tmp аллокации Stage_03
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Stage_03');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,

         t.amnt_forecast_s,
         t.amnt_forecast_s_rur,
         t.amnt_after_alloc_forecast_s+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s-t.summ1)-trunc((t.amnt_forecast_s-t.summ1)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_s,
         t.amnt_after_alloc_fc_s_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_s_rur-t.summ1rur)-trunc((t.amnt_forecast_s_rur-t.summ1rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_s_rur,

         t.amnt_forecast_cum,
         t.amnt_forecast_cum_rur,
         t.amnt_after_alloc_forecast_cum+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum-t.summ2)-trunc((t.amnt_forecast_cum-t.summ2)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_forecast_cum_rur-t.summ2rur)-trunc((t.amnt_forecast_cum_rur-t.summ2rur)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fc_cum_rur,

         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_03'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
         t.currency_key,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_forecast_s      as amnt_forecast_s,
         t.amnt_after_alloc_fc_s_rur  as amnt_forecast_s_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)      as amnt_after_alloc_forecast_s,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)  as amnt_after_alloc_fc_s_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_s,2)) over (partition by t.cc_to, t.line_source_key) summ1,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_s_rur,2)) over (partition by t.cc_to, t.line_source_key) summ1rur,

         t.amnt_after_alloc_forecast_cum      as amnt_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur  as amnt_forecast_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)      as amnt_after_alloc_forecast_cum,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)  as amnt_after_alloc_fc_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_forecast_cum,2)) over (partition by t.cc_to, t.line_source_key) summ2,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fc_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ2rur,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_forecast_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_03'
  where t.stage = 'Stage_02'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 6 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в прогноз_tmp аллокации Stage_04 (корректировка)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Расчёт аллокации Stage_04');

  insert into dm.allocation_forecast_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s,
  amnt_forecast_s_rur, amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur, allocation_flag, stop_allocation_flag)

  select group_key,
         branch_key,
         dm.s_allocation.nextval  as line_key,
         line_source_key,
         stage,
         cc_from_00,
         cc_from_01,
         cc_from_02,
         cc_from_03,
         cc_from,
         cc_to,
         navision_key,
         budget_item_key,
         driver,
         currency_key,

         amnt_forecast_s,
         amnt_forecast_s_rur,
         amnt_after_alloc_forecast_s,
         amnt_after_alloc_fc_s_rur,

         amnt_forecast_cum,
         amnt_forecast_cum_rur,
         amnt_after_alloc_forecast_cum,
         amnt_after_alloc_fc_cum_rur,

         allocation_flag,
         stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         --dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Stage_04'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to  as cc_to,
         t.navision_key,
         t.budget_item_key,
         -1  as driver,
         t.currency_key,

         sum(t.amnt_after_alloc_forecast_s)      as amnt_forecast_s,
         sum(t.amnt_after_alloc_fc_s_rur)  as amnt_forecast_s_rur,
         -1*sum(t.amnt_after_alloc_forecast_s)      as amnt_after_alloc_forecast_s,
         -1*sum(t.amnt_after_alloc_fc_s_rur)  as amnt_after_alloc_fc_s_rur,

         sum(t.amnt_after_alloc_forecast_cum)      as amnt_forecast_cum,
         sum(t.amnt_after_alloc_fc_cum_rur)  as amnt_forecast_cum_rur,
         -1*sum(t.amnt_after_alloc_forecast_cum)      as amnt_after_alloc_forecast_cum,
         -1*sum(t.amnt_after_alloc_fc_cum_rur)  as amnt_after_alloc_fc_cum_rur,

         'Y'  as allocation_flag,
         'N'  as stop_allocation_flag
  from dm.allocation_forecast_tmp t
  where t.allocation_flag = 'Y'
    and t.stop_allocation_flag = 'N'
  group by t.group_key, t.branch_key, t.cc_to, t.navision_key, t.budget_item_key, t.currency_key)
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики 7 allocation_forecast_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Переносим прогноз_tmp в dm.allocation_forecast
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Очистка таблицы dm.allocation_forecast');

  delete from dm.allocation_forecast where month_dt = p_date;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Загрука витрины прогноза рассчитанными данными');

  insert into dm.allocation_forecast(month_dt, branch_key, group_key, line_key, line_source_key, stage, cc_from_00, cc_from_01,
  cc_from_02, cc_from, cc_to, navision_key, budget_item_key, driver, currency_key, amnt_forecast_s, amnt_forecast_s_rur,
  amnt_after_alloc_forecast_s, amnt_after_alloc_fc_s_rur, amnt_forecast_cum, amnt_forecast_cum_rur,
  amnt_after_alloc_forecast_cum, amnt_after_alloc_fc_cum_rur)

  select p_date  as month_dt,
         t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         t.stage,
         --case t.stage when 'Stage_04' then 'Y' else 'N' end  as correction_flg,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.currency_key,
         t.amnt_forecast_s,
         t.amnt_forecast_s_rur,
         t.amnt_after_alloc_forecast_s,
         t.amnt_after_alloc_fc_s_rur,
         t.amnt_forecast_cum,
         t.amnt_forecast_cum_rur,
         t.amnt_after_alloc_forecast_cum,
         t.amnt_after_alloc_fc_cum_rur
  from dm.allocation_forecast_tmp t
  where t.allocation_flag = 'Y'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_forecast_calc','Сбор статистики allocation_forecast');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_forecast')
                               ,estimate_percent => 100);
 exception
   when others
   then dm.u_log('vizhdanov.Pkg_allocation_calc'
                             ,'allocation_forecast_calc'
                             ,sqlerrm);
        raise;
 end allocation_forecast_calc;


----------------------------------------------------------------------------------------
 procedure allocation_fact_calc(p_date in date) as

 begin
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт фактических аллокаций');
---------------------------------

  -- Перевзвешиваем драйвера
  allocation_drivers_calc(p_date, 'FACT');

---------------------------------

  -- Очищаем временную таблицу факта dm.allocation_fact_tmp (факт_tmp)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Очистка таблицы dm.allocation_fact_tmp');

  execute immediate 'truncate table dm.allocation_fact_tmp' ;

  -- Загружаем в факт_tmp расходы для аллокаций
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Загрузка расходов');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Start'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         m.col_mircode  as cc_from,
         m.col_mircode  as cc_to,
         t.navision_key,
         t.budget_item_key,
         1  as driver,
         round(t.fact_cum_total_rur,2)  as amnt_fact_cum_rur,
         round(t.fact_cum_total_rur,2)  as amnt_after_alloc_fact_cum_rur,
         'N'  as allocation_flag,
         case when mf.mircode_key is null and aos.branch_key is null then 'N' else 'Y' end  as stop_allocation_flag

  from (select /*+ no_merge */
               t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key
             , sum(t.fact_cum_total_rur) fact_cum_total_rur
        from DWH.COSTS_fact t
        where t.month_dt = p_date
          and t.valid_to_dttm = date '2400-01-01'
        group by t.group_key, t.branch_key, t.mircode_key, t.navision_key, t.budget_item_key) t

    /*left*/ join dwh.mircode m on t.mircode_key = m.mircode_key
                           and m.valid_to_dttm  = date '2400-01-01'
    left join dwh.mircode mf on t.mircode_key = mf.mircode_key
                            --and m.col_mircode = mf.col_mircode
                            and mf.valid_to_dttm = date '2400-01-01'
                            and (mf.col_mircode in ('CORP','NPLS')
                              or mf.col_mircode like 'LS%'
                              or mf.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                                )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 1 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------
  -- Загружаем в факт_tmp аллокации Direct
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Direct');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Direct'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end  as driver,
         t.amnt_after_alloc_fact_cum_rur  as amnt_fact_cum_rur,
         case when t.stop_allocation_flag = 'N' then -1 else 1 end*t.amnt_after_alloc_fact_cum_rur  as amnt_after_alloc_fact_cum_rur,
         'Y'  as allocation_flag,
         t.stop_allocation_flag

  from dm.allocation_fact_tmp t
/*    left join dwh.mircode m on t.cc_from = m.col_mircode
                           and m.valid_to_dttm = date '2400-01-01'
                           and (m.col_mircode in ('CORP','NPLS')
                             or m.col_mircode like 'LS%'
                             or m.category in ('Other Non-Core Deals','Leasing Deals without HeadCount')
                               )
    left join dwh.alloc_org_structure aos on t.branch_key = aos.branch_key
                                         and aos.valid_to_dttm = date '2400-01-01'
                                         and aos.period_start_dt <= p_date
                                         and aos.period_end_dt >= p_date
                                         and aos.flag = 'N'
                                         and aos.mircode_key is not null*/
  where /*m.mircode_key is null
    and aos.branch_key is null
    and*/ t.stage = 'Start'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 2 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в факт_tmp аллокации Stage_00
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Stage_00');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.amnt_fact_cum_rur,
         t.amnt_after_alloc_fact_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fact_cum_rur,
         t.allocation_flag,
         t.stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_00'  as stage,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_fact_cum_rur  as amnt_fact_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)  as amnt_after_alloc_fact_cum_rur,
     sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_fact_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_00'
  where t.stage = 'Start'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 3 allocation_fact_tmp');
  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в факт_tmp аллокации Stage_01
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Stage_01');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.amnt_fact_cum_rur,
         t.amnt_after_alloc_fact_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fact_cum_rur,
         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_01'  as stage,
         t.cc_from_00,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_fact_cum_rur  as amnt_fact_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)  as amnt_after_alloc_fact_cum_rur,
         sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_fact_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_01'
  where t.stage = 'Stage_00'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 4 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в факт_tmp аллокации Stage_02
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Stage_02');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.amnt_fact_cum_rur,
         t.amnt_after_alloc_fact_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fact_cum_rur,
         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_02'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_fact_cum_rur  as amnt_fact_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)  as amnt_after_alloc_fact_cum_rur,
         sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_fact_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_02'
    /*left join (select \*+ no_merge *\
                      d.cc_from
                     ,d.cc_to
                     ,ratio_to_report(d.driver) over (partition by d.cc_from) as driver
               from dm.drivers_alloccalc_tmp d
                 join dwh.mircode mf on d.cc_from = mf.col_mircode
                                    and mf.categoryrus = 'Бэк-офис'
                join dwh.mircode mt on d.cc_to = mt.col_mircode
                                     and nvl(mt.categoryrus,'zxc') != 'Бэк-офис'
               where d.stage = 'Stage_01'
              ) d on t.cc_to = d.cc_from*/
  where t.stage = 'Stage_01'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 5 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в факт_tmp аллокации Stage_03
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Stage_03');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select t.group_key,
         t.branch_key,
         dm.s_allocation.nextval  as line_key,
         t.line_key  as line_source_key,
         t.stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from_03,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.amnt_fact_cum_rur,
         t.amnt_after_alloc_fact_cum_rur+
         -- устраняем ошибку округления
         case when t.max_flag = 1
                   --тут делим пропорционально всем самым большим миркодам
              then trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)+
                   --тут добавляем остаток который не дал целой копейки
                   case when t.rn <= abs((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        then 0.01* sign((t.amnt_fact_cum_rur-t.summ)-trunc((t.amnt_fact_cum_rur-t.summ)/t.max_cnt,2)*t.max_cnt)
                        else 0
                   end
              else 0
         end  as amnt_after_alloc_fact_cum_rur,
         t.allocation_flag,
         t.stop_allocation_flag
         --t.max_cnt,
         --t.max_flag
  from (
  select t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         'Stage_03'  as stage,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         nvl2(d.cc_from,t.cc_to,null)  as cc_from_03,
         t.cc_to  as cc_from,
         nvl2(d.cc_from,d.cc_to,t.cc_to)  as cc_to,
         t.navision_key,
         t.budget_item_key,
         nvl2(d.cc_from,d.driver,1)  as driver,
        ---
         nvl2(d.cc_from,d.max_cnt, -1)  as max_cnt,
         nvl2(d.cc_from,d.max_flag, -1)  as max_flag,
         0.01*row_number() over (partition by t.cc_to, t.line_source_key order by nvl2(d.cc_from,d.driver,1) desc, t.line_key) rn,
        ---
         t.amnt_after_alloc_fact_cum_rur  as amnt_fact_cum_rur,
         round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)  as amnt_after_alloc_fact_cum_rur,
         sum(round(nvl2(d.cc_from,d.driver,1)*t.amnt_after_alloc_fact_cum_rur,2)) over (partition by t.cc_to, t.line_source_key) summ,
        ---
         nvl2(d.cc_from,'Y','N')  as allocation_flag,
         nvl2(d.cc_from,d.stop_allocation_flag,'N')  as stop_allocation_flag
  from dm.allocation_fact_tmp t
    left join dm.drivers_alloccalc_tmp d on t.cc_to = d.cc_from
                                   and d.stage = 'Stage_03'
  where t.stage = 'Stage_02'
    and t.stop_allocation_flag = 'N') t
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 6 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Загружаем в факт_tmp аллокации Stage_04 (корректировка)
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Расчёт аллокации Stage_04');

  insert into dm.allocation_fact_tmp (group_key, branch_key, line_key, line_source_key, stage, cc_from_00,
  cc_from_01, cc_from_02, cc_from_03, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur,allocation_flag, stop_allocation_flag)

  select group_key,
         branch_key,
         dm.s_allocation.nextval  as line_key,
         line_source_key,
         stage,
         cc_from_00,
         cc_from_01,
         cc_from_02,
         cc_from_03,
         cc_from,
         cc_to,
         navision_key,
         budget_item_key,
         driver,
         amnt_fact_cum_rur,
         amnt_after_alloc_fact_cum_rur,
         allocation_flag,
         stop_allocation_flag
  from (
  select t.group_key,
         t.branch_key,
         --dm.s_allocation.nextval  as line_key,
         null  as line_source_key,
         'Stage_04'  as stage,
         null  as cc_from_00,
         null  as cc_from_01,
         null  as cc_from_02,
         null  as cc_from_03,
         t.cc_to  as cc_from,
         t.cc_to  as cc_to,
         t.navision_key,
         t.budget_item_key,
         -1  as driver,
         sum(t.amnt_after_alloc_fact_cum_rur)  as amnt_fact_cum_rur,
         -1*sum(t.amnt_after_alloc_fact_cum_rur)  as amnt_after_alloc_fact_cum_rur,
         'Y'  as allocation_flag,
         'N'  as stop_allocation_flag
  from dm.allocation_fact_tmp t
  where t.allocation_flag = 'Y'
    and t.stop_allocation_flag = 'N'
  group by t.group_key, t.branch_key, t.cc_to, t.navision_key, t.budget_item_key)
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики 7 allocation_fact_tmp');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact_tmp')
                               ,estimate_percent => 100);

---------------------------------

  -- Переносим акт_tmp в dm.allocation_fact
  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Очистка таблицы dm.allocation_fact');

  delete from dm.allocation_fact where month_dt = p_date;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Загрука витрины факта рассчитанными данными');

  insert into dm.allocation_fact(month_dt, group_key, branch_key, line_key, line_source_key, stage, /*correction_flg,*/
  cc_from_00, cc_from_01, cc_from_02, cc_from, cc_to, navision_key, budget_item_key,
  driver, amnt_fact_cum_rur, amnt_after_alloc_fact_cum_rur)

  select p_date  as month_dt,
         t.group_key,
         t.branch_key,
         t.line_key,
         t.line_source_key,
         t.stage,
         --case t.stage when 'Stage_04' then 'Y' else 'N' end  as correction_flg,
         t.cc_from_00,
         t.cc_from_01,
         t.cc_from_02,
         t.cc_from,
         t.cc_to,
         t.navision_key,
         t.budget_item_key,
         t.driver,
         t.amnt_fact_cum_rur,
         t.amnt_after_alloc_fact_cum_rur
  from dm.allocation_fact_tmp t
  where t.allocation_flag = 'Y'
  ;
  commit;

  dm.u_log('vizhdanov.Pkg_allocation_calc','allocation_fact_calc','Сбор статистики allocation_fact');

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('allocation_fact')
                               ,estimate_percent => 100);
 exception
   when others
   then dm.u_log('vizhdanov.Pkg_allocation_calc'
                             ,'allocation_fact_calc'
                             ,sqlerrm);
        raise;
 end allocation_fact_calc;

----------------------------------------------------------------------------------------
 procedure main(p_date in date
               ,p_calc_type in varchar2)
 as
   v_date date := last_day(trunc(p_date));
 begin
   dm.u_log('vizhdanov.Pkg_allocation_calc','main','Начало расчёта витрины аллокации. Отчётная дата - '||to_char(p_date,'yyyy-mm-dd')||', Тип - '||p_calc_type);
   case p_calc_type
     when 'план'    then allocation_plan_calc(v_date);
     when 'прогноз' then allocation_forecast_calc(v_date);
     when 'факт'    then allocation_fact_calc(v_date);
   end case;
   dm.u_log('vizhdanov.Pkg_allocation_calc','main','Витрина рассчитана. Отчётная дата - '||to_char(p_date,'yyyy-mm-dd')||', Тип - '||p_calc_type);
 exception
   when CASE_NOT_FOUND
   then dm.u_log('vizhdanov.Pkg_allocation_calc'
                             ,'main'
                             ,'Выбран недопустимый тип расчёта аллокаций.'||chr(10)||
                              sqlerrm);
        raise;
   when others
   then dm.u_log('vizhdanov.Pkg_allocation_calc'
                             ,'main'
                             ,sqlerrm);
        raise;
 end main;
----------------------------------------------------------------------------------------
end Pkg_allocation_calc;

/
