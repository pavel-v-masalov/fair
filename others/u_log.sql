--------------------------------------------------------
--  File created - суббота-Сентябрь-26-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure U_LOG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "DM"."U_LOG" (p_proc varchar2,p_step varchar2,p_info varchar2)
is
pragma autonomous_transaction;
begin
  insert into L$DM(dt,proc_name,step_name,info) values(systimestamp,p_proc,p_step,p_info);
  commit;
  end;

/
