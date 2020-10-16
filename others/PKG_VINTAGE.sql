CREATE OR REPLACE package    PKG_VINTAGE as

 --Основная процедура расчёта винтажа
 procedure main(p_start_date in date
               ,p_end_date   in date);


 --Разовая процедура заполнения данных по сделкам до МСФО (2018 год)
 --процедура не пожет радботать в параллельном режиме, но проверку на повторный запуск не проводим
 procedure before2018_fill(p_file_name in varchar2);

end PKG_VINTAGE;

/


CREATE OR REPLACE package body    PKG_VINTAGE as

 gv_exc_flag char(1) := 'Y'; --Исключение не обработано?

 procedure VINTAGE_calc(p_date in date
                       ,p_DEFAULT_REGISTRY_date in date)
 is
   
 begin
  delete /*+ bind_aware */from dm.vintage where snapshot_dt = p_date;


insert into dm.vintage(snapshot_dt, contract_root_key, contract_key, contract_num, contract_id_cd, contract_cd,
 leasing_deal_num, leasing_deal_key, client_key, short_client_ru_nam, inn, region_nam, leasing_subject,
 leasing_subject_key, product_nam, product_key, subproduct_nam, subproduct_key, lease_dt, lease_month,
 contract_status_key, contract_status_nam, first_pmnt_dt, age, ovd_cgp_days, max_ovd_cgp_days, date_30_cgp,
 date_60_cgp, date_90_cgp, age_30_cgp, age_60_cgp, age_90_cgp, bal30cgp_rur_amt, bal60cgp_rur_amt, bal90cgp_rur_amt,
 nil30cgp_rur_amt, nil60cgp_rur_amt, nil90cgp_rur_amt, overdue30cgp_rur_amt, overdue60cgp_rur_amt, 
 overdue90cgp_rur_amt, bal_rur_amt, nil_rur_amt, overdue_rur_amt, ovd_msfo_days, max_ovd_msfo_days, bal_start_rur_amt,
 date_30_msfo, date_60_msfo, date_90_msfo, age_30_msfo, age_60_msfo, age_90_msfo, bal30msfo_rur_amt,
 bal60msfo_rur_amt, bal90msfo_rur_amt, nil30msfo_rur_amt, nil60msfo_rur_amt, nil90msfo_rur_amt, overdue30msfo_rur_amt,
 overdue60msfo_rur_amt, overdue90msfo_rur_amt, date_30_cgpwm, date_60_cgpwm, date_90_cgpwm, ovd_cgpwm_days,
 max_ovd_cgpwm_days, age_30_cgpwm, age_60_cgpwm, age_90_cgpwm, bal30cgpwm_rur_amt, bal60cgpwm_rur_amt,
 bal90cgpwm_rur_amt, nil30cgpwm_rur_amt, nil60cgpwm_rur_amt, nil90cgpwm_rur_amt, overdue30cgpwm_rur_amt,
 overdue60cgpwm_rur_amt, overdue90cgpwm_rur_amt, bankruptcy_dt, individual_rate_dt, other_default_dt,
 operational_risk_dt, termination_default_dt, insurance_event, insurance_event_dt, last_decision, last_decision_dt,
 insurance_event_flg, insurance_flg, termination_dt, termination_dt_insure_or, termination_dt_insure, insert_dttm)

