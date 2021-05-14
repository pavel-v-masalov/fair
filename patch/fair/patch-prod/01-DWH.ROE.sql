create table DWH.ROE (
    roe             NUMBER,
    start_dt        DATE,
    end_dt          DATE,
    valid_from_dttm DATE,
    valid_to_dttm   DATE,
    file_id         NUMBER
);
comment on table DWH.ROE is 'Справочник значений Целевой отдачи на капитал ROE';
comment on column DWH.ROE.ROE is 'Значение Целевой отдачи на капитал';
comment on column DWH.ROE.VALID_FROM_DTTM is 'Дата начала действия записи (техническая)';
comment on column DWH.ROE.VALID_TO_DTTM is 'Дата окончания действия записи (техническая)';
