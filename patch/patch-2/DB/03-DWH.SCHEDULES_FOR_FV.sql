begin
    for r in (select table_name, owner from all_tables where owner = 'DWH' and table_name in ('SCHEDULES_FOR_FV', 'SHCEDULES_FOR_FV')
        ) loop
            execute immediate 'drop table '||r.owner||'.'||r.table_name;
        end loop;
end;
/
create table DWH.SCHEDULES_FOR_FV (
  CALCULATION_ID	NUMBER not null,
  DATE_FROM	DATE not null,
  DATE_TO	DATE not null,
  LOAN_AMT	NUMBER,
  constraint SCHEDULES_FOR_FV_UK01 unique (CALCULATION_ID, DATE_FROM) using index
);
COMMENT ON table DWH.SCHEDULES_FOR_FV IS 'Графики погашения основного долга для расчета FTP';
COMMENT ON COLUMN DWH.SCHEDULES_FOR_FV.CALCULATION_ID	is 'ID расчета';
COMMENT ON COLUMN DWH.SCHEDULES_FOR_FV.DATE_FROM	is 'Дата С';
COMMENT ON COLUMN DWH.SCHEDULES_FOR_FV.DATE_TO	is 'Дата По';
COMMENT ON COLUMN DWH.SCHEDULES_FOR_FV.LOAN_AMT	is 'ОД';
