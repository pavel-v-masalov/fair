alter table DWH.CURRATES drop constraint CURRATES_UK01 cascade;
alter table DWH.CURRATES drop column start_dt;
alter table DWH.CURRATES drop column end_dt;
alter table DWH.CURRATES add constraint CURRATES_UK unique (DENJ, CURR, RATENAME, RATEPERIOD, VALID_TO_DTTM) using index;

