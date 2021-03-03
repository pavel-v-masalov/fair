create table DWH.CURRENCIES
(
    currency_key       NUMBER not null,
    currency_cd        VARCHAR2(100 CHAR),
    currency_letter_cd VARCHAR2(10 CHAR),
    currency_en_nam    VARCHAR2(100 CHAR),
    currency_ru_nam    VARCHAR2(100 CHAR),
    currency_type_cd   NUMBER,
    begin_dt           DATE,
    end_dt             DATE,
    process_key        NUMBER,
    valid_from_dttm    DATE,
    valid_to_dttm      DATE,
    file_id            NUMBER,
    currency_crm_cd    VARCHAR2(100)
);
comment on table DWH.CURRENCIES is 'Справочник валют';
