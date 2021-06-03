create table DM.FV_COMISSIONS (
  CALCULATION_ID	NUMBER,
  PERIOD_NAME varchar(100),
  COMISSION_AMT NUMBER
);
create index DM.FV_COMISSIONS_IX01 on DM.FV_COMISSIONS(CALCULATION_ID) compress 1;
comment on table DM.FV_COMISSIONS is '�������� �� ��������� ���������';
comment on column DM.FV_COMISSIONS.PERIOD_NAME is '�������� �������';
comment on column DM.FV_COMISSIONS.COMISSION_AMT is '�������� ��������';