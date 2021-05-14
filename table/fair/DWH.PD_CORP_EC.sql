create table DWH.PD_CORP_EC (
    RATING_MODEL_KEY number,
    RATING_MODEL varchar2(60),
    rat_on_date varchar2(16),
    pd number,
    start_dt date,
    end_dt date,
    valid_from_dttm date,
    valid_to_dttm date,
    constraint PD_CORP_EC_UK01 unique(RATING_MODEL_KEY, rat_on_date, valid_to_dttm, END_DT) using index compress 1
);
comment on table DWH.PD_CORP_EC is 'PD для экономического капитала';
comment on column DWH.PD_CORP_EC.RATING_MODEL_KEY is 'Ключ рейтинговой модели';
comment on column DWH.PD_CORP_EC.RATING_MODEL is 'Рейтинговая модель';
comment on column DWH.PD_CORP_EC.RAT_ON_DATE is 'Рейтинг';
comment on column DWH.PD_CORP_EC.PD is 'PD';
comment on column DWH.PD_CORP_EC.START_DT is 'Дата начала действия записи (пользовательская)';
comment on column DWH.PD_CORP_EC.END_DT is 'Дата окончания действия записи (пользовательская)';
comment on column DWH.PD_CORP_EC.VALID_FROM_DTTM is 'Дата начала действия записи (техническая)';
comment on column DWH.PD_CORP_EC.VALID_TO_DTTM is 'Дата окончания действия записи (техническая)';

alter table DWH.PD_CORP_EC add file_id number;