select /*+ bind_aware */
       p_date  snapshot_dt,
       c.contract_root_key,
       c.contract_key,
       c.contract_num, -- денормализация !!!
       c.contract_id_cd, -- денормализация !!!
       c.contract_cd, -- денормализация !!!
       null  leasing_deal_num, -- денормализация (DWH.LEASING_DEALS) !!!
       c.leasing_deal_key,
       c.client_key,
       null short_client_ru_nam, -- денормализация (DWH.CLIENTS) !!!
       null inn, -- денормализация (DWH.CLIENTS) !!!
       c.region_nam, -- !!! dwh.regions
       null leasing_subject, -- денормализация (DWH.LEASING_SUBJECTS) !!!
       c.leasing_subject_key,
       null product_nam, -- денормализация (DWH.PRODUCTS) !!!
       ls.product_key,
       null subproduct_nam, -- денормализация (DWH.SUBPRODUCTS) !!!
       ls.subproduct_key,
       ts.act_dt  as lease_dt,
       ts.lease_month,
       nvl(flcs.contract_status_key, v.contract_status_key)  as contract_status_key,-- !!!
       nvl(flcs.status_desc, v.contract_status_nam)  as contract_status_nam,
       nvl(dd.first_pmnt_dt,ts.act_dt)  as first_pmnt_dt,
       trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt))) as age,
      --- 
       coalesce(cgp.ovd_cgp_days,v.ovd_cgp_days,0)  as ovd_cgp_days,
       greatest(nvl(v.max_ovd_cgp_days,0), nvl(cgp.ovd_cgp_days,0))  as max_ovd_cgp_days,
      ---
       case when v.date_30_cgp is not null then v.date_30_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 30 then p_date
            else null
       end  as date_30_cgp,
       case when v.date_60_cgp is not null then v.date_60_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 60 then p_date
            else null
       end  as date_60_cgp,
       case when v.date_90_cgp is not null then v.date_90_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 90 then p_date
            else null
       end  as date_90_cgp,
      --- 
       case when v.age_30_cgp is not null then v.age_30_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 30 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as age_30_cgp,
       case when v.age_60_cgp is not null then v.age_60_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 60 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as age_60_cgp,
       case when v.age_90_cgp is not null then v.age_90_cgp
            when nvl(cgp.ovd_cgp_days,0) >= 90 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as age_90_cgp,
      --- 
       case when v.bal30cgp_rur_amt is not null then v.bal30cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 30 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as bal30cgp_rur_amt,
       case when v.bal60cgp_rur_amt is not null then v.bal60cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 60 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as bal60cgp_rur_amt,
       case when v.bal90cgp_rur_amt is not null then v.bal90cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 90 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as bal90cgp_rur_amt,
      --- 
       case when v.nil30cgp_rur_amt is not null then v.nil30cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 30 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as nil30cgp_rur_amt,
       case when v.nil60cgp_rur_amt is not null then v.nil60cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 60 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as nil60cgp_rur_amt,
       case when v.nil90cgp_rur_amt is not null then v.nil90cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 90 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as nil90cgp_rur_amt,
      --- 
       case when v.overdue30cgp_rur_amt is not null then v.overdue30cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 30 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as overdue30cgp_rur_amt,
       case when v.overdue60cgp_rur_amt is not null then v.overdue60cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 60 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as overdue60cgp_rur_amt,
       case when v.overdue90cgp_rur_amt is not null then v.overdue90cgp_rur_amt
            when nvl(cgp.ovd_cgp_days,0) >= 90 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as overdue90cgp_rur_amt,
      ---
       case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end  as bal_rur_amt,
       coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)  as nil_rur_amt,
       coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)  as overdue_rur_amt,
      ---
       coalesce(nil.ovd_msfo_days, v.ovd_msfo_days,0)  as ovd_msfo_days,
       greatest(nvl(v.max_ovd_msfo_days,0), nvl(nil.ovd_msfo_days,0)) as max_ovd_msfo_days,
       case when ts.lease_month = p_date then coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) else v.bal_start_rur_amt end  bal_start_rur_amt,
      ---
       case when v.date_30_msfo is not null then v.date_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 30 then p_date
            else null
       end  as  date_30_msfo,
       case when v.date_30_msfo is not null then v.date_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 60 then p_date
            else null
       end  as  date_60_msfo,
       case when v.date_30_msfo is not null then v.date_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 90 then p_date
            else null
       end  as  date_90_msfo,
      ---
       case when v.age_30_msfo is not null then v.age_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 30 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as  age_30_msfo,
       case when v.age_30_msfo is not null then v.age_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 60 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as  age_60_msfo,
       case when v.age_30_msfo is not null then v.age_30_msfo
            when nvl(nil.ovd_msfo_days,0) >= 90 then trunc(months_between(p_date ,nvl(dd.first_pmnt_dt,ts.act_dt)))-- age
            else null
       end  as  age_90_msfo,
      ---
       case when v.bal30msfo_rur_amt is not null then v.bal30msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 30 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as   bal30msfo_rur_amt,
       case when v.bal60msfo_rur_amt is not null then v.bal60msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 60 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as   bal60msfo_rur_amt,
       case when v.bal90msfo_rur_amt is not null then v.bal90msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 90 then case when nullif(coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt),0) is null then v.bal_rur_amt else coalesce(nil.bal_rur_amt,nil2018.bal_rur_amt) end-- bal_rur_amt
            else null
       end  as   bal90msfo_rur_amt,
      ---
       case when v.nil30msfo_rur_amt is not null then v.nil30msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 30 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as    nil30msfo_rur_amt,
       case when v.nil60msfo_rur_amt is not null then v.nil60msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 60 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as    nil60msfo_rur_amt,
       case when v.nil90msfo_rur_amt is not null then v.nil90msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 90 then coalesce(nil.nil_rur_amt,nil2018.nil_rur_amt)-- nil_rur_amt
            else null
       end  as    nil90msfo_rur_amt,
      ---
       case when v.overdue30msfo_rur_amt is not null then v.overdue30msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 30 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as    overdue30msfo_rur_amt,
       case when v.overdue60msfo_rur_amt is not null then v.overdue60msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 60 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as    overdue60msfo_rur_amt,
       case when v.overdue90msfo_rur_amt is not null then v.overdue90msfo_rur_amt
            when nvl(nil.ovd_msfo_days,0) >= 90 then coalesce(nil.overdue_rur_amt,nil2018.overdue_rur_amt)-- overdue_rur_amt
            else null
       end  as    overdue90msfo_rur_amt,
      ---
       case when v.date_30_cgpwm is not null then v.date_30_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 30 then dd.plan_pay_dt_orig+30
            else null
       end  as date_30_cgpwm,
       case when v.date_60_cgpwm is not null then v.date_60_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 60 then dd.plan_pay_dt_orig+60
            else null
       end  as date_60_cgpwm,
       case when v.date_90_cgpwm is not null then v.date_90_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 90 then dd.plan_pay_dt_orig+90
            else null
       end  as date_90_cgpwm,
       coalesce(dd.OVD_CGPWM_DAYS,v.ovd_cgp_days,0)  as ovd_cgpwm_days,
       greatest(nvl(v.max_ovd_cgpwm_days,0), nvl(dd.OVD_CGPWM_DAYS,0))    as max_ovd_cgpwm_days,
      ---
       case when v.age_30_cgpwm is not null then v.age_30_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 30 then trunc(months_between(dd.plan_pay_dt_orig+30 ,nvl(dd.first_pmnt_dt,ts.act_dt)))
            else null
       end  as age_30_cgpwm,
       case when v.age_60_cgpwm is not null then v.age_60_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 60 then trunc(months_between(dd.plan_pay_dt_orig+60 ,nvl(dd.first_pmnt_dt,ts.act_dt)))
            else null
       end  as age_60_cgpwm,
       case when v.age_90_cgpwm is not null then v.age_90_cgpwm
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 90 then trunc(months_between(dd.plan_pay_dt_orig+90 ,nvl(dd.first_pmnt_dt,ts.act_dt)))
            else null
       end  as age_90_cgpwm,
      ---
       case when v.bal30cgpwm_rur_amt is not null then v.bal30cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 30 then v.bal_rur_amt
            else null
       end  as bal30cgpwm_rur_amt,
       case when v.bal60cgpwm_rur_amt is not null then v.bal60cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 60 then v.bal_rur_amt
            else null
       end  as bal60cgpwm_rur_amt,
       case when v.bal90cgpwm_rur_amt is not null then v.bal90cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 90 then v.bal_rur_amt
            else null
       end  as bal90cgpwm_rur_amt,
      ---
       case when v.nil30cgpwm_rur_amt is not null then v.nil30cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 30 then v.nil_rur_amt
            else null
       end  as nil30cgpwm_rur_amt,
       case when v.nil60cgpwm_rur_amt is not null then v.nil60cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 60 then v.nil_rur_amt
            else null
       end  as nil60cgpwm_rur_amt,
       case when v.nil90cgpwm_rur_amt is not null then v.nil90cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 90 then v.nil_rur_amt
            else null
       end  as nil90cgpwm_rur_amt,
      ---
       case when v.overdue30cgpwm_rur_amt is not null then v.overdue30cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 30 then v.overdue_rur_amt
            else null
       end  as overdue30cgpwm_rur_amt,
       case when v.overdue60cgpwm_rur_amt is not null then v.overdue60cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 60 then v.overdue_rur_amt
            else null
       end  as overdue60cgpwm_rur_amt,
       case when v.overdue90cgpwm_rur_amt is not null then v.overdue90cgpwm_rur_amt
            when nvl(dd.OVD_CGPWM_DAYS,0) >= 90 then v.overdue_rur_amt
            else null
       end  as overdue90cgpwm_rur_amt,
      ---
       nullif(nvl(dr.bankruptcy_dt         ,v.bankruptcy_dt         ),date '5999-12-31')  as bankruptcy_dt,
       nullif(nvl(dr.individual_rate_dt    ,v.individual_rate_dt    ),date '5999-12-31')  as individual_rate_dt,
       nullif(nvl(dr.other_default_dt      ,v.other_default_dt      ),date '5999-12-31')  as other_default_dt,
       nullif(nvl(dr.operational_risk_dt   ,v.operational_risk_dt   ),date '5999-12-31')  as operational_risk_dt,
       nullif(nvl(dr.termination_default_dt,v.termination_default_dt),date '5999-12-31')  as termination_default_dt,
       ev.insurance_event,
       ev.insurance_event_dt,
       ev.last_decision,
       ev.last_decision_dt,
       ev.insurance_event_flg,
       case when ev.insurance_event_flg = 'Y'
             and nullif(nvl(dr.operational_risk_dt   ,v.operational_risk_dt   ),date '5999-12-31') is null--operational_risk_dt
            then 'Y'
            else 'N'
       end  as insurance_flg,
       case when nvl(flcs.status_desc, v.contract_status_nam) in ('Расторгнут','Расторгнут в связи со страховым случаем') --contract_status_nam 
            then nullif(nvl(dr.termination_default_dt,v.termination_default_dt),date '5999-12-31') --termination_default_dt
            else null
       end  as termination_dt,
       case when ev.insurance_event_flg = 'Y'
             and nullif(nvl(dr.operational_risk_dt   ,v.operational_risk_dt   ),date '5999-12-31') is null--operational_risk_dt
            then null
            when nvl(flcs.status_desc, v.contract_status_nam) in ('Расторгнут','Расторгнут в связи со страховым случаем') --contract_status_nam 
            then nullif(nvl(dr.termination_default_dt,v.termination_default_dt),date '5999-12-31') --termination_default_dt
            else null
       end  as termination_dt_insure_or,
       case when ev.insurance_event_flg = 'Y'
            then null
            when nvl(flcs.status_desc, v.contract_status_nam) in ('Расторгнут','Расторгнут в связи со страховым случаем') --contract_status_nam 
            then nullif(nvl(dr.termination_default_dt,v.termination_default_dt),date '5999-12-31') --termination_default_dt
            else null
       end  as termination_dt_insure,
       sysdate  as insert_dttm
