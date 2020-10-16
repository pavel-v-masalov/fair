drop table DWH.ROE;
create table DWH.ROE (
    ROE NUMBER,
    start_dt date,
    end_dt date,
    USERNAME varchar2(100),
    VALID_FROM_DTTM DATE,
    VALID_TO_DTTM DATE
);
comment on table DWH.ROE is 'Справочник значений Целевой отдачи на капитал ROE';
comment on column DWH.ROE.ROE is 'Значение Целевой отдачи на капитал';
comment on column DWH.ROE.VALID_FROM_DTTM is 'Дата начала действия записи (техническая)';
comment on column DWH.ROE.VALID_TO_DTTM is 'Дата окончания действия записи (техническая)';
