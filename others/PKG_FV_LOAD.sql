create or replace package dm.PKG_FV_LOAD as

 procedure PD_EC_main(p_date in date
                     ,p_file_name in varchar2
                     ,p_comment in varchar2);

 procedure PD_CORP_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2);

 procedure REF_LGD_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2);

 procedure CURRATES_main(p_file_name in varchar2);

 procedure SCHEDULES_main(p_file_id in number
                         ,p_file_name in varchar2);

 procedure FV_MSFO_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2);

end PKG_FV_LOAD;
/
create or replace package body dm.PKG_FV_LOAD as

 gv_sysdate date;
 gv_file_id number;
 gv_error constant varchar2(100) := 'Ошибка. Файл не загружен.';
 gv_exc_flag char(1); --Исключение не обработано?
---------------------------------------------------------------
procedure PD_EC_user_kkd
 as
   exc_user_kkd  exception;
   v_err_row_cnt pls_integer;
 begin
   dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/BEGIN','Начало проверки пользовательских ККД');
   dbms_application_info.set_action(action_name => 'PD_EC_USER_KKD');

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
select t.row_number,
       'kkd_1'  as code,
       'Рейтинговая модель отсутствует в БД' as text,
       'Рейтинговая модель: '||t.rank_model  as description,
       1 Error_flg,
       1 Visible
from      DWH.PD_CORP_EC_PROC t
left join DWH.RATING_MODEL r on t.rank_model = r.name
                            and r.valid_to_dttm = date '2400-01-01'
                            and nvl(r.delete_flg,'0') != 1
where r.name is null
)

select ETL.s_load_log_detail_apex.NEXTVAL LOG_DETAIL_KEY,
       gv_file_id  as FILE_ID,
       kkd.ROW_NUMBER,
       kkd.CODE,
       kkd.TEXT,
       kkd.DESCRIPTION,
       kkd.ERROR_FLG,
       kkd.VISIBLE
from (select * from kkd_1--union all
     ) kkd;

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/insert into ETL.load_log_detail_apex',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'ETL'
                               ,tabname => upper('load_log_detail_apex'));
  dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/insert into ETL.load_log_detail_apex','Статистика собрана');



  select count(*)
  into v_err_row_cnt
  from ETL.load_log_detail_apex err
  where err.file_id = gv_file_id
    and err.error_flg = 1;

  if v_err_row_cnt > 0 then raise exc_user_kkd; end if;

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/insert into ETL.load_log_detail_apex','ККД пройдены');

  exception
    when exc_user_kkd then dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/error','Найдено '||v_err_row_cnt||' строк не прошедших ККД'); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_USER_KKD/error','Ошибка при проверке пользовательских ККД'||sqlerrm); gv_exc_flag := 'N'; raise;
 end PD_EC_user_kkd;

