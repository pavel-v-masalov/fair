CREATE OR REPLACE package    PKG_DM_PAYMENTS_NARR as

 procedure main(p_date in date
               ,p_file_name in varchar2);

end Pkg_DM_PAYMENTS_NARR;

/


CREATE OR REPLACE package body    PKG_DM_PAYMENTS_NARR as

 gv_snapshot_dt constant date := sysdate;
 gv_file_id constant number := etl.sq_input_file.nextval;
 gv_error constant varchar2(100) := 'Ошибка. Файл не загружен.';
 gv_exc_flag char(1) := 'Y'; --Исключение не обработано?
 gv_rub_key number;

 procedure payments_calc(p_date in date)
 as
 begin
   dm.u_log('DM.PKG_DM_PAYMENTS_NARR','CALC/BEGIN','Начало формирования платежей по договорам');
   dbms_application_info.set_action(action_name => 'payments_calc');
   
   execute immediate 'truncate table DM.DM_PAYMENTS_NARR';
   
   
insert into DM.DM_PAYMENTS_NARR (SNAPSHOT_DT, START_PMNT_DT, CONTRACT_KEY, CONTRACT_NUM, CONTRACT_NUM_FULL,
CURRENCY_LETTER_CD_2, CURRENCY_KEY_2, CONTRACT_FIN_KIND_DESC, CONTRACT_KIND_RU_NAM, CONTRACT_KIND_KEY, AUTO_FLG,
BRANCH_NAM, BRANCH_KEY, CLIENT_KEY, CLIENT_ID, SHORT_CLIENT_RU_NAM, CLIENT_CD, INN, CONTRACT_ID_CD, REHIRING_FLG,
CURRENCY_LETTER_CD, CURRENCY_KEY, CBC_DESC, CBC_NAM, PAYMENTS_ITEM_KEY, PAYMENT_ITEM_NAM, PAY_DT, PAY_AMT,
EXCHANGE_RATE, PAY_AMT_CONTR_YNDS, CONTRACT_VAT_RATE, LAST_CHANGE_DT, PAY_AMT_CONTR_NNDS, DELETE_FLG,
org_structure_owner)

with
contract as (
select c.contract_key, c.contract_num, c.currency_key, c.contract_kind_key, c.branch_key, c.client_key
     , c.contract_id_cd, c.rehiring_flg, c.contract_vat_rate, c.valid_from_dttm, c.delete_flg
from dwh.contracts  c
where c.valid_to_dttm = date '2400-01-01'
  and c.contract_key in (select t.contract_key
                         from DWH.REQ_PAYMENTS_UNLOAD t
                         where t.selection_method in ('по договору', 'по договору и контрагенту')
                           and t.contract_key is not null)
union

select c.contract_key, c.contract_num, c.currency_key, c.contract_kind_key, c.branch_key, c.client_key
     , c.contract_id_cd, c.rehiring_flg, c.contract_vat_rate, c.valid_from_dttm, c.delete_flg
from dwh.contracts  c
where c.valid_to_dttm = date '2400-01-01'
  and c.client_key in (select t.client_key
                       from DWH.REQ_PAYMENTS_UNLOAD t
                       where t.selection_method in ('по контрагенту')
                         and t.client_key is not null)
)




