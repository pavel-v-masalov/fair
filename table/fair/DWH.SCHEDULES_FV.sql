create table DWH.SCHEDULES_FV
(
    calculation_id NUMBER not null,
    date_from      DATE not null,
    date_to        DATE not null,
    loan_amt       NUMBER,
    file_id        NUMBER
);
alter table DWH.SCHEDULES_FV
    add constraint SCHEDULES_FV_UK01 unique (CALCULATION_ID, DATE_FROM)
        using index;
