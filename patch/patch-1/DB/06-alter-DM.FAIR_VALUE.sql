alter table DM.FAIR_VALUE add OTHER_SPREAD number;
alter table DM.FAIR_VALUE add OTHER_SPREAD_COMMENT varchar(4000);
comment on column DM.FAIR_VALUE.OTHER_SPREAD is '������ ������';
comment on column DM.FAIR_VALUE.OTHER_SPREAD_COMMENT is '����������� � ������ �������';