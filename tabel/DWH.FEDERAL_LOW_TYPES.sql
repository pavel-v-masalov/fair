create table DWH.FEDERAL_LOW_TYPES (
    FEDERAL_LOW_TYPE_KEY NUMBER primary key,
    FEDERAL_LOW_TYPE_NAME VARCHAR2(100)
);
comment on table DWH.FEDERAL_LOW_TYPES is '���������� ��������� �� ������ (��)�';
comment on column DWH.FEDERAL_LOW_TYPES.FEDERAL_LOW_TYPE_KEY is '���� ���� ������';
comment on column DWH.FEDERAL_LOW_TYPES.FEDERAL_LOW_TYPE_NAME is '�������� ���� ������';
