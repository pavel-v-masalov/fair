create table DWH.CURRATES (
  denj  date,
  curr  varchar2(10),
  ratename  varchar2(100),
  rateperiod    number,
  rate  number,
  start_dt date,
  end_dt date,
  valid_from_dttm date,
  valid_to_dttm date,
  constraint CURRATES_UK01 unique (denj, curr, ratename, rateperiod, valid_to_dttm, end_dt) using index compress 3
);
comment on table DWH.CURRATES is '—правочник ставок FTP';
comment on column DWH.CURRATES.START_DT is 'ƒата начала действи€ записи (пользовательска€)';
comment on column DWH.CURRATES.END_DT is 'ƒата окончани€ действи€ записи (пользовательска€)';
comment on column DWH.CURRATES.VALID_FROM_DTTM is 'ƒата начала действи€ записи (техническа€)';
comment on column DWH.CURRATES.VALID_TO_DTTM is 'ƒата окончани€ действи€ записи (техническа€)';
