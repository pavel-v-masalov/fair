CREATE OR REPLACE PROCEDURE DM.PRC_EXCEL_TO_CSV (
    p_from_excel_name varchar2
   ,p_to_csv_name     varchar2
   ,p_from_path       varchar2 default 'D:\VTBL\XLS'
   ,p_to_path         varchar2 default 'D:\VTBL\CSV'
   ,p_script_name     varchar2 default 'XLS2CSV.vbs'
   ,p_script_path     varchar2 default 'D:\VTBL\scripts'
)
is
j number;
v_flag_prev number;
v_flag number;
v_stat varchar (100);
v_job_name varchar2(30) := substr('JOB_EXCEL_TO_CSV_'||upper(substr(p_to_csv_name,1,instr(p_to_csv_name,'.',1,1)-1)),1,30);
failed_error_message exception;
timeout_message exception;
--v_REPORT_DT date:= p_REPORT_DT+1;

v_from_excel_name varchar2(1000) := convert('"'||p_from_excel_name||'"','CL8MSWIN1251','AL32UTF8');
--convert позволяет работать с кириллицей в именах
--заключение имени в кавычки("имя файла.расширение") позволяет работать с пробелами и специальными символами

BEGIN
  /* LIMIT_REPORT */
    dm.u_log(p_proc => 'DM.PRC_EXCEL_TO_CSV',
           p_step => 'START',
           p_info => 'Процедура DM.PRC_EXCEL_TO_CSV запущена');
  j := 0;

  WHILE TRUE

  LOOP
      select count (*) flg
      into v_flag_prev
      FROM user_objects
      where object_name = v_job_name
        and object_type = 'JOB';

     IF v_flag_prev = 1
        THEN
            DBMS_LOCK.SLEEP (10);
        ELSIF v_flag_prev = 0
        THEN EXIT;
     END IF;

     IF j = 100
         THEN dbms_scheduler.drop_job(job_name => v_job_name, force => true);
              dm.u_log(p_proc => 'DM.PRC_EXCEL_TO_CSV',
                       p_step => 'DROP JOB',
                       p_info => 'Был обнаружен и удалён долго работающий job '||v_job_name);
              EXIT;
              --raise timeout_message;
     ELSE
     j := j + 1;
     END IF;

  END LOOP;

  DBMS_SCHEDULER.CREATE_JOB(
  job_name=>v_job_name,
  job_type=>'EXECUTABLE',
  number_of_arguments=>4,
  job_action=>'C:\Windows\System32\cmd.exe',
  enabled=>FALSE);

  DBMS_SCHEDULER.set_job_argument_value(v_job_name, 1, '/c');
  DBMS_SCHEDULER.set_job_argument_value(v_job_name, 2, p_script_path||'\'||p_script_name);    --default 'D:\VTBL\scripts\XLS2CSV.vbs'
  DBMS_SCHEDULER.set_job_argument_value(v_job_name, 3, p_from_path  ||'\'||v_from_excel_name);--default 'D:\VTBL\XLS\'+Имя_файла.xlsx
  DBMS_SCHEDULER.set_job_argument_value(v_job_name, 4, p_to_path    ||'\'||p_to_csv_name  );  --default 'D:\VTBL\CSV\'+Имя_файла.csv
  --DBMS_SCHEDULER.set_job_argument_value(v_job_name, 3, TO_CHAR(p_REPORT_DT, 'DD.MM.YYYY'));
  DBMS_SCHEDULER.enable(v_job_name);

     dm.u_log(p_proc => 'DM.PRC_EXCEL_TO_CSV',
           p_step => 'DBMS_SCHEDULER.CREATE_JOB: '||v_job_name,
           p_info => /*'p_REPORT_DT:'||p_REPORT_DT||*/'Job запущен. cmd:'||p_script_path||'\'||p_script_name||' '||p_from_path||'\'||v_from_excel_name||' '||p_to_path||'\'||p_to_csv_name);
  for i in 1 .. 100
  loop
      select count (*) flg
      into v_flag
      FROM user_objects
      where object_name = v_job_name;

      select max (status) keep (dense_rank last order by log_date) status
      into v_stat
      from dba_scheduler_job_run_details
      where JOB_NAME = v_job_name;

      IF v_flag = 1 and i = 100
        THEN dbms_scheduler.drop_job(job_name => v_job_name, force => true);
             dm.u_log(p_proc => 'DM.PRC_EXCEL_TO_CSV',
                      p_step => 'DROP JOB',
                      p_info => 'Был удалён долго работающий job '||v_job_name);
             raise timeout_message;
      ELSIF v_flag = 1
        THEN DBMS_LOCK.SLEEP (10);
             continue;
      ELSIF v_stat = 'SUCCEEDED'
        THEN EXIT;
      ELSIF v_stat = 'FAILED'
        THEN raise failed_error_message;
      ELSE --raise timeout_message;
           null;
      END IF;
   END LOOP;
    dm.u_log(p_proc => 'DM.PRC_EXCEL_TO_CSV',
           p_step => 'JOB FINISH: '||v_job_name,
           p_info => 'status:'||v_stat);
EXCEPTION
    WHEN failed_error_message
      THEN RAISE_APPLICATION_ERROR (-20210, 'Creation LIMIT REPORT failed. Please ask your administrator to fix the error');
     WHEN timeout_message
      THEN RAISE_APPLICATION_ERROR (-20209, 'timeout');

END;
/
