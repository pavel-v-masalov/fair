create table DWH.TREASURY_SPREAD
(
    treasury_spread_type VARCHAR2(1000),
    currency_letter_cd   VARCHAR2(100),
    fixfloat             VARCHAR2(100),
    contracts_terms_key  NUMBER,
    interval1_days_from  NUMBER,
    interval1_days_to    NUMBER,
    interval2_days_from  NUMBER,
    interval2_days_to    NUMBER,
    value                NUMBER,
    start_dt             DATE,
    end_dt               DATE,
    valid_from_dttm      DATE,
    valid_to_dttm        DATE,
    file_id              NUMBER
);
-- Add comments to the table
comment on table DWH.TREASURY_SPREAD
    is 'Компенсирующие спред и комиссии';
-- Add comments to the columns
comment on column DWH.TREASURY_SPREAD.treasury_spread_type
    is 'Тип спреда';
comment on column DWH.TREASURY_SPREAD.currency_letter_cd
    is 'Валюта';
comment on column DWH.TREASURY_SPREAD.fixfloat
    is 'Тип ставки ставки';
comment on column DWH.TREASURY_SPREAD.contracts_terms_key
    is 'Ключ варианта В рамках (ФЗ)';
comment on column DWH.TREASURY_SPREAD.interval1_days_from
    is 'Начало интервала для срока 1';
comment on column DWH.TREASURY_SPREAD.interval1_days_to
    is 'Конец интервала для срока 1';
comment on column DWH.TREASURY_SPREAD.interval2_days_from
    is 'Начало интервала для срока 2';
comment on column DWH.TREASURY_SPREAD.interval2_days_to
    is 'Конец интервала для срока 2';
comment on column DWH.TREASURY_SPREAD.value
    is 'Значение';
comment on column DWH.TREASURY_SPREAD.start_dt
    is 'Дата начала действия записи (пользовательская)';
comment on column DWH.TREASURY_SPREAD.end_dt
    is 'Дата окончания действия записи (пользовательская)';
comment on column DWH.TREASURY_SPREAD.valid_from_dttm
    is 'Дата начала действия записи (техническая)';
comment on column DWH.TREASURY_SPREAD.valid_to_dttm
    is 'Дата окончания действия записи (техническая)';

