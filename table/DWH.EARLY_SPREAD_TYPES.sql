create table DWH.EARLY_SPREAD_TYPES (
    EARLY_SPREAD_TYPE_KEY NUMBER primary key,
    EARLY_SPREAD_TYPE_NAME VARCHAR2(100)
);
comment on table DWH.EARLY_SPREAD_TYPES is '���������� ����� ������ ��� ���������� ���������';
comment on column DWH.EARLY_SPREAD_TYPES.EARLY_SPREAD_TYPE_KEY is '���� ���� ������';
comment on column DWH.EARLY_SPREAD_TYPES.EARLY_SPREAD_TYPE_NAME is '�������� ���� ������;'
