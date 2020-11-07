create or replace procedure DM.P_DIRECT_COST_RATES (
    p_direct_cost_rate number,
    p_start_dt date default trunc(sysdate)
) is
    GC_EOW_D constant date := date '2400-01-01'; -- end of world
    v_now_d date := trunc(sysdate);
    v_close_d date := v_now_d - 1;
    v_user varchar2(100) := v('APP_USER');
    type t_rowids is table of rowid;
    v_rowids t_rowids;

    procedure insert_log_apex is
    begin
        insert into ETL.LOAD_LOG_APEX(FILE_ID, USER_NAM, SNAPSHOT_DT, START_DT, END_DT, STATUS_DESC, STATUS_CD, FILE_NAME,
                                      FILE_SHORT_NAME, FILE_TYPE_CD, BLOB_CONTENT, MIME_TYPE, PARAM_1, PARAM_2, PARAM_3)
        select etl.sq_input_file.nextval,
               v('APP_USER') as USER_NAM,
               p_start_dt  as SNAPSHOT_DT,
               sysdate as START_DT,
            sysdate as END_DT,
            'Создание записи: direct_cost_rate='||p_direct_cost_rate||' start_dt='||p_start_dt as STATUS_DESC,
            '1' as STATUS_CD,
            null as FILE_NAME,
            null as FILE_SHORT_NAME,
            'DIRECT_COST_RATES' as FILE_TYPE_CD,
            null as BLOB_CONTENT,
            null as MIME_TYPE,
            null as PARAM_1,
            null as PARAM_2,
            null as PARAM_3
        from dual;
        commit;
    end;

begin
    insert_log_apex;
    -- 1) Записи, для которых START_DT >= [Дата начала действия] и VALID_TO_DTTM = '2400-01-01’  закрываются: присваивается значение VALID_TO_DTTM = Текущая дата – 1'
    update DWH.DIRECT_COST_RATES
       set VALID_TO_DTTM = v_close_d
     where START_DT >= p_start_dt and VALID_TO_DTTM = GC_EOW_D;
    -- 2) Записи, для которых END_DT < [Дата начала действия] и VALID_TO_DTTM = '2400-01-01’, остаются без изменений
    -- nop
    -- 3) Записи, для которых START_DT < [Дата начала действия], END_DT >= [Дата начала действия] и VALID_TO_DTTM = '2400-01-01’
    --    закрываются: присваивается значение VALID_TO_DTTM = Текущая дата – 1 и дополнительно создается копия найденной записи с датами действия:
    update DWH.DIRECT_COST_RATES
       set VALID_TO_DTTM = v_close_d
     where START_DT < p_start_dt and END_DT >= p_start_dt and VALID_TO_DTTM = GC_EOW_D
    returning rowid bulk collect into v_rowids;
    forall i in 1..v_rowids.count
        insert into DWH.DIRECT_COST_RATES(DIRECT_COST_RATE, START_DT, END_DT, VALID_FROM_DTTM, VALID_TO_DTTM, USERNAME)
        select DIRECT_COST_RATE, START_DT, p_start_dt - 1, v_now_d, GC_EOW_D, v_user
          from DWH.DIRECT_COST_RATES
         where rowid = v_rowids(i);

    insert into DWH.DIRECT_COST_RATES (DIRECT_COST_RATE,
                    START_DT,
                    END_DT,
                    VALID_FROM_DTTM,
                    VALID_TO_DTTM,
                    USERNAME)
    values ( p_direct_cost_rate,
             p_start_dt,
             GC_EOW_D,
             v_now_d,
             GC_EOW_D,
             v_user);
    commit;
exception
    when others then dm.u_log('procedure','P_DIRECT_COST_RATES/error','Ошибка '||sqlerrm); raise;
end;
/