select 
gv_snapshot_dt  as SNAPSHOT_DT,
p_date  as START_PMNT_DT,
c.contract_key  as CONTRACT_KEY,
c.contract_num  as CONTRACT_NUM,
lc.name  as CONTRACT_NUM_FULL,
c_cur.currency_letter_cd  as CURRENCY_LETTER_CD_2,
c.currency_key  as CURRENCY_KEY_2,
lc.contract_fin_kind_desc  as CONTRACT_FIN_KIND_DESC,
ck.contract_kind_ru_nam  as CONTRACT_KIND_RU_NAM,
c.contract_kind_key  as CONTRACT_KIND_KEY,
lc.auto_flg  as AUTO_FLG,
os.branch_nam  as BRANCH_NAM,
c.branch_key  as BRANCH_KEY,
c.client_key  as CLIENT_KEY,
cl.client_id  as CLIENT_ID,
cl.short_client_ru_nam  as SHORT_CLIENT_RU_NAM,
cl.client_cd  as CLIENT_CD,
cl.inn  as INN,
c.contract_id_cd  as CONTRACT_ID_CD,
c.rehiring_flg  as REHIRING_FLG,
p_cur.currency_letter_cd  as CURRENCY_LETTER_CD,
p.currency_key  as CURRENCY_KEY,
p.cbc_desc  as CBC_DESC,
cbc.cbc_nam  as CBC_NAM,
p.payment_item_key  as PAYMENTS_ITEM_KEY,
pi.payment_item_nam  as PAYMENT_ITEM_NAM,
nvl(p.real_pay_dt, p.pay_dt)  as PAY_DT,
p.pay_amt  as PAY_AMT,
1/(nullif(rt_p.exchange_rate,0)/nullif(rt_c.exchange_rate,0))  as EXCHANGE_RATE,
p.pay_amt*nullif(rt_p.exchange_rate,0)/nullif(rt_c.exchange_rate,0)  as PAY_AMT_CONTR_YNDS,
c.contract_vat_rate  as CONTRACT_VAT_RATE,
c.valid_from_dttm  as LAST_CHANGE_DT,
p.pay_amt*nullif(rt_p.exchange_rate,0)/nullif(rt_c.exchange_rate,0)*(1-c.contract_vat_rate)  as PAY_AMT_CONTR_NNDS,
c.delete_flg  as DELETE_FLG,
os.owner  as org_structure_owner
from dwh.fact_real_payments p
  join contract c  on p.contract_key = c.contract_key
  left join dwh.leasing_contracts lc on c.contract_key = lc.contract_key
                                    and lc.valid_to_dttm = date '2400-01-01'
  left join dwh.currencies c_cur  on c.currency_key = c_cur.currency_key
                                 and c_cur.valid_to_dttm = date '2400-01-01'
                                 and c_cur.end_dt = date '2099-12-31' -- !!!
  left join dwh.contract_kinds ck  on c.contract_kind_key = ck.contract_kind_key
  left join dwh.org_structure os  on c.branch_key = os.branch_key
                                 and os.valid_to_dttm = date '2400-01-01'
  left join dwh.clients cl  on c.client_key = cl.client_key
                           and cl.valid_to_dttm = date '2400-01-01'
  left join dwh.currencies p_cur  on p.currency_key = p_cur.currency_key
                                 and p_cur.valid_to_dttm = date '2400-01-01'
                                 and p_cur.end_dt = date '2099-12-31' -- !!!
  left join dwh.ref_cbc cbc  on p.cbc_desc = cbc.cbc_cd
  left join dwh.payment_items pi  on p.payment_item_key = pi.payment_item_key
                                 and pi.valid_to_dttm = date '2400-01-01'
  left join (select rt.currency_key
                   --,max(rt.ex_rate_dt) as ex_rate_dt
                   ,max(rt.exchange_rate) keep (dense_rank first order by ex_rate_dt desc)  as exchange_rate
             from dwh.exchange_rates rt
             where rt.valid_to_dttm = date '2400-01-01'
               and rt.ex_rate_dt <= trunc(gv_snapshot_dt)
               and rt.base_currency_key = gv_rub_key
             group by rt.currency_key
            ) rt_p  on p.currency_key = rt_p.currency_key
    left join (select rt.currency_key
                   --,max(rt.ex_rate_dt) as ex_rate_dt
                   ,max(rt.exchange_rate) keep (dense_rank first order by ex_rate_dt desc)  as exchange_rate
             from dwh.exchange_rates rt
             where rt.valid_to_dttm = date '2400-01-01'
               and rt.ex_rate_dt <= trunc(gv_snapshot_dt)
               and rt.base_currency_key = gv_rub_key
             group by rt.currency_key
            ) rt_c  on c.currency_key = rt_c.currency_key
