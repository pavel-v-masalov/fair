-- Create table
create table DWH.NEW_ACCOUNTGROUP
(
    createdon          DATE,
    new_accountgroupid VARCHAR2(36),
    new_name           VARCHAR2(2000),
    owningbusinessunit VARCHAR2(36),
    statecode          NUMBER,
    statecodename      VARCHAR2(1000),
    statuscode         NUMBER,
    statuscodename     VARCHAR2(1000),
    timeslotstart      DATE,
    timeslotend        DATE,
    sessionkey         NUMBER,
    valid_from_dttm    DATE,
    valid_to_dttm      DATE not null,
    dml_type           VARCHAR2(1),
    dml_time           TIMESTAMP(6),
    sessionname        VARCHAR2(100)
);
-- Add comments to the columns
comment on column DWH.NEW_ACCOUNTGROUP.createdon
  is 'Дата создания';
comment on column DWH.NEW_ACCOUNTGROUP.new_accountgroupid
  is 'Группа компаний';
comment on column DWH.NEW_ACCOUNTGROUP.new_name
  is 'Имя';
comment on column DWH.NEW_ACCOUNTGROUP.owningbusinessunit
  is 'Ответственное подразделение';
comment on column DWH.NEW_ACCOUNTGROUP.statecode
  is 'Статус';
comment on column DWH.NEW_ACCOUNTGROUP.statuscode
  is 'Состояние';
comment on column DWH.NEW_ACCOUNTGROUP.timeslotstart
  is 'Время начала TimeSlot-а ';
comment on column DWH.NEW_ACCOUNTGROUP.timeslotend
  is 'Время конца TimeSlot-а ';
comment on column DWH.NEW_ACCOUNTGROUP.sessionkey
  is 'Ключ сессии ';
-- Create/Recreate indexes
create unique index DWH.U_NEW_ACCOUNTGROUP on DWH.NEW_ACCOUNTGROUP (NEW_ACCOUNTGROUPID, VALID_TO_DTTM, TIMESLOTSTART);