---

 procedure PD_EC_load_excel(p_file_name_full in varchar2
                           ,p_file_name in varchar2
                           ,p_date in date)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'PD_EC_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'PD_CORP_EC_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'PD_CORP_EC_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_PD_EC', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_PD_EC', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\PD_EC
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_PD_EC'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\PD_EC');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\PD_EC'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\PD_EC '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в PD_CORP_EC_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\PD_EC'
                      ,p_to_csv_name => 'PD_CORP_EC_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/create csv','csv файл PD_CORP_EC_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при создании csv файла PD_CORP_EC_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.PD_CORP_EC_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'PD_CORP_EC_STG');

  insert into DWH.PD_CORP_EC_PROC
  select rownum+2 /*skip 2 во внешней таблице*/ ROW_NUMBER,
         s.Rank_Model,
         s.Rat_On_Date,
         s.Pd
  from DWH.PD_CORP_EC_STG s;

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/insert into DWH.PD_CORP_EC_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('PD_CORP_EC_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/insert into DWH.PD_CORP_EC_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при загрузке DWH.PD_CORP_EC_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'PD_CORP_EC_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'PD_CORP_EC_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_PD_EC'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\PD_EC\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  PD_EC_user_kkd;

   dbms_application_info.set_action(action_name => 'PD_EC_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.PD_CORP_EC
  declare
  begin

  merge into DWH.PD_CORP_EC a
  using (
          select tp.tp, t.rowid row_id, t.*
          from DWH.PD_CORP_EC t
              ,(select 'U' tp from dual union all select 'I' from dual) tp
          where t.valid_to_dttm = date '2400-01-01'
            and not(t.end_dt < p_date)
        ) b
  on (a.rowid = b.row_id
  and b.tp = 'U')

  when matched then
    update set a.valid_to_dttm = gv_sysdate
  when not matched then
    insert (RATING_MODEL_KEY   ,RATING_MODEL   ,RAT_ON_DATE   ,PD   ,START_DT   ,END_DT   ,VALID_FROM_DTTM ,VALID_TO_DTTM   ,FILE_ID)
    values (b.RATING_MODEL_KEY ,b.RATING_MODEL ,b.RAT_ON_DATE ,b.PD ,b.START_DT ,p_date-1 ,gv_sysdate      ,b.VALID_TO_DTTM ,b.FILE_ID)
    where (b.START_DT < p_date and b.tp = 'I');

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/delete DWH.PD_CORP_EC',sql%rowcount||' row(s) updated');

  insert into DWH.PD_CORP_EC(RATING_MODEL_KEY, RATING_MODEL, RAT_ON_DATE, PD, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM, FILE_ID)
  select r.rating_model_key  as RATING_MODEL_KEY,
         p.rank_model        as RATING_MODEL,
         p.rat_on_date       as RAT_ON_DATE,
         p.pd                as PD,
         p_date              as START_DT,
         date '2400-01-01'   as END_DT,
         gv_sysdate          as VALID_FROM_DTTM,
         date '2400-01-01'   as VALID_TO_DTTM,
         gv_file_id          as FILE_ID
  from   DWH.PD_CORP_EC_PROC p
    join DWH.RATING_MODEL r on p.rank_model = r.name
                           and r.valid_to_dttm = date '2400-01-01'
                           and nvl(r.delete_flg,'0') != 1;


  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/insert into DWH.PD_CORP_EC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('PD_CORP_EC'));
  dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/insert into DWH.PD_CORP_EC','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_LOAD_EXCEL/error','Ошибка при загрузке DWH.PD_CORP_EC '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end PD_EC_load_excel;




--------------------------------------------
 procedure PD_EC_main(p_date in date
                     ,p_file_name in varchar2
                     ,p_comment in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_PD_EC_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/BEGIN','Начало загрузки PD для экономического капитала');
  dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/PARAM','v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                               'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'PD_EC_MAIN');
  dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         p_date  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_PD_EC' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         substr(p_comment,1,4000)  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  PD_EC_load_excel(p_file_name, v_file_name, p_date);

  --PD_EC_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_PD_EC_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','PD_EC_MAIN/END','Файл загружен');

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
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'PD_EC_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end PD_EC_main;


---------------------------------------------------


procedure PD_CORP_user_kkd
 as
   exc_user_kkd  exception;
   v_err_row_cnt pls_integer;
 begin
   dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/BEGIN','Начало проверки пользовательских ККД');
   dbms_application_info.set_action(action_name => 'PD_CORP_USER_KKD');

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
select t.row_number,
       'kkd_1'  as code,
       'Рейтинговая модель отсутствует в БД' as text,
       'Рейтинговая модель: '||t.rating_model  as description,
       1 Error_flg,
       1 Visible
from      DWH.PD_CORP_PROC t
left join DWH.RATING_MODEL r on t.rating_model = r.name
                            and r.valid_to_dttm = date '2400-01-01'
                            and nvl(r.delete_flg,'0') != 1
where r.name is null
)

select ETL.s_load_log_detail_apex.NEXTVAL LOG_DETAIL_KEY,
       gv_file_id  as FILE_ID,
       kkd.ROW_NUMBER,
       kkd.CODE,
       kkd.TEXT,
       kkd.DESCRIPTION,
       kkd.ERROR_FLG,
       kkd.VISIBLE
from (select * from kkd_1--union all
     ) kkd;

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/insert into ETL.load_log_detail_apex',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'ETL'
                               ,tabname => upper('load_log_detail_apex'));
  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/insert into ETL.load_log_detail_apex','Статистика собрана');

  select count(*)
  into v_err_row_cnt
  from ETL.load_log_detail_apex err
  where err.file_id = gv_file_id
    and err.error_flg = 1;

  if v_err_row_cnt > 0 then raise exc_user_kkd; end if;

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/insert into ETL.load_log_detail_apex','ККД пройдены');

  exception
    when exc_user_kkd then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/error','Найдено '||v_err_row_cnt||' строк не прошедших ККД'); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_USER_KKD/error','Ошибка при проверке пользовательских ККД'||sqlerrm); gv_exc_flag := 'N'; raise;
 end PD_CORP_user_kkd;

