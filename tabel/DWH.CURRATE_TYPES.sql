create table DWH.CURRATE_TYPES (
    CURRATE_TYPE_KEY NUMBER primary key,
    CURRATE_TYPES_CD VARCHAR2(100),
    CURRENCY_LETTER_CD VARCHAR2(100),
    FIXFLOAT VARCHAR2(100)
);
comment on table DWH.CURRATE_TYPES is '���������� ����� ������';
comment on column DWH.CURRATE_TYPES.CURRATE_TYPE_KEY is '���� ���� ������';
comment on column DWH.CURRATE_TYPES.CURRATE_TYPES_CD is '�������� ���� ������';
comment on column DWH.CURRATE_TYPES.CURRENCY_LETTER_CD is '�������� ������';
comment on column DWH.CURRATE_TYPES.FIXFLOAT is '������� ������������� ��������� ������';
