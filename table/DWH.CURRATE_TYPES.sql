create table DWH.CURRATE_TYPES (
    CURRATE_TYPE_KEY NUMBER primary key,
    CURRENCY_KEY NUMBER,
    CURRENCY_LETTER_CD VARCHAR2(3),
    FIXFLOAT VARCHAR2(5),
    FIXFLOAT_CD VARCHAR2(100),
    CONTRACTS_TERMS_KEY NUMBER
);
comment on table DWH.CURRATE_TYPES is '���������� ����� ������';
comment on column DWH.CURRATE_TYPES.CURRATE_TYPE_KEY is '���� ���� ������';
comment on column DWH.CURRATE_TYPES.CURRENCY_LETTER_CD is '�������� ������';
comment on column DWH.CURRATE_TYPES.FIXFLOAT is '������� ������������� ��������� ������';