---

 procedure PD_CORP_load_excel(p_file_name_full in varchar2
                             ,p_file_name in varchar2
                             ,p_date in date)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'PD_CORP_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'PD_CORP_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'PD_CORP_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_PD_CORP', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_PD_CORP', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\PD_CORP
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_PD_CORP'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\PD_CORP');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\PD_CORP'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\PD_CORP '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в PD_CORP_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\PD_CORP'
                      ,p_to_csv_name => 'PD_CORP_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/create csv','csv файл PD_CORP_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при создании csv файла PD_CORP_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.PD_CORP_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'PD_CORP_STG');

  insert into DWH.PD_CORP_PROC
  select rownum+1 /*skip 1 во внешней таблице*/ ROW_NUMBER,
         s.rating_model,
         s.rat_on_date,
         s.pd1_macro,
         s.pd2_macro,
         s.pd3_macro,
         s.pd4_macro,
         s.pd5_macro,
         s.pd6_macro,
         s.pd7_macro,
         s.pd8_macro,
         s.pd9_macro,
         s.pd10_macro
  from DWH.PD_CORP_STG s;

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/insert into DWH.PD_CORP_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('PD_CORP_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/insert into DWH.PD_CORP_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при загрузке DWH.PD_CORP_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'PD_CORP_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'PD_CORP_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_PD_CORP'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\PD_CORP\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  PD_CORP_user_kkd;

   dbms_application_info.set_action(action_name => 'PD_CORP_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.PD_CORP
  declare
  begin

  merge into DWH.PD_CORP a
  using (
          select tp.tp, t.rowid row_id, t.*
          from DWH.PD_CORP t
              ,(select 'U' tp from dual union all select 'I' from dual) tp
          where t.valid_to_dttm = date '2400-01-01'
            and not(t.end_date < p_date)

        ) b
  on (a.rowid = b.row_id
  and b.tp = 'U')

  when matched then
    update set a.valid_to_dttm = gv_sysdate
  when not matched then
    insert (rank_model_key,rank_model,rat_on_date,pd1_macro,pd2_macro,pd3_macro,pd4_macro,pd5_macro,pd6_macro,pd7_macro,pd8_macro,pd9_macro,pd10_macro,valid_from_dttm,valid_to_dttm,
  st_date,/*pd1_marg,pd2_marg,pd3_marg,pd4_marg,pd5_marg,pd6_marg,pd7_marg,pd8_marg,pd9_marg,pd10_marg,*/end_date,file_id)
    values (b.rank_model_key, b.rank_model, b.rat_on_date, b.pd1_macro, b.pd2_macro, b.pd3_macro, b.pd4_macro, b.pd5_macro,
  b.pd6_macro, b.pd7_macro, b.pd8_macro, b.pd9_macro, b.pd10_macro, gv_sysdate, b.VALID_TO_DTTM, b.st_date, /*b.pd1_marg,
  b.pd2_marg, b.pd3_marg, b.pd4_marg, b.pd5_marg, b.pd6_marg, b.pd7_marg, b.pd8_marg, b.pd9_marg, b.pd10_marg,*/ p_date-1, b.file_id)
    where (b.st_date < p_date and b.tp = 'I');

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/delete DWH.PD_CORP',sql%rowcount||' row(s) updated');

  insert into DWH.PD_CORP(RANK_MODEL_KEY, RANK_MODEL, RAT_ON_DATE, PD1_MACRO, PD2_MACRO, PD3_MACRO, PD4_MACRO, PD5_MACRO, PD6_MACRO,
   PD7_MACRO, PD8_MACRO, PD9_MACRO, PD10_MACRO, VALID_FROM_DTTM, VALID_TO_DTTM, ST_DATE, /*PD1_MARG, PD2_MARG, PD3_MARG, PD4_MARG,
   PD5_MARG, PD6_MARG, PD7_MARG, PD8_MARG, PD9_MARG, PD10_MARG,*/ END_DATE, FILE_ID)
  select r.rating_model_key  as rank_model_key,
         p.rating_model      as rank_model,
         p.rat_on_date       as rat_on_date,
         p.pd1_macro,
         p.pd2_macro,
         p.pd3_macro,
         p.pd4_macro,
         p.pd5_macro,
         p.pd6_macro,
         p.pd7_macro,
         p.pd8_macro,
         p.pd9_macro,
         p.pd10_macro,
         gv_sysdate          as valid_from_dttm,
         date '2400-01-01'   as valid_to_dttm,
         p_date              as st_date,
         --virtual column p.pd1_macro as pd1_marg,
         --virtual column case when p.pd1_macro = 1 then 1 else p.pd2_macro - p.pd1_macro end  as pd2_marg,
         --virtual column case when p.pd2_macro = 1 then 1 else p.pd3_macro - p.pd2_macro end  as pd3_marg,
         --virtual column case when p.pd3_macro = 1 then 1 else p.pd4_macro - p.pd3_macro end  as pd4_marg,
         --virtual column case when p.pd4_macro = 1 then 1 else p.pd5_macro - p.pd4_macro end  as pd5_marg,
         --virtual column case when p.pd5_macro = 1 then 1 else p.pd6_macro - p.pd5_macro end  as pd6_marg,
         --virtual column case when p.pd6_macro = 1 then 1 else p.pd7_macro - p.pd6_macro end  as pd7_marg,
         --virtual column case when p.pd7_macro = 1 then 1 else p.pd8_macro - p.pd7_macro end  as pd8_marg,
         --virtual column case when p.pd8_macro = 1 then 1 else p.pd9_macro - p.pd8_macro end  as pd9_marg,
         --virtual column case when p.pd9_macro = 1 then 1 else p.pd10_macro- p.pd9_macro end  as pd10_marg,
         date '2400-01-01'   as end_date,
         gv_file_id          as file_id
  from   DWH.PD_CORP_PROC p
    join DWH.RATING_MODEL r on p.rating_model = r.name
                           and r.valid_to_dttm = date '2400-01-01'
                           and nvl(r.delete_flg,'0') != 1;


  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/insert into DWH.PD_CORP',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('PD_CORP'));
  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/insert into DWH.PD_CORP','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_LOAD_EXCEL/error','Ошибка при загрузке DWH.PD_CORP '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end PD_CORP_LOAD_excel;

--------------------------------------------

 procedure PD_CORP_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_PD_CORP_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/BEGIN','Начало загрузки PD для резервов');
  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/PARAM','v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                                 'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'PD_CORP_MAIN');
  dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         p_date  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_PD_CORP' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         substr(p_comment,1,4000)  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  PD_CORP_load_excel(p_file_name, v_file_name, p_date);

  --PD_CORP_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_PD_CORP_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','PD_CORP_MAIN/END','Файл загружен');

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
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'PD_CORP_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end PD_CORP_main;
---------------------------------------------------





 procedure REF_LGD_load_excel(p_file_name_full in varchar2
                             ,p_file_name in varchar2
                             ,p_date in date)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'REF_LGD_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'REF_LGD_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'REF_LGD_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_REF_LGD', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_REF_LGD', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\REF_LGD
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_REF_LGD'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\REF_LGD');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\REF_LGD'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\REF_LGD '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в REF_LGD_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\REF_LGD'
                      ,p_to_csv_name => 'REF_LGD_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/create csv','csv файл REF_LGD_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при создании csv файла REF_LGD_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.REF_LGD_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'REF_LGD_STG');

  insert into DWH.REF_LGD_PROC
  select rownum+1 /*skip 1 во внешней таблице*/ ROW_NUMBER,
         s.leasing_subject_type_cd,
         s.lgd
  from DWH.REF_LGD_STG s;

  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/insert into DWH.REF_LGD_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('REF_LGD_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/insert into DWH.REF_LGD_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при загрузке DWH.REF_LGD_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'REF_LGD_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'REF_LGD_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_REF_LGD'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\PD_CORP\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  --REF_LGD_user_kkd;

   dbms_application_info.set_action(action_name => 'REF_LGD_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.REF_LGD
  declare
  begin

  merge into DWH.REF_LGD a
  using (
          select tp.tp, t.rowid row_id, t.*
          from DWH.REF_LGD t
              ,(select 'U' tp from dual union all select 'I' from dual) tp
          where t.valid_to_dttm = date '2400-01-01'
            and not(t.end_dt < p_date)
        ) b
  on (a.rowid = b.row_id
  and b.tp = 'U')

  when matched then
    update set a.valid_to_dttm = gv_sysdate
  when not matched then
    insert (lgd_type_cd,   leasing_subject_type_cd,   lgd,   begin_dt,   end_dt,   valid_from_dttm, valid_to_dttm,   process_key,   file_id)
    values (b.lgd_type_cd, b.leasing_subject_type_cd, b.lgd, b.begin_dt, p_date-1, gv_sysdate,      b.valid_to_dttm, b.process_key, b.file_id)
    where (b.begin_dt < p_date and b.tp = 'I');

  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/delete DWH.REF_LGD',sql%rowcount||' row(s) updated');

  insert into DWH.REF_LGD(LGD_TYPE_CD, LEASING_SUBJECT_TYPE_CD, LGD, BEGIN_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM, PROCESS_KEY, FILE_ID)
  select 'RES'  as LGD_TYPE_CD, 
         p.LEASING_SUBJECT_TYPE_CD, 
         p.LGD, 
         p_date             as BEGIN_DT, 
         date '2400-01-01'  as END_DT, 
         gv_sysdate         as VALID_FROM_DTTM, 
         date '2400-01-01'  as VALID_TO_DTTM, 
         null               as PROCESS_KEY, 
         gv_file_id         as FILE_ID
  from   DWH.REF_LGD_PROC p;


  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/insert into DWH.REF_LGD',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('REF_LGD'));
  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/insert into DWH.REF_LGD','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_LOAD_EXCEL/error','Ошибка при загрузке DWH.REF_LGD '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end REF_LGD_load_excel;

--------------------------------------------
 procedure REF_LGD_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_REF_LGD_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/BEGIN','Начало загрузки справочника LGD');
  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/PARAM','v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                                 'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'REF_LGD_MAIN');
  dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         p_date  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_REF_LGD' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         substr(p_comment,1,4000)  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  REF_LGD_load_excel(p_file_name, v_file_name, p_date);

  --REF_LGD_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_REF_LGD_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','REF_LGD_MAIN/END','Файл загружен');

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
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'REF_LGD_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end REF_LGD_main;
---------------------------------------------------


procedure CURRATES_user_kkd
 as
   exc_user_kkd  exception;
   v_err_row_cnt pls_integer;
 begin
   dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/BEGIN','Начало проверки пользовательских ККД');
   dbms_application_info.set_action(action_name => 'CURRATES_USER_KKD');

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
select t.row_number,
       'kkd_1'  as code,
       'Недопустимое значение в поле Curr' as text,
       'Curr: '||t.curr  as description,
       1 Error_flg,
       1 Visible
from      DWH.CURRATES_PROC t
where nvl(t.curr,'NULL') not in ('RUB','USD','EUR') 
),

kkd_2 as (
select t.row_number,
       'kkd_2'  as code,
       'Недопустимое значение в поле RateName' as text,
       'RateName: '||t.ratename  as description,
       1 Error_flg,
       1 Visible
from      DWH.CURRATES_PROC t
where nvl(t.ratename,'NULL') not in ('arsfix','arsfloat') 
)

select ETL.s_load_log_detail_apex.NEXTVAL LOG_DETAIL_KEY,
       1  as FILE_ID,
       kkd.ROW_NUMBER,
       kkd.CODE,
       kkd.TEXT,
       kkd.DESCRIPTION,
       kkd.ERROR_FLG,
       kkd.VISIBLE
from (select * from kkd_1 union all
      select * from kkd_2--union all
     ) kkd;


  dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/insert into ETL.load_log_detail_apex',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'ETL'
                               ,tabname => upper('load_log_detail_apex'));
  dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/insert into ETL.load_log_detail_apex','Статистика собрана');

  select count(*)
  into v_err_row_cnt
  from ETL.load_log_detail_apex err
  where err.file_id = gv_file_id
    and err.error_flg = 1;

  if v_err_row_cnt > 0 then raise exc_user_kkd; end if;

  dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/insert into ETL.load_log_detail_apex','ККД пройдены');

  exception
    when exc_user_kkd then dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/error','Найдено '||v_err_row_cnt||' строк не прошедших ККД'); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_USER_KKD/error','Ошибка при проверке пользовательских ККД'||sqlerrm); gv_exc_flag := 'N'; raise;
 end CURRATES_user_kkd;

