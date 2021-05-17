begin
  execute immediate 'alter table etl.CTL_APEX_USER_MATRIX add DWH_DIRECT_COST_INS_flg varchar2(5)';
exception
  when others then null;
end;
/

begin
  execute immediate 'alter table etl.CTL_APEX_USER_MATRIX add DWH_MAINTENENCE_COST_INS_flg varchar2(5)';
exception
  when others then null;
end;
/

begin
  execute immediate 'alter table etl.CTL_APEX_USER_MATRIX add DWH_ROE_INS_flg varchar2(5)';
exception
  when others then null;
end;
/

begin
  execute immediate 'alter table etl.CTL_APEX_USER_MATRIX add DM_FAIR_VALUE_flg varchar2(5)';
exception
  when others then null;
end;
/