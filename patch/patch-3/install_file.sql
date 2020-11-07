col spoolname new_value spoolname 
select 'insatlldb_'||to_char(sysdate, 'yymmdd')||'.log' spoolname from dual;  
spool '&spoolname' 
set define off 
-- 
-- 
prompt 
prompt 00-drop-tables.sql 
prompt ========================== 
prompt 
@@DB\00-drop-tables.sql 
-- 
-- 
prompt 
prompt 01-alter-DWH.PD_CORP.sql 
prompt ========================== 
prompt 
@@DB\01-alter-DWH.PD_CORP.sql 
-- 
-- 
prompt 
prompt 01-DM.FAIR_VALUE.sql 
prompt ========================== 
prompt 
@@DB\01-DM.FAIR_VALUE.sql 
-- 
-- 
prompt 
prompt 01-DM.FV_COMISSIONS.sql 
prompt ========================== 
prompt 
@@DB\01-DM.FV_COMISSIONS.sql 
-- 
-- 
prompt 
prompt 01-DWH.CURRATES.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.CURRATES.sql 
-- 
-- 
prompt 
prompt 01-DWH.CURRATE_TYPES.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.CURRATE_TYPES.sql 
-- 
-- 
prompt 
prompt 01-DWH.DIRECT_COST_RATES.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.DIRECT_COST_RATES.sql 
-- 
-- 
prompt 
prompt 01-DWH.EARLY_SPREAD_TYPES.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.EARLY_SPREAD_TYPES.sql 
-- 
-- 
prompt 
prompt 01-DWH.FTP_CALCULATION_METHODS.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.FTP_CALCULATION_METHODS.sql 
-- 
-- 
prompt 
prompt 01-DWH.FV_CONTRACTS_TERMS.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.FV_CONTRACTS_TERMS.sql 
-- 
-- 
prompt 
prompt 01-DWH.FV_MAX_TERM.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.FV_MAX_TERM.sql 
-- 
-- 
prompt 
prompt 01-DWH.MAINTENENCE_COST_RATES.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.MAINTENENCE_COST_RATES.sql 
-- 
-- 
prompt 
prompt 01-DWH.PD_CORP_EC.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.PD_CORP_EC.sql 
-- 
-- 
prompt 
prompt 01-DWH.ROE.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.ROE.sql 
-- 
-- 
prompt 
prompt 01-DWH.SCHEDULES_FOR_FV.sql 
prompt ========================== 
prompt 
@@DB\01-DWH.SCHEDULES_FOR_FV.sql 
-- 
-- 
prompt 
prompt 02-DWH.CURRATES.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.CURRATES.sql 
-- 
-- 
prompt 
prompt 02-DWH.CURRATE_TYPES.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.CURRATE_TYPES.sql 
-- 
-- 
prompt 
prompt 02-DWH.EARLY_SPREAD_TYPES.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.EARLY_SPREAD_TYPES.sql 
-- 
-- 
prompt 
prompt 02-DWH.FTP_CALCULATION_METHODS.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.FTP_CALCULATION_METHODS.sql 
-- 
-- 
prompt 
prompt 02-DWH.FV_CONTRACTS_TERMS.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.FV_CONTRACTS_TERMS.sql 
-- 
-- 
prompt 
prompt 02-DWH.FV_MAX_TERM.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.FV_MAX_TERM.sql 
-- 
-- 
prompt 
prompt 02-DWH.PD_CORP_EC.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.PD_CORP_EC.sql 
-- 
-- 
prompt 
prompt 02-DWH.ROE.sql 
prompt ========================== 
prompt 
@@DB\02-DWH.ROE.sql 
-- 
-- 
prompt 
prompt 03-PKG_FV_CALC.sql 
prompt ========================== 
prompt 
@@DB\03-PKG_FV_CALC.sql 
-- 
-- 
prompt 
prompt 04-PKG_FV_CALC.grants.sql 
prompt ========================== 
prompt 
@@DB\04-PKG_FV_CALC.grants.sql 
-- 
-- 
prompt 
prompt 410_CTL_APEX_USER_MATRIX.sql 
prompt ========================== 
prompt 
@@DB\410_CTL_APEX_USER_MATRIX.sql 
-- 
-- 
prompt 
prompt 420_SCRIPT_CTL_APEX_USER_MATRIX.sql 
prompt ========================== 
prompt 
@@DB\420_SCRIPT_CTL_APEX_USER_MATRIX.sql 
-- 
-- 
prompt 
prompt 430_script_ctl_apex_objects.sql 
prompt ========================== 
prompt 
@@DB\430_script_ctl_apex_objects.sql 
-- 
-- 
prompt 
prompt 440_F_APEX_NAVIGATION_OBJECTS.sql 
prompt ========================== 
prompt 
@@DB\440_F_APEX_NAVIGATION_OBJECTS.sql 
spool off 
