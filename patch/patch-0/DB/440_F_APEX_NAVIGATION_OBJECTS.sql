declare
 v_text clob := empty_clob();
begin

for s in (select s.text
          from all_source s
          where s.OWNER = 'ETL'
            and s.name = 'F_APEX_NAVIGATION_OBJECTS'
            and s.TYPE = 'FUNCTION'
          order by s.line)
loop
  v_text :=v_text||s.text;
end loop;

v_text := replace(v_text,'FUNCTION     F_APEX_NAVIGATION_OBJECTS', 'CREATE OR REPLACE FUNCTION ETL.F_APEX_NAVIGATION_OBJECTS');

v_text := replace(v_text,'END IF',q'{ELSIF p_apex_object_nam = 'DM_FAIR_VALUE' THEN             -- Выгрузка фактических платежей

  select count (1) into v_flg from etl.CTL_APEX_USER_MATRIX
  where valid_to_dttm = to_date ('01.01.2400', 'dd.mm.yyyy')
  and sysdate between begin_dt and end_dt
  and apex_user = p_apex_user
  and payments_narr_flg = '1'
  and ACTUAL_FLG = '1';

END IF}');

execute immediate v_text;
--dbms_output.put_line(substr(v_text,1,2000));
--dbms_output.put_line(substr(v_text,10000,100000));
end;
/
