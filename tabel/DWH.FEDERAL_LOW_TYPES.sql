create table DWH.FEDERAL_LOW_TYPES (
    FEDERAL_LOW_TYPE_KEY NUMBER primary key,
    FEDERAL_LOW_TYPE_NAME VARCHAR2(100)
);
comment on table DWH.FEDERAL_LOW_TYPES is 'Справочник вариантов «В рамках (ФЗ)»';
comment on column DWH.FEDERAL_LOW_TYPES.FEDERAL_LOW_TYPE_KEY is 'Ключ вида закона';
comment on column DWH.FEDERAL_LOW_TYPES.FEDERAL_LOW_TYPE_NAME is 'Название вида закона';
