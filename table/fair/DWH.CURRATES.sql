create table DWH.CURRATES
(
    report_dt          DATE,
    currency_letter_cd VARCHAR2(10),
    fixfloat           VARCHAR2(100),
    day_cnt            NUMBER,
    rate               NUMBER,
    valid_from_dttm    DATE,
    valid_to_dttm      DATE,
    file_id            NUMBER
);
-- Add comments to the table 
comment on table DWH.CURRATES
    is 'Справочник ставок FTP';
-- Add comments to the columns 
comment on column DWH.CURRATES.valid_from_dttm
    is 'Дата начала действия записи (техническая)';
comment on column DWH.CURRATES.valid_to_dttm
    is 'Дата окончания действия записи (техническая)';
-- Create/Recreate primary, unique and foreign key constraints 
alter table DWH.CURRATES
    add constraint CURRATES_UK unique (REPORT_DT, CURRENCY_LETTER_CD, FIXFLOAT, DAY_CNT, VALID_TO_DTTM)
        using index;

