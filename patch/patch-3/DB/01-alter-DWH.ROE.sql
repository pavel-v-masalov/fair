alter table DWH.ROE drop constraint ROE_UK01 cascade;
create unique index DWH.ROE_I01 on DWH.ROE (VALID_TO_DTTM, START_DT, END_DT) compress 1;