where p.valid_to_dttm = date '2400-01-01'
  and nvl(p.real_pay_dt, p.pay_dt) >= p_date;

  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','CALC/insert into DM.DM_PAYMENTS_NARR',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DM'
                               ,tabname => upper('DM_PAYMENTS_NARR'));
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','CALC/insert into DM.DM_PAYMENTS_NARR','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','CALC/error','Ошибка расчёте DM.DM_PAYMENTS_NARR'||sqlerrm); gv_exc_flag := 'N'; raise;
 end payments_calc;



 procedure user_kkd
 as
 begin
   dm.u_log('DM.PKG_DM_PAYMENTS_NARR','USER_KKD/BEGIN','Начало проверки пользовательских ККД');
   dbms_application_info.set_action(action_name => 'user_kkd');
 
insert into ETL.load_log_detail_apex (LOG_DETAIL_KEY,
                                      FILE_ID,
                                      ROW_NUMBER,
                                      CODE,
                                      TEXT,
                                      DESCRIPTION,
                                      ERROR_FLG,
                                      VISIBLE)
with

kkd_1 as (
select distinct
       t.row_number,
       'kkd_1'  as code,
       'Не верный способ отбора' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) not in ('по договору','по контрагенту','по договору и контрагенту')
),

kkd_2 as (
select distinct
       t.row_number,
       'kkd_22'  as code,
       'Не заполнен ID контрагента' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по контрагенту')
  and t.client_id is null
),

kkd_3 as (
select distinct
       t.row_number,
       'kkd_3'  as code,
       'Не заполнены данные договора' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по договору')
  and t.contract_id_cd is null
  and t.contract_num is null
  and t.contract_num_full is null
),

kkd_4 as (
select distinct
       t.row_number,
       'kkd_4'  as code,
       'Не заполнены данные договора/ID контрагента' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по договору и контрагенту')
  and (  (t.contract_id_cd is null
      and t.contract_num is null
      and t.contract_num_full is null) 
    or   (t.client_id is null)
      )-- как в kkd_7 только с без not
),


kkd_5 as (
select distinct
       t.row_number,
       'kkd_5'  as code,
       'Не найдено ни одного договора по контрагенту' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по контрагенту')
  and t.client_id is not null
  and t.client_key is null
),

kkd_6 as (
select distinct
       t.row_number,
       'kkd_6'  as code,
       'Не найдено ни одного договора по договорам' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по договору')
  and not(t.contract_id_cd is null and t.contract_num is null and t.contract_num_full is null)
  and t.contract_key is null
),

kkd_7 as (
select distinct
       t.row_number,
       'kkd_7'  as code,
       'Не найдено ни одного договора по договорам и контрагенту' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по договору и контрагенту')
  and not (  (t.contract_id_cd is null
          and t.contract_num is null
          and t.contract_num_full is null) 
        or   (t.client_id is null)
          )-- как в kkd_4 только с not
  and t.contract_key is null
),

kkd_8 as (
select 
       t.row_number,
       'kkd_8'  as code,
       'Найдено более одного договора' as text,
       'Способ отбора: '||t.selection_method||
       '; ID договора: '||t.contract_id_cd||
       '; № договора: '||t.contract_num||
       '; Полный № договора: '||t.contract_num_full||
       '; ID контрагента:'||t.client_id  as description,
       0 Error_flg,
       1 Visible
from DWH.REQ_PAYMENTS_UNLOAD t
where lower(rtrim(t.selection_method)) in ('по договору','по контрагенту','по договору и контрагенту')
group by t.row_number,t.selection_method,t.contract_id_cd,t.contract_num,t.contract_num_full,t.client_id
having count(*)>1
)

select ETL.s_load_log_detail_apex.NEXTVAL LOG_DETAIL_KEY,
       gv_file_id  as FILE_ID,
       kkd.ROW_NUMBER,
       kkd.CODE,
       kkd.TEXT,
       kkd.DESCRIPTION,
       kkd.ERROR_FLG,
       kkd.VISIBLE
