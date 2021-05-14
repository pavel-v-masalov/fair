grant execute on DM.P_ROE to VTBL;
grant execute on DM.P_MAINTENENCE_COST_RATES to VTBL;
grant execute on DM.P_DIRECT_COST_RATES to VTBL;
grant execute on DM.PKG_FV_CALC to VTBL;

grant insert on DWH.DIRECT_COST_RATES to DM;
grant update on DWH.DIRECT_COST_RATES to DM;
grant insert on ETL.LOAD_LOG_APEX to DM;
grant update on ETL.LOAD_LOG_APEX to DM;
grant insert on DWH.MAINTENENCE_COST_RATES to DM;
grant update on DWH.MAINTENENCE_COST_RATES to DM;
grant insert on DWH.ROE to DM;
grant update on DWH.ROE to DM;


