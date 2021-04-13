-- Create table
create table DWH.RELLGROUP
(
    accountid       VARCHAR2(36),
    relgroups       VARCHAR2(200),
    relmax          NUMBER,
    timeslotstart   DATE,
    timeslotend     DATE,
    sessionkey      NUMBER,
    valid_from_dttm DATE,
    valid_to_dttm   DATE not null,
    dml_type        VARCHAR2(1),
    dml_time        DATE,
    sessionname     VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.RELLGROUP.accountid
  is ' ID контрагента ';
comment on column DWH.RELLGROUP.relgroups
  is ' Список групп надежности ';
comment on column DWH.RELLGROUP.relmax
  is ' Максимальная группа ';
-- Create/Recreate indexes
create unique index DWH.RELLGROUP_I on DWH.RELLGROUP (ACCOUNTID, TIMESLOTSTART, VALID_TO_DTTM);