from pvechkileva.fors_contracts c
  left join dm.vintage v on c.CONTRACT_ROOT_KEY = v.contract_root_key
                        and v.snapshot_dt = add_months(p_date,-1)
  left join dwh.leasing_subjects ls  on c.LEASING_SUBJECT_KEY = ls.leasing_subject_key
                                    and ls.valid_to_dttm = date '2400-01-01'
                                    and ls.end_dt = date '3999-12-31' -- может between ???
  left join DM.DM_TRANSMIT_SUBJECTS ts on c.contract_id_cd = ts.contract_id_cd
  left join (select /*+ no_merge */
                    flcs.contract_key
                   ,max(flcs.status_desc) keep (dense_rank last order by status_dt) status_desc
                   ,max(flcs.contract_status_key) keep (dense_rank last order by status_dt) contract_status_key
             from dwh.FACT_LEASING_CONTRACTS_STATUS flcs
             where flcs.valid_to_dttm=to_date('01.01.2400','DD.MM.YYYY')
               and flcs.status_dt between case when p_date <= date '2012-02-01' 
                                               then date '0001-01-01' 
                                               else add_months(p_date,-1)
                                          end 
                                      and p_date
             group by flcs.contract_key
            )flcs  on c.CONTRACT_KEY = flcs.contract_key
  left join (select /*+ no_merge */
                    cgp.contract_key
                   ,max(cgp.CUR_LEAS_OVERDUE_DAYS) OVD_CGP_DAYS
             from DM.DM_CGP_DAILY cgp
             where cgp.snapshot_dt = p_date
             group by cgp.contract_key
            )cgp  on c.contract_key = cgp.contract_key
  left join (select /*+ no_merge */
                    dd.contract_key
                   ,min(case when dd.payment_num = 1 then dd.plan_pay_dt_orig end) as FIRST_PMNT_DT
                   ,max(case 
                          when nvl(dd.pay_dt_orig, date '2400-01-01') > p_date
                          then   greatest(least(p_date,nvl(dd.pay_dt_orig,date '2400-01-01'))-dd.plan_pay_dt_orig,0) 
                          else 0
                        end) OVD_CGP_DAYS
                   ,max(case 
                          when nvl(dd.pay_dt_orig, date '2400-01-01') > trunc(p_date,'month')-1
                          then   greatest(least(p_date,nvl(dd.pay_dt_orig,date '2400-01-01'))-dd.plan_pay_dt_orig,0) 
                          else 0
                        end) OVD_CGPWM_DAYS
                   ,min(case when nvl(dd.pay_dt_orig, date '2400-01-01') > trunc(p_date,'month')-1 then dd.plan_pay_dt_orig end )  as plan_pay_dt_orig
             from (
                   select /*+ no_merge */
                          c.contract_root_key contract_key
                         --,dense_rank() over (order by dd.plan_pay_dt_orig)  as payment_num
                         ,dd.payment_num
                         ,dd.plan_pay_dt_orig
                         ,dd.pay_dt_orig
                   from      
                        DM.DM_DETAILS_DAILY dd
                       ,(select /*+ no_merge */
                                CONNECT_BY_ROOT contract_key as contract_root_key, level rehiring_level
                              , CONNECT_BY_ISLEAF  as rehiring_LEAF_flg
                              , t.*
                         from (select *
                               from dwh.contracts c
                               where c.valid_to_dttm = date '2400-01-01'
                                 and nvl(c.delete_flg,0) != 1
                                 and c.contract_kind_key = 4
                              ) t
                         start with t.contract_rehiring_key is null
                         connect  by t.contract_rehiring_key = prior t.contract_key
                        )c
                   where dd.payment_item_key = 9
                     and dd.plan_pay_dt_orig <= p_date
                     and dd.contract_key = c.contract_key
                  ) dd
             group by dd.contract_key
            )dd  on c.contract_key = dd.contract_key
  left join (select /*+ no_merge */
                    nil.contract_key
                   ,max(nvl(nil.nil_rur_amt,0)+nvl(nil.overdue_rur_amt,0))keep (dense_rank first order by case nil.scenar_key when 2 then 99 when 1 then 98 else nil.scenar_key end desc)  bal_rur_amt
                   ,max(nvl(nil.nil_rur_amt,0))                           keep (dense_rank first order by case nil.scenar_key when 2 then 99 when 1 then 98 else nil.scenar_key end desc)  nil_rur_amt
                   ,max(nvl(nil.overdue_rur_amt,0))                       keep (dense_rank first order by case nil.scenar_key when 2 then 99 when 1 then 98 else nil.scenar_key end desc)  overdue_rur_amt
                   ,max(nil.overdue_days)                                 keep (dense_rank first order by case nil.scenar_key when 2 then 99 when 1 then 98 else nil.scenar_key end desc)  ovd_msfo_days
             from DWH.LP_NIL_CURRENT nil
             where nil.snapshot_dt = p_date+1
             group by nil.contract_key
            )nil  on c.contract_key = nil.contract_key --contract_key или contract_root_key ???
  left join (select /*+ no_merge */
                    nil2018.contract_key
                   ,max(nvl(nil2018.nil_rur_amt,0)) + max(nvl(nil2018.overdue_rur_amt,0))  bal_rur_amt
                   ,max(nvl(nil2018.nil_rur_amt,0))  nil_rur_amt
                   ,max(nvl(nil2018.overdue_rur_amt,0))  overdue_rur_amt
             from DWH.Balance_Msfo_Before2018 nil2018
             where nil2018.report_dt = p_date+1
             group by nil2018.contract_key
            )nil2018  on c.contract_key = nil2018.contract_key --contract_key или contract_root_key ???
                     and p_date >= date '2018-01-01' --!!!
  left join (select /*+ no_merge */
                    c.contract_root_key
                   ,case when min(dr.date_bancruptcy_cncl)    <= p_date then date '5999-12-31' when min(dr.date_bancruptcy)    <= p_date then min(dr.date_bancruptcy)    else null end  as bankruptcy_dt
                   ,case when min(dr.Date_Reserve_Estb_Cncl)  <= p_date then date '5999-12-31' when min(dr.Date_Reserve_Estb)  <= p_date then min(dr.Date_Reserve_Estb)  else null end  as INDIVIDUAL_RATE_DT
                   ,case when min(dr.Date_Other_Default_Cncl) <= p_date then date '5999-12-31' when min(dr.Date_Other_Default) <= p_date then min(dr.Date_Other_Default) else null end  as OTHER_DEFAULT_DT
                   ,case when min(least(nvl(dr.Date_Item_Losscncl_Insurcomp,date '5999-12-31')
                                       ,nvl(dr.date_item_losscncl_client   ,date '5999-12-31'))
                                 ) <= p_date 
                         then date '5999-12-31' 
                         when min(least(nvl(dr.Date_Item_Loss_Insurcomp,date '5999-12-31')
                                       ,nvl(dr.date_item_loss_client   ,date '5999-12-31'))
                                 ) <= p_date 
                         then min(least(nvl(dr.Date_Item_Loss_Insurcomp,date '5999-12-31')
                                       ,nvl(dr.date_item_loss_client   ,date '5999-12-31'))
                                 )
                         else null 
                    end  as OPERATIONAL_RISK_DT
                   ,case when min(dr.Date_Termination_Cncl) <= p_date then date '5999-12-31' when min(dr.Date_Termination) <= p_date then min(dr.Date_Termination) else null end  as TERMINATION_DEFAULT_DT
             from DWH.DEFAULT_REGISTRY dr
                 ,(select /*+ no_merge */
                          CONNECT_BY_ROOT contract_key as contract_root_key, level rehiring_level
                        , CONNECT_BY_ISLEAF  as rehiring_LEAF_flg
                        , t.*
                   from (select *
                         from dwh.contracts c
                         where c.valid_to_dttm = date '2400-01-01'
                           and nvl(c.delete_flg,0) != 1
                           and c.contract_kind_key = 4
                        ) t
                   start with t.contract_rehiring_key is null
                   connect  by t.contract_rehiring_key = prior t.contract_key
                  )c
             where dr.report_dt = p_DEFAULT_REGISTRY_date
               and dr.contract_key = c.contract_key
               and (dr.date_bancruptcy is not null
                 or dr.Date_Reserve_Estb is not null
                 or dr.Date_Other_Default is not null
                 or dr.Date_Item_Loss_Insurcomp is not null or dr.date_item_loss_client is not null
                 or dr.Date_Termination is not null
                   )
             group by c.contract_root_key
            )dr on c.contract_root_key = dr.contract_root_key
  left join (select ev.contract_root_key
                   ,ev.INSURANCE_EVENT_DT
                   ,ev.INSURANCE_EVENT
                   ,ev.LAST_DECISION_DT
                   ,ev.LAST_DECISION
                   ,case when ev.LAST_DECISION is null
                          then 'N'
                         when ev.LAST_DECISION in ('Аннулирование СС', 'Отмена решения о признании КГ', 'Нахождение ТС', 'Отказ в выплате')
                          then 'N'
                         when ev.INSURANCE_EVENT = 'Мошенничество'
                          then 'N'
                         else 'Y'
                    end INSURANCE_EVENT_FLG
                         
             from (
             select /*+ no_merge */
                    c.contract_root_key
                   ,min(ev.event_date) INSURANCE_EVENT_DT
                   ,min(ev.insurance_event) keep (dense_rank first order by ev.event_date desc) INSURANCE_EVENT
                   ,max(dc.decision_date) LAST_DECISION_DT
                   ,max(dc.decision) keep (dense_rank first order by dc.decision_date asc nulls last) LAST_DECISION
             from (select /*+ no_merge */
                          CONNECT_BY_ROOT contract_key as contract_root_key, level rehiring_level
                        , CONNECT_BY_ISLEAF  as rehiring_LEAF_flg
                        , t.*
                   from (select *
                         from dwh.contracts c
                         where c.valid_to_dttm = date '2400-01-01'
                           and nvl(c.delete_flg,0) != 1
                           and c.contract_kind_key = 4
                        ) t
                   start with t.contract_rehiring_key is null
                   connect  by t.contract_rehiring_key = prior t.contract_key
                  )c
                    join DWH.INSURANCE_EVENTS ev on ev.contract_key = c.contract_key
                                                and ev.valid_to_dttm = date '2400-01-01'
               left join DWH.INSURANCE_DECISION dc on dc.contract_key = c.contract_key
                                                  and dc.valid_to_dttm = date '2400-01-01'
             group by c.contract_root_key)ev
            )ev on c.contract_root_key = ev.contract_root_key
