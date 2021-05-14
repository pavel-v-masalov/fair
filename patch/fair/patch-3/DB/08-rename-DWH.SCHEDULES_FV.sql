create table DWH.SCHEDULES_FV as
    select * from DWH.SCHEDULES_FOR_FV;
alter table DWH.SCHEDULES_FV
    add constraint SCHEDULES_FV_UK01 unique (CALCULATION_ID, DATE_FROM) using index compress 1;
drop table DWH.SCHEDULES_FOR_FV;