from (select * from kkd_1 union all
      select * from kkd_2 union all
      select * from kkd_3 union all
      select * from kkd_4 union all
      select * from kkd_5 union all
      select * from kkd_6 union all
      select * from kkd_7 union all
      select * from kkd_8 --union all
     ) kkd;
 
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','USER_KKD/insert into ETL.load_log_detail_apex',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'ETL'
                               ,tabname => upper('load_log_detail_apex'));
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','USER_KKD/insert into ETL.load_log_detail_apex','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','USER_KKD/error','Ошибка при проверке пользовательских ККД'||sqlerrm); gv_exc_flag := 'N'; raise;
 end user_kkd;


 procedure load_excel(p_file_name_full in varchar2
                     ,p_file_name in varchar2)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/BEGIN','Начало загрузки фактических платежей из excel файла');
   dbms_application_info.set_action(action_name => 'load_excel');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'REQ_PAYMENTS_UNLOAD_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'REQ_PAYMENTS_UNLOAD_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__PAYMENTS_NARR', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__PAYMENTS_NARR', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\PAYMENTS_NARR
 v_blob blob;
 v_mime_type varchar2(255);
 begin

  SELECT t.blob_content, t.mime_type
  into v_blob, v_mime_type
  FROM apex_application_temp_files t
       --WWV_FLOW_FILE_OBJECTS$ t
  WHERE t.name = p_file_name_full
    and rownum = 1;



  UTL_FILE.fclose(v_File_4);--Закрываем файл
  dwh.pkg_lob2file.prc_load_lob2file(p_file_lob  => v_blob
                                    ,p_file_path => 'XLS_DIR__PAYMENTS_NARR'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\PAYMENTS_NARR');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\PAYMENTS_NARR\'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\PAYMENTS_NARR '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в REQ_PAYMENTS_UNLOAD_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\PAYMENTS_NARR'
                      ,p_to_csv_name => 'REQ_PAYMENTS_UNLOAD_STG.csv'
                      );
   dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/create csv','csv файл REQ_PAYMENTS_UNLOAD_STG.csv создан');
 
   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при создании csv файла REQ_PAYMENTS_UNLOAD_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.REQ_PAYMENTS_UNLOAD_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'REQ_PAYMENTS_UNLOAD_STG');

  insert into DWH.REQ_PAYMENTS_UNLOAD_PROC
  select rownum+2 /*skip 2 во внешней таблице*/ ROW_NUMBER,
         s.BRANCH_NAM,
         s.SELECTION_METHOD,
         s.CONTRACT_ID_CD,
         s.CONTRACT_NUM,
         s.CONTRACT_NUM_FULL,
         s.CLIENT_ID,
         s.SHORT_CLIENT_RU_NAM
  from DWH.REQ_PAYMENTS_UNLOAD_STG s;

  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/insert into DWH.REQ_PAYMENTS_UNLOAD_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('REQ_PAYMENTS_UNLOAD_PROC'));
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/insert into DWH.REQ_PAYMENTS_UNLOAD_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при загрузке DWH.REQ_PAYMENTS_UNLOAD_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'REQ_PAYMENTS_UNLOAD_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'REQ_PAYMENTS_UNLOAD_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__PAYMENTS_NARR'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\PAYMENTS_NARR\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
  --Загружаем таблицу DWH.REQ_PAYMENTS_UNLOAD
  declare
  begin
  execute immediate 'truncate table DWH.REQ_PAYMENTS_UNLOAD';

  insert into DWH.REQ_PAYMENTS_UNLOAD
with
CONTRACT as (
select row_number, max(selection_method)  as selection_method, contract_key, max(client_key)  as client_key
from (
select p.row_number, p.selection_method, c.contract_key, c.client_key
from DWH.REQ_PAYMENTS_UNLOAD_PROC p
   join DWH.CONTRACTS c on p.contract_id_cd = c.contract_id_cd
                       and c.valid_to_dttm = date '2400-01-01'
                       and lower(rtrim(p.selection_method)) in ('по договору и контрагенту','по договору')
union all
select p.row_number, p.selection_method, c.contract_key, c.client_key
from DWH.REQ_PAYMENTS_UNLOAD_PROC p
   join DWH.CONTRACTS c on p.contract_num = c.contract_num
                        and c.valid_to_dttm = date '2400-01-01'
                       and lower(rtrim(p.selection_method)) in ('по договору и контрагенту','по договору')
union all
select p.row_number, p.selection_method, c.contract_key, c.client_key
from DWH.REQ_PAYMENTS_UNLOAD_PROC p
   join DWH.LEASING_CONTRACTS c on p.contract_num_full = c.NAME
                               and c.valid_to_dttm = date '2400-01-01'
                               and lower(rtrim(p.selection_method)) in ('по договору и контрагенту','по договору'))
group by row_number, contract_key
),

CLIENT  as (
select p.row_number, max(p.selection_method)  as selection_method, cl.client_key
from DWH.REQ_PAYMENTS_UNLOAD_PROC p
  join DWH.CLIENTS cl on p.client_id = cl.client_id
                     and cl.valid_to_dttm = date '2400-01-01'
                     and lower(rtrim(p.selection_method)) in ('по договору и контрагенту','по контрагенту')
group by p.row_number, cl.client_key
),

CONTRACT_and_CLIENT  as (
select c.row_number, c.selection_method, contract_key, c.client_key
from  CONTRACT c
 join CLIENT   cl  on c.row_number = cl.row_number
                  and c.client_key = cl.client_key
                  and c.selection_method = 'по договору и контрагенту'
                  and cl.selection_method = 'по договору и контрагенту'

)

select gv_snapshot_dt  as SNAPSHOT_DT,
       p.ROW_NUMBER,
       p.BRANCH_NAM,
       p.SELECTION_METHOD,
       p.CONTRACT_ID_CD,
       p.CONTRACT_NUM,
       p.CONTRACT_NUM_FULL,
       p.CLIENT_ID,
       p.SHORT_CLIENT_RU_NAM,
       coalesce(c.contract_key,c_cl.contract_key)  as contract_key,
       coalesce(cl.client_key,c_cl.client_key)     as client_key
from DWH.REQ_PAYMENTS_UNLOAD_PROC p
  left join CONTRACT c on p.row_number = c.row_number
                       and c.selection_method = 'по договору'

  left join CLIENT cl on p.row_number = cl.row_number
                      and cl.selection_method = 'по контрагенту'
  
  left join CONTRACT_and_CLIENT c_cl on p.row_number = c_cl.row_number
                                      --and cl.selection_method = 'по контрагенту'
  
where 1=1;


  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/insert into DWH.REQ_PAYMENTS_UNLOAD',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('REQ_PAYMENTS_UNLOAD'));
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/insert into DWH.REQ_PAYMENTS_UNLOAD','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','LOAD_EXCEL/error','Ошибка при загрузке DWH.REQ_PAYMENTS_UNLOAD_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end load_excel;




--------------------------------------------
 procedure main(p_date in date
               ,p_file_name in varchar2)
 as
   v_lockname constant  varchar2(25 byte) := 'PKG_DM_PAYMENTS_NARR_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/BEGIN','Начало расчёта фактических платежей');
  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/PARAM','v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                                  'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_DM_PAYMENTS_NARR',action_name => 'main');
  dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  select max(c.currency_key)
  into gv_rub_key
  from dwh.currencies c
  where c.currency_letter_cd = 'RUB'
    and c.valid_to_dttm = date '2400-01-01'
    and p_date between c.begin_dt and c.end_dt;

   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error','Расчёт фактических платежей не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         /*p_date*/sysdate  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PAYMENTS_NARR' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         to_char(p_date, 'yyyy-mm-dd') as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  load_excel(p_file_name, v_file_name);

  user_kkd;
  
  payments_calc(nvl(p_date,date '1900-01-01'));

---
 -- Снимаем блокировку 'PKG_DM_PAYMENTS_NARR_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_DM_PAYMENTS_NARR','MAIN/END','Фактические платежи расчитаны');

 exception
   when others
   then v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
        UTL_FILE.FCLOSE_all;


        update ETL.LOAD_LOG_APEX
        set END_DT = sysdate,
            STATUS_DESC = gv_error,
            STATUS_CD = '-21'
        where FILE_ID = gv_file_id;
        commit;

        if gv_exc_flag = 'Y' then
        dm.u_log('DM.PKG_DM_PAYMENTS_NARR'
                             ,'MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end main;


end PKG_DM_PAYMENTS_NARR;

/