where c.open_dt <= p_date
  and p_date between c.begin_dt and c.end_dt;

  dm.u_log('DM.PKG_VINTAGE','VINTAGE_calc/insert into dm.vintage',sql%rowcount||' row(s) inserted; p_date = '||to_char(p_date,'dd-mm-yyyy'));
  commit;

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('vintage')
                               ,estimate_percent => 10);
  dm.u_log('DM.PKG_VINTAGE','VINTAGE_calc/insert into dm.vintage','Статистика собрана');
  
  delete /*+ bind_aware */from dm.vintage_ where snapshot_dt = p_date;
  insert into dm.vintage_ (snapshot_dt, contract_root_key, age, bal_rur_amt,
                           ovd_cgp_days, ovd_msfo_days, ovd_cgpwm_days)
  select p_date  snapshot_dt,
         v.contract_root_key,
         v.age,
         v.bal_rur_amt,
         v.ovd_cgp_days,
         v.ovd_msfo_days,
         v.ovd_cgpwm_days
  from dm.vintage v
  where v.snapshot_dt = p_date;
  
  dm.u_log('DM.PKG_VINTAGE','VINTAGE_calc/insert into dm.vintage_',sql%rowcount||' row(s) inserted; p_date = '||to_char(p_date,'dd-mm-yyyy'));
  commit;

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('vintage_')
                               ,estimate_percent => 10);
  dm.u_log('DM.PKG_VINTAGE','VINTAGE_calc/insert into dm.vintage_','Статистика собрана');
  
 exception
   when others
   then dm.u_log('DM.PKG_VINTAGE','VINTAGE_calc/error','Ошибка при расчёте даты '||to_char(p_date,'dd-mm-yyyy')||' '||sqlerrm);
        gv_exc_flag := 'N';
        raise;
 end VINTAGE_calc;


 --Основная процедура расчёта винтажа
 procedure main(p_start_date in date
               ,p_end_date   in date)
 is
   v_DEFAULT_REGISTRY_min_date date;
   v_DEFAULT_REGISTRY_date date;
 begin
   dm.u_log('DM.PKG_VINTAGE','main/BEGIN','Начало расчёта по винтажу');
   dm.u_log('DM.PKG_VINTAGE','main/PARAM','p_start_date = '||to_char(p_start_date,'dd-mm-yyyy')||'; p_end_date = '||to_char(p_end_date,'dd-mm-yyyy'));



   select /* index_ffs(dr) */
          min(dr.report_dt)
   into v_DEFAULT_REGISTRY_min_date
   from DWH.DEFAULT_REGISTRY dr;
   
   for c in (select c.day
             from DWH.RPT_CALENDAR c
             where c.lastdayofmonth_flag = 'Y'
               and c.day between p_start_date and p_end_date
             order by c.day asc
             )
   loop
     v_DEFAULT_REGISTRY_date := case when c.day <= v_DEFAULT_REGISTRY_min_date then v_DEFAULT_REGISTRY_min_date else c.day end;
     VINTAGE_calc(p_date => c.day
                 ,p_DEFAULT_REGISTRY_date => v_DEFAULT_REGISTRY_date);
   end loop;

   dm.u_log('DM.PKG_VINTAGE','main/END','Винтаж с '||to_char(p_start_date,'dd-mm-yyyy')||' по '||to_char(p_end_date,'dd-mm-yyyy')||' расчитан');

 exception
   when others
   then if gv_exc_flag = 'Y' then
        dm.u_log('DM.PKG_VINTAGE','main/error',sqlerrm);
        end if;
        raise;

 end main;





 --Разовая процедура заполнения данных по сделкам до МСФО (2018 год)
 --процедура не пожет радботать в параллельном режиме, но проверку на повторный запуск не проводим
 procedure before2018_fill(p_file_name in varchar2)
 is
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
--  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
---
  v_file_id constant number := etl.sq_input_file.nextval; 
  v_error constant varchar2(100) := 'Ошибка. Файл не загружен.';
 begin
   dm.u_log('DM.PKG_VINTAGE','before2018_fill/BEGIN','Начало загрузки данных по сделкам до МСФО(2018) из excel файла для винтажа');
   dm.u_log('DM.PKG_VINTAGE','before2018_fill/PARAM','p_file_name = '||p_file_name);


  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select v_file_id as FILE_ID,
         user as USER_NAM,
         sysdate  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'VINTAGE' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         null as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;






 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'BALANCE_MSFO_BEFORE2018_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'BALANCE_MSFO_BEFORE2018_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_DIR__BAD_FILE', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