---

 procedure CURRATES_load_excel(p_file_name_full in varchar2
                              ,p_file_name in varchar2
                              /*,p_date in date*/)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'CURRATES_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'CURRATES_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'CURRATES_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_CURRATES', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_CURRATES', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\CURRATES
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_CURRATES'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\CURRATES');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\CURRATES'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\CURRATES '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в CURRATES_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\CURRATES'
                      ,p_to_csv_name => 'CURRATES_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/create csv','csv файл CURRATES_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при создании csv файла CURRATES_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.CURRATES_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'CURRATES_STG');

  insert into DWH.CURRATES_PROC
  select rownum+1 /*skip 1 во внешней таблице*/ ROW_NUMBER,
         s.denj,
         s.curr,
         s.ratename,
         s.rateperiod,
         s.ratt/100
  from DWH.CURRATES_STG s;

  dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/insert into DWH.CURRATES_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('CURRATES_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/insert into DWH.CURRATES_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при загрузке DWH.CURRATES_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'CURRATES_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'CURRATES_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_CURRATES'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\CURRATES\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  CURRATES_user_kkd;

   dbms_application_info.set_action(action_name => 'CURRATES_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.CURRATES
  declare
  begin

  merge into (select * from DWH.CURRATES where valid_to_dttm = date '2400-01-01') a
  using (
          select tp.tp, t.*
          from DWH.CURRATES_PROC t
              ,(select 'U' tp from dual union all select 'I' from dual) tp
        ) b
  on (a.denj = b.denj
  and a.curr = b.curr
  and a.ratename = b.ratename
  and a.rateperiod = b.rateperiod
  and b.tp = 'U')

  when matched then
    update set a.valid_to_dttm = gv_sysdate
  when not matched then
    insert (denj,   curr,   ratename,   rateperiod,   rate,   valid_from_dttm, valid_to_dttm,     file_id)
    values (b.denj, b.curr, b.ratename, b.rateperiod, b.ratt, gv_sysdate,      date '2400-01-01', gv_file_id)
    where (b.tp = 'I');

  dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/merge DWH.CURRATES',sql%rowcount||' row(s) updated');

  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('CURRATES'));
  dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/insert into DWH.CURRATES','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_LOAD_EXCEL/error','Ошибка при загрузке DWH.CURRATES '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end CURRATES_LOAD_excel;


--------------------------------------------
 procedure CURRATES_main(p_file_name in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_CURRATES_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/BEGIN','Начало загрузки ставок FTP');
  dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/PARAM',--'v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                                 'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'CURRATES_MAIN');
  --dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         /*p_date*/gv_sysdate  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_CURRATES' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         /*substr(p_comment,1,4000)*/null  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  CURRATES_load_excel(p_file_name, v_file_name/*, p_date*/);

  --CURRATES_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_CURRATES_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','CURRATES_MAIN/END','Файл загружен');

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
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'CURRATES_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end CURRATES_main;

---------------------------------------------------

 procedure SCHEDULES_load_excel(p_file_name_full in varchar2
                               ,p_file_name in varchar2
                               ,p_file_id in number)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'SCHEDULES_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'SCHEDULES_FOR_FV_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'SCHEDULES_FOR_FV_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_SCHEDULS', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_SCHEDULES', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\SCHEDULES
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_SCHEDULES'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\SCHEDULES');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\SCHEDULES'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = p_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\SCHEDULES '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в SCHEDULES_FOR_FV_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\SCHEDULES'
                      ,p_to_csv_name => 'SCHEDULES_FOR_FV_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/create csv','csv файл SCHEDULES_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при создании csv файла SCHEDULES_FOR_FV_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.SCHEDULES_FOR_FV_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'SCHEDULES_FOR_FV_STG');

  insert into DWH.SCHEDULES_FOR_FV_PROC
  select rownum+1 /*skip 1 во внешней таблице*/ ROW_NUMBER,
         s.date_from,
         s.date_to,
         s.loan_amt
  from DWH.SCHEDULES_FOR_FV_STG s;

  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/insert into DWH.SCHEDULES_FOR_FV_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('SCHEDULES_FOR_FV_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/insert into DWH.SCHEDULES_FOR_FV_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при загрузке DWH.SCHEDULES_FOR_FV_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'SCHEDULES_FOR_FV_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'SCHEDULES_FOR_FV_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_SCHEDULS'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\SCHEDULES\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  --SCHEDULES_user_kkd;

   dbms_application_info.set_action(action_name => 'SCHEDULES_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.SCHEDULES_FOR_FV
  declare
  begin

  insert into DWH.SCHEDULES_FOR_FV(CALCULATION_ID, DATE_FROM, DATE_TO, LOAN_AMT, FILE_ID)
  select p_file_id  as CALCULATION_ID,
         s.DATE_FROM,
         s.DATE_TO,
         s.LOAN_AMT,
         p_file_id  as FILE_ID
  from DWH.SCHEDULES_FOR_FV_PROC s;

  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/insert DWH.SCHEDULES_FOR_FV',sql%rowcount||' row(s) inserted');

  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('SCHEDULES_FOR_FV'));
  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/insert into DWH.SCHEDULES_FOR_FV','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_LOAD_EXCEL/error','Ошибка при загрузке DWH.SCHEDULES_FOR_FV '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end SCHEDULES_LOAD_excel;


--------------------------------------------
 procedure SCHEDULES_main(p_file_id in number
                         ,p_file_name in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_SCHEDULES_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/BEGIN','Начало загрузки графика погашения ОД');
  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/PARAM','p_file_id = '||p_file_id||chr(10)||
                                                   'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'SCHEDULES_MAIN');
  dbms_application_info.set_client_info(client_info => p_file_id);

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  --gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---
/*
  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         \*p_date*\gv_sysdate  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_SCHEDULES' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         \*substr(p_comment,1,4000)*\null  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;
*/
  update ETL.LOAD_LOG_APEX
  set STATUS_DESC = 'Витрина рассчитывается. Загрузка файла.'
  where FILE_ID = p_file_id;
  commit;

---

  SCHEDULES_load_excel(p_file_name, v_file_name, p_file_id);

  --SCHEDULES_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_SCHEDULES_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set --END_DT = sysdate,
      STATUS_DESC = 'Витрина рассчитывается. Файл загружен'
      --STATUS_CD = '3'
  where FILE_ID = p_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','SCHEDULES_MAIN/END','Файл загружен');

 exception
   when others
   then v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
        UTL_FILE.FCLOSE_all;


        update ETL.LOAD_LOG_APEX
        set END_DT = sysdate,
            STATUS_DESC = gv_error,
            STATUS_CD = '-21'
        where FILE_ID = p_file_id;
        commit;

        if gv_exc_flag = 'Y' then
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'SCHEDULES_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end SCHEDULES_main;

---------------------------------------------------


 procedure FV_MSFO_load_excel(p_file_name_full in varchar2
                             ,p_file_name in varchar2
                             ,p_date in date)
 as
  v_File_1 UTL_FILE.FILE_TYPE; -- файл внешней таблицы
  v_File_2 UTL_FILE.FILE_TYPE; -- bad файл внешней таблицы
  v_File_3 UTL_FILE.FILE_TYPE; -- сохранение bad файла внешней таблицы
  v_File_4 UTL_FILE.FILE_TYPE; -- сохранение исходного загрузочного файла
 begin
   dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/BEGIN','Начало загрузки из excel файла');
   dbms_application_info.set_action(action_name => 'FV_MSFO_LOAD_EXCEL');

 declare
  -- Проверка доступности необходимых файлов, их очистка и блокировка

  exc_locked_file  exception;
  pragma exception_init(exc_locked_file,-29283);
  v_locked_file varchar2(300);
 begin
  v_locked_file := 'FV_MSFO_RATES_STG.csv';
  v_File_1 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_1);--Закрываем файл

  v_locked_file := 'FV_MSFO_RATES_STG_BAD.bad';
  v_File_2 := UTL_FILE.FOPEN ('CSV_DIR', v_locked_file, 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_2);--Закрываем файл

  v_locked_file := p_file_name||'.bad.csv';
  v_File_3 := UTL_FILE.FOPEN ('CSV_BAD_FILE__FV_LOAD_FV_MSFO', convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8'), 'W', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_3);--Закрываем файл

  v_locked_file := p_file_name;
  v_File_4 := UTL_FILE.FOPEN ('XLS_DIR__FV_LOAD_FV_MSFO', convert(p_file_name,'CL8MSWIN1251', 'AL32UTF8'), 'WB', 32767);-- Открываем файл в режиме записи
  --UTL_FILE.fclose(v_File_4);--Закрываем файл
 dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/check files','Пройдена проверка файлов');
 exception
  when exc_locked_file then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Файл '||v_locked_file||' заблокирован'); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при блокировании файла '||v_locked_file||' '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

---
 --dbms_application_info.set_action(action_name => 'LOAD FILE');
 declare
 -- Выгрузка excel файла на сервер D:\VTBL\XLS\FV_LOAD\FV_MSFO
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
                                    ,p_file_path => 'XLS_DIR__FV_LOAD_FV_MSFO'
                                    ,p_file_name => p_file_name);

  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/load file','Файл '||p_file_name||' загружен на сервер D:\VTBL\XLS\FV_LOAD\FV_MSFO');

  update ETL.LOAD_LOG_APEX
  set FILE_NAME = 'D:\VTBL\XLS\FV_LOAD\FV_MSFO'||p_file_name,
      FILE_SHORT_NAME = p_file_name,
      BLOB_CONTENT = v_blob,
      MIME_TYPE = v_mime_type
  where FILE_ID = gv_file_id;
  commit;

 exception
   when no_data_found then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Файл '||p_file_name||' не найден в БД'); gv_exc_flag := 'N'; raise;
   when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при выгрузке excel файла на сервер D:\VTBL\XLS\FV_LOAD\FV_MSFO '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;


---

  --dbms_application_info.set_action(action_name => 'VBS SCRIPT');
 begin
   -- Копирование данных из Excel файла в FV_MSFO_RATES_STG.csv с помощью VBS скрипта
   UTL_FILE.fclose(v_File_1);--Закрываем файл
   DM.PRC_EXCEL_TO_CSV(p_from_excel_name => p_file_name
                      ,p_from_path => 'D:\VTBL\XLS\FV_LOAD\FV_MSFO'
                      ,p_to_csv_name => 'FV_MSFO_RATES_STG.csv'
                      );
   dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/create csv','csv файл FV_MSFO_RATES_STG.csv создан');

   -- Cтатистику соберём после закрытия bad файла
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при создании csv файла FV_MSFO_RATES_STG.csv '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;
---
 begin
  -- Загрузка промежуточной таблицы proc для расчётов
  execute immediate 'truncate table DWH.FV_MSFO_RATES_PROC';

  UTL_FILE.fclose(v_File_2);--Закрываем файл

  -- Собираем статистику после закрытия bad файла
   dbms_stats.gather_table_stats(ownname => 'DWH'
                                ,tabname => 'FV_MSFO_RATES_STG');

  insert into DWH.FV_MSFO_RATES_PROC
  select rownum+1 /*skip 1 во внешней таблице*/ ROW_NUMBER,
         to_number(replace(s.comission_rate,'%',''))/100  as comission_rate,
         to_number(nvl(substr(replace(s.term_year,',','.'),1,instr(s.term_year,' ',1,1)-1),replace(s.term_year,',','.')))  as term_year,
         s.fv_msfo_rate/100
  from DWH.FV_MSFO_RATES_STG s;

  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/insert into DWH.FV_MSFO_RATES_PROC',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('FV_MSFO_RATES_PROC'));
  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/insert into DWH.FV_MSFO_RATES_PROC','Статистика собрана');
 exception
   when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при загрузке DWH.FV_MSFO_RATES_PROC '||sqlerrm); gv_exc_flag := 'N'; raise;
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
  v_File := UTL_FILE.FOPEN ('CSV_DIR', 'FV_MSFO_RATES_STG_BAD.bad', 'r', 32767);-- Открываем файл в режиме записи
  --Если bad файл пустой, то возникнет ошибка no_data_found и это правильно
  UTL_FILE.get_line(file => v_File, buffer => v_bad_rows, len => 90);
  UTL_FILE.FCLOSE(v_File);

   -- Копируем BAD FILE с записями
   begin
   utl_file.fcopy(src_location => 'CSV_DIR'
                 ,src_filename => 'FV_MSFO_RATES_STG_BAD.bad'
                 ,dest_location => 'CSV_BAD_FILE__FV_LOAD_FV_MSFO'
                 ,dest_filename => convert(p_file_name||'.bad.csv','CL8MSWIN1251', 'AL32UTF8')
                 );
   exception
   when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при копировании BAD FILE '||sqlerrm); raise exc_bad_rows;
   end;



  raise exc_bad_rows; -- Если не упали с ошибкой no_data_found то прерываем загрузку
 exception
    when no_data_found then UTL_FILE.FCLOSE(v_File); -- нет строк в файле ошибок это хорошо !!!
    when exc_bad_rows then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/kkd error','Невозможно загрузить все строки исходного файла');
                           dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/kkd error','BAD FILE сохранён на сервере D:\VTBL\CSV\BAD_FILE\FV_LOAD\FV_MSFO\'||p_file_name||'.bad.csv');
                           gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при проверке BAD FILE '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;



  --FV_MSFO_user_kkd;

   dbms_application_info.set_action(action_name => 'FV_MSFO_LOAD_EXCEL_END');
---
  --Загружаем таблицу DWH.FV_MSFO_RATES
  declare
  begin

  merge into DWH.FV_MSFO_RATES a
  using (
          select tp.tp, t.rowid row_id, t.*
          from DWH.FV_MSFO_RATES t
              ,(select 'U' tp from dual union all select 'I' from dual) tp
          where t.valid_to_dttm = date '2400-01-01'
            and not(t.end_dt < p_date)

        ) b
  on (a.rowid = b.row_id
  and b.tp = 'U')

  when matched then
    update set a.valid_to_dttm = gv_sysdate
  when not matched then
    insert (comission_rate,   term_year,   fv_msfo_rate,   start_dt,   end_dt,   valid_from_dttm, valid_to_dttm,   file_id)
    values (b.comission_rate, b.term_year, b.fv_msfo_rate, b.start_dt, p_date-1, gv_sysdate,      b.valid_to_dttm, b.file_id)
    where (b.start_dt < p_date and b.tp = 'I');

  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/delete DWH.FV_MSFO_RATES',sql%rowcount||' row(s) updated');

  insert into DWH.FV_MSFO_RATES(COMISSION_RATE, TERM_YEAR, FV_MSFO_RATE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM, FILE_ID)
  select p.COMISSION_RATE,
         p.TERM_YEAR,
         p.FV_MSFO_RATE,
         p_date  as START_DT,
         date '2400-01-01'  as END_DT,
         gv_sysdate         as VALID_FROM_DTTM,
         date '2400-01-01'  as VALID_TO_DTTM,
         gv_file_id         as FILE_ID
  from   DWH.FV_MSFO_RATES_PROC p;


  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/insert into DWH.FV_MSFO_RATES',sql%rowcount||' row(s) inserted');
  commit;

  dbms_stats.gather_table_stats(ownname => 'DWH'
                               ,tabname => upper('FV_MSFO_RATES'));
  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/insert into DWH.FV_MSFO_RATES','Статистика собрана');
  exception
    when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_LOAD_EXCEL/error','Ошибка при загрузке DWH.FV_MSFO_RATES '||sqlerrm); gv_exc_flag := 'N'; raise;
  end;


 end FV_MSFO_LOAD_excel;

--------------------------------------------
 procedure FV_MSFO_main(p_date in date
                       ,p_file_name in varchar2
                       ,p_comment in varchar2)
 as
   v_lockname constant  varchar2(30 byte) := 'PKG_FV_LOAD_FV_MSFO_lock';
   v_lockhandle varchar2(200 byte);
   v_lockdesc number(1);
   exc_lock exception;
   exc_lock_other exception;
   v_file_name varchar2(32767) := substr(p_file_name,instr(p_file_name,'/',-1,1)+1); --Стандартаная обработка имени файла из Oracle APEX
---
 begin
  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/BEGIN','Начало загрузки коэффициентов МСФО');
  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/PARAM','v_date = '||to_char(p_date,'yyyy-mm-dd')||chr(10)||
                                                 'v_file_name = '||v_file_name);

  dbms_application_info.set_module(module_name => 'PKG_FV_LOAD',action_name => 'FV_MSFO_MAIN');
  dbms_application_info.set_client_info(client_info => to_char(p_date,'yyyy-mm-dd'));

  gv_sysdate := sysdate;
  gv_exc_flag := 'Y';
  gv_file_id := etl.sq_input_file.nextval;


   begin
    -- Проверка того, что загрузка не запущена в параллельном режиме
    -- Если она уже работает, то ждём получения блокировки 3 минуты, после выводим ошибку.
    dbms_lock.allocate_unique(lockname => v_lockname, lockhandle => v_lockhandle);
    v_lockdesc := dbms_lock.request(lockhandle => v_lockhandle, lockmode => dbms_lock.x_mode, timeout => 180, release_on_commit => false);
    if v_lockdesc = 1 then raise exc_lock;
    elsif v_lockdesc > 1 then raise exc_lock_other;
    end if;
   dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/check block','Пройдена проверка повторного запуска');
   exception
    when exc_lock then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/error','Загрузка файла не может идти в параллельном режиме.'); gv_exc_flag := 'N'; raise;
    when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/error','Невозможно получить блокировку '||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
    when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/error','Ошибка при проверке блокировок '||sqlerrm); gv_exc_flag := 'N'; raise;
   end;

---

  insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
       FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
  select gv_file_id as FILE_ID,
         v('APP_USER') as USER_NAM,
         p_date  as SNAPSHOT_DT,
         sysdate as START_DT,
         null as END_DT,
         'Загружается' as STATUS_DESC,
         '1' as STATUS_CD,
         null as FILE_NAME,
         null as FILE_SHORT_NAME,
         'PKG_FV_LOAD_FV_MSFO' as FILE_TYPE_CD,
         null as BLOB_CONTENT,
         null as MIME_TYPE,
         substr(p_comment,1,4000)  as PARAM_1,
         null as PARAM_2,
         null as PARAM_3
  from dual;
  commit;

---

  FV_MSFO_load_excel(p_file_name, v_file_name, p_date);

  --FV_MSFO_user_kkd;

---
 -- Снимаем блокировку 'PKG_FV_LOAD_FV_MSFO_lock'
 begin
  v_lockdesc := dbms_lock.release(lockhandle => v_lockhandle);
  if v_lockdesc > 1 then raise exc_lock_other; end if;
 exception
  when exc_lock_other then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/error','Ошибка при снятии блокировки'||v_lockname||', v_lockdesc = '||v_lockdesc); gv_exc_flag := 'N'; raise;
  when others then dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/error','Ошибка при снятии блокировки '||sqlerrm); gv_exc_flag := 'N'; raise;
 end;

  update ETL.LOAD_LOG_APEX
  set END_DT = sysdate,
      STATUS_DESC = 'Загружен',
      STATUS_CD = '3'
  where FILE_ID = gv_file_id;
  commit;

  dm.u_log('DM.PKG_FV_LOAD','FV_MSFO_MAIN/END','Файл загружен');

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
        dm.u_log('DM.PKG_FV_LOAD'
                             ,'FV_MSFO_MAIN/error'
                             ,sqlerrm);
        end if;
        raise;

 end FV_MSFO_main;
---------------------------------------------------

end PKG_FV_LOAD;
/
