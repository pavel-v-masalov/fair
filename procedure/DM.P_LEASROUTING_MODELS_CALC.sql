create or replace procedure DM.P_LEASROUTING_MODELS_CALC (p_SNAPSHOT_DT date default trunc(sysdate)) is
    GC_PROC_NAME constant varchar2(100) := 'DM.P_LEASROUTING_MODELS_CALC';

    procedure insert_base is
    begin

    end;
begin
    dm.u_log(GC_PROC_NAME, 'main/BEGIN','Начало расчёта Модели маршрутизации сделок автолизинга. Дата расчёта '||to_char(p_snapshot_dt,'YYYY-MM-DD')
        ||' пользователь '||user);
    dbms_application_info.set_module(module_name => GC_PROC_NAME, action_name => 'main');
    dbms_application_info.set_client_info(client_info => to_char(p_snapshot_dt,'yyyy-mm-dd'));
    -- create base set
    create_LEASROUTING_RMD_TMP;
    create_LEASROUTING_OPPORTUNITY_TMP;




    drop LEASROUTING_MODELS_CALC_TMP
    create LEASROUTING_MODELS_CALC_TMP as select





    dm.u_log(GC_PROC_NAME,'main/END','Расчет сформирован');
    exception
        when others then
            dm.u_log(GC_PROC_NAME,'MAIN/error' ,sqlerrm);
            raise;
end;
/