--
--  v_locked_file := p_file_name;
--  v_File_4 := UTL_FILE.FOPEN ('STG_XLS_DIR', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_VINTAGE','before2018_fill/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


--
 declare
 -- Сохранение excel файла в БД
 v_blob blob;
 v_bfile bfile := bfilename('STG_XLS_DIR',convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'));
 v_dest_offset number := 1;
 v_src_offset  number := 1;
 v_mime_type varchar2(255);
 not_exists exception;
 pragma exception_init(not_exists,-22288); -- Файл не найден
 
 begin

  --UTL_FILE.fclose(v_File_4);--Закрываем файл
  
  dbms_lob.fileopen(v_bfile);
  
  dbms_lob.createtemporary(v_blob,false);
  
  dbms_lob.loadblobfromfile(dest_lob    /*IN OUT NOCOPY  BLOB*/=>v_blob,
                            src_bfile   /*IN             BFILE*/=>v_bfile,
                            amount      /*IN             INTEGER*/=>dbms_lob.lobmaxsize,
                            dest_offset /*IN OUT         INTEGER*/=>v_dest_offset,
                            src_offset  /*IN OUT         INTEGER*/=>v_src_offset);
  
  dbms_lob.filecloseall;

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = v_file_id;
  commit;

  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\PAYMENTS_NARR');



 exception
   when not_exists then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Файл D:\VTBL\XLS\'||p_file_name||' не найден на сервере '); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при сохранении excel файла в БД '||sqlerrm); 
                    if dbms_lob.fileisopen(v_bfile) = 1 then dbms_lob.filecloseall; end if;
                    gv_exc_flag := 'N'; 
                    raise;
 end;

---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в BALANCE_MSFO_BEFORE2018_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS'
                      ,p_to_csv_name => 'BALANCE_MSFO_BEFORE2018_STG.csv'
                      );
   dm.u_log('DM.PKG_VINTAGE','before2018_fill/create csv','csv файл BALANCE_MSFO_BEFORE2018_STG.csv создан');
 
   -- Cтатистику соберём после закрытия bad файла

 exception
   when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при создании csv файла BALANCE_MSFO_BEFORE2018_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---
 begin
  -- Загрузка таблицы dwh.balance_msfo_before2018
  execute immediate 'truncate table dwh.balance_msfo_before2018';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'BALANCE_MSFO_BEFORE2018_STG');

insert into dwh.balance_msfo_before2018 (report_dt, contract_key, nil_rur_amt, overdue_rur_amt)
with
msfo as (
select t.contract_num
      ,t.report_dt
      ,t.nil_rur_amt
      ,t.overdue_rur_amt
from DWH.BALANCE_MSFO_BEFORE2018_STG
unpivot --INCLUDE NULLS
(
  (nil_rur_amt,overdue_rur_amt)
  for
  report_dt in (
         (nil_2012_06_01,overdue_2012_06_01) as add_months(date '2012-05-01',1),
         (nil_2012_07_01,overdue_2012_07_01) as add_months(date '2012-05-01',2),
         (nil_2012_08_01,overdue_2012_08_01) as add_months(date '2012-05-01',3),
         (nil_2012_09_01,overdue_2012_09_01) as add_months(date '2012-05-01',4),
         (nil_2012_10_01,overdue_2012_10_01) as add_months(date '2012-05-01',5),
         (nil_2012_11_01,overdue_2012_11_01) as add_months(date '2012-05-01',6),
         (nil_2012_12_01,overdue_2012_12_01) as add_months(date '2012-05-01',7),
         (nil_2013_01_01,overdue_2013_01_01) as add_months(date '2012-05-01',8),
         (nil_2013_02_01,overdue_2013_02_01) as add_months(date '2012-05-01',9),
         (nil_2013_03_01,overdue_2013_03_01) as add_months(date '2012-05-01',10),
         (nil_2013_04_01,overdue_2013_04_01) as add_months(date '2012-05-01',11),
         (nil_2013_05_01,overdue_2013_05_01) as add_months(date '2012-05-01',12),
         (nil_2013_06_01,overdue_2013_06_01) as add_months(date '2012-05-01',13),
         (nil_2013_07_01,overdue_2013_07_01) as add_months(date '2012-05-01',14),
         (nil_2013_08_01,overdue_2013_08_01) as add_months(date '2012-05-01',15),
         (nil_2013_09_01,overdue_2013_09_01) as add_months(date '2012-05-01',16),
         (nil_2013_10_01,overdue_2013_10_01) as add_months(date '2012-05-01',17),
         (nil_2013_11_01,overdue_2013_11_01) as add_months(date '2012-05-01',18),
         (nil_2013_12_01,overdue_2013_12_01) as add_months(date '2012-05-01',19),
         (nil_2014_01_01,overdue_2014_01_01) as add_months(date '2012-05-01',20),
         (nil_2014_02_01,overdue_2014_02_01) as add_months(date '2012-05-01',21),
         (nil_2014_03_01,overdue_2014_03_01) as add_months(date '2012-05-01',22),
         (nil_2014_04_01,overdue_2014_04_01) as add_months(date '2012-05-01',23),
         (nil_2014_05_01,overdue_2014_05_01) as add_months(date '2012-05-01',24),
         (nil_2014_06_01,overdue_2014_06_01) as add_months(date '2012-05-01',25),
         (nil_2014_07_01,overdue_2014_07_01) as add_months(date '2012-05-01',26),
         (nil_2014_08_01,overdue_2014_08_01) as add_months(date '2012-05-01',27),
         (nil_2014_09_01,overdue_2014_09_01) as add_months(date '2012-05-01',28),
         (nil_2014_10_01,overdue_2014_10_01) as add_months(date '2012-05-01',29),
         (nil_2014_11_01,overdue_2014_11_01) as add_months(date '2012-05-01',30),
         (nil_2014_12_01,overdue_2014_12_01) as add_months(date '2012-05-01',31),
         (nil_2015_01_01,overdue_2015_01_01) as add_months(date '2012-05-01',32),
         (nil_2015_02_01,overdue_2015_02_01) as add_months(date '2012-05-01',33),
         (nil_2015_03_01,overdue_2015_03_01) as add_months(date '2012-05-01',34),
         (nil_2015_04_01,overdue_2015_04_01) as add_months(date '2012-05-01',35),
         (nil_2015_05_01,overdue_2015_05_01) as add_months(date '2012-05-01',36),
         (nil_2015_06_01,overdue_2015_06_01) as add_months(date '2012-05-01',37),
         (nil_2015_07_01,overdue_2015_07_01) as add_months(date '2012-05-01',38),
         (nil_2015_08_01,overdue_2015_08_01) as add_months(date '2012-05-01',39),
         (nil_2015_09_01,overdue_2015_09_01) as add_months(date '2012-05-01',40),
         (nil_2015_10_01,overdue_2015_10_01) as add_months(date '2012-05-01',41),
         (nil_2015_11_01,overdue_2015_11_01) as add_months(date '2012-05-01',42),
         (nil_2015_12_01,overdue_2015_12_01) as add_months(date '2012-05-01',43),
         (nil_2016_01_01,overdue_2016_01_01) as add_months(date '2012-05-01',44),
         (nil_2016_02_01,overdue_2016_02_01) as add_months(date '2012-05-01',45),
         (nil_2016_03_01,overdue_2016_03_01) as add_months(date '2012-05-01',46),
         (nil_2016_04_01,overdue_2016_04_01) as add_months(date '2012-05-01',47),
         (nil_2016_05_01,overdue_2016_05_01) as add_months(date '2012-05-01',48),
         (nil_2016_06_01,overdue_2016_06_01) as add_months(date '2012-05-01',49),
         (nil_2016_07_01,overdue_2016_07_01) as add_months(date '2012-05-01',50),
         (nil_2016_08_01,overdue_2016_08_01) as add_months(date '2012-05-01',51),
         (nil_2016_09_01,overdue_2016_09_01) as add_months(date '2012-05-01',52),
         (nil_2016_10_01,overdue_2016_10_01) as add_months(date '2012-05-01',53),
         (nil_2016_11_01,overdue_2016_11_01) as add_months(date '2012-05-01',54),
         (nil_2016_12_01,overdue_2016_12_01) as add_months(date '2012-05-01',55),
         (nil_2017_01_01,overdue_2017_01_01) as add_months(date '2012-05-01',56),
         (nil_2017_02_01,overdue_2017_02_01) as add_months(date '2012-05-01',57),
         (nil_2017_03_01,overdue_2017_03_01) as add_months(date '2012-05-01',58),
         (nil_2017_04_01,overdue_2017_04_01) as add_months(date '2012-05-01',59),
         (nil_2017_05_01,overdue_2017_05_01) as add_months(date '2012-05-01',60),
         (nil_2017_06_01,overdue_2017_06_01) as add_months(date '2012-05-01',61),
         (nil_2017_07_01,overdue_2017_07_01) as add_months(date '2012-05-01',62),
         (nil_2017_08_01,overdue_2017_08_01) as add_months(date '2012-05-01',63),
         (nil_2017_09_01,overdue_2017_09_01) as add_months(date '2012-05-01',64),
         (nil_2017_10_01,overdue_2017_10_01) as add_months(date '2012-05-01',65),
         (nil_2017_11_01,overdue_2017_11_01) as add_months(date '2012-05-01',66),
         (nil_2017_12_01,overdue_2017_12_01) as add_months(date '2012-05-01',67))
        ) t
),

deal as (
select /*+ no_merge */
       nvl(c.rehiring_dt, date '0001-01-01') as begin_dt
      ,lead(c.rehiring_dt,1,date '2400-01-01') over (partition by c.contract_root_key order by nvl(c.rehiring_dt, date '0001-01-01') asc)-1 as  end_dt
      ,c.contract_num
      ,c.contract_key
      ,c.contract_root_key
      ,c.contract_id_cd
      ,c.client_key
      ,c.currency_key
      ,c.contract_cd
from (
      select /*+ no_merge */
             CONNECT_BY_ROOT contract_key as contract_root_key, level lvl, t.*
      from (select *
            from dwh.contracts c
            where c.valid_to_dttm = date '2400-01-01'
              and nvl(c.delete_flg,0) != 1
              and c.contract_kind_key = 4
           ) t
      start with t.contract_rehiring_key is null
      --and contract_key = 19478
      connect  by t.contract_rehiring_key = prior t.contract_key
     ) c
)


select t.report_dt,
       max(c.contract_key), 
       max(t.nil_rur_amt), 
       max(t.overdue_rur_amt)
from msfo t
   join deal c  on t.contract_num = c.contract_num
               and t.report_dt between c.begin_dt and end_dt
group by t.report_dt
        ,t.contract_num
;

  dm.u_log('DM.PKG_VINTAGE','before2018_fill/insert into DWH.BALANCE_MSFO_BEFORE2018',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => 'BALANCE_MSFO_BEFORE2018');
  dm.u_log('DM.PKG_VINTAGE','before2018_fill/insert into DWH.BALANCE_MSFO_BEFORE2018','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при загрузке DWH.BALANCE_MSFO_BEFORE2018 '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---
 --dbms_application_info.set_action(action_name => 'CHECK BAD FILE');
 declare
  exc_1 exception;
  exc_2 exception;
  exc_bad_rows exception;
  v_File UTL_FILE.FILE_TYPE;
  v_bad_rows varchar2(3000);
 begin
   -- Критические ККД
  UTL_FILE.fclose(v_File_3);--Закрываем файл
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'BALANCE_MSFO_BEFORE2018_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме чтения
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'BALANCE_MSFO_BEFORE2018_STG_BAD.bad'
                 ,dest_location => 'CSV_DIR__BAD_FILE'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_VINTAGE','before2018_fill/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_VINTAGE','before2018_fill/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 -- ККД
 begin

insert into ETL.load_log_detail_apex (LOG_DETAIL_KEY,
                                      FILE_ID,
                                      ROW_NUMBER,
                                      CODE,
                                      TEXT,
                                      DESCRIPTION,
                                      ERROR_FLG,
                                      VISIBLE)

select /*+ use_hash(t c) */
       ETL.s_load_log_detail_apex.NEXTVAL LOG_DETAIL_KEY,
       v_file_id  as FILE_ID,
       t.rn,
       'kkd_1'  as code,
       'Нет договора' as text,
       '№ договора: '||t.contract_num  as description,
       0 Error_flg,
       1 Visible
from (select /*+ no_merge */rownum rn ,t.contract_num from DWH.BALANCE_MSFO_BEFORE2018_STG t ) t
  left join (select *
             from dwh.contracts c
             where c.valid_to_dttm = date '2400-01-01'
               and nvl(c.delete_flg,0) != 1
               and c.contract_kind_key = 4
            ) c   on t.contract_num = c.contract_num
where c.contract_num is null;
 
  dm.u_log('DM.PKG_VINTAGE','before2018_fill/ККД: insert into ETL.load_log_detail_apex',sql%rowcount||' row(s) inserted');
  dm.u_log('DM.PKG_VINTAGE','before2018_fill/ККД: insert into ETL.load_log_detail_apex','FILE_ID = '||v_file_id);

  commit;

  dbms_stats.gather_table_stats(ownname => 'ETL'
                               ,tabname => upper('load_log_detail_apex'));
  dm.u_log('DM.PKG_VINTAGE','before2018_fill/insert into ETL.load_log_detail_apex','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_VINTAGE','before2018_fill/error','Ошибка при проверке ККД'||sqlerrm); gv_exc_flag := 'N'; raise;
 end user_kkd;
---


  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = v_file_id;
  commit;


 exception
   when others
   then UTL_FILE.FCLOSE_all;


        update ETL.LOAD_LOG_APEX
        set END_DT = sysdate,
            STATUS_DESC = v_error,
            STATUS_CD = '-21'
        where FILE_ID = v_file_id;
        commit;

        if gv_exc_flag = 'Y' then
        dm.u_log('DM.PKG_VINTAGE','before2018_fill/error',sqlerrm);
        end if;
        raise;

 end before2018_fill;

end PKG_VINTAGE;

/
