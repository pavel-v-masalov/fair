drop table DWH.TREASURY_SPREAD;
create table DWH.TREASURY_SPREAD (
    TREASURY_SPREAD_TYPE VARCHAR2(1000),
    CURRENCY_LETTER_CD VARCHAR2(100),
    FIXFLOAT VARCHAR2(100),
    CONTRACTS_TERMS_KEY NUMBER,
    INTERVAL1_DAYS_FROM NUMBER,
    INTERVAL1_DAYS_TO NUMBER,
    INTERVAL2_DAYS_FROM NUMBER,
    INTERVAL2_DAYS_TO NUMBER,
    VALUE NUMBER,
    START_DT DATE,
    END_DT DATE,
    VALID_FROM_DTTM DATE,
    VALID_TO_DTTM DATE,
    constraint TREASURY_SPREAD_UK01 unique (TREASURY_SPREAD_TYPE, CURRENCY_LETTER_CD, FIXFLOAT, CONTRACTS_TERMS_KEY, VALID_TO_DTTM, END_DT) using index compress 4
);
comment on table DWH.TREASURY_SPREAD is 'R������������t ����� � �������b';
comment on column DWH.TREASURY_SPREAD.TREASURY_SPREAD_TYPE is '��� ������';
comment on column DWH.TREASURY_SPREAD.CURRENCY_LETTER_CD is '������';
comment on column DWH.TREASURY_SPREAD.FIXFLOAT is '��� ������ ������';
comment on column DWH.TREASURY_SPREAD.CONTRACTS_TERMS_KEY is '���� �������� � ������ (��)';
comment on column DWH.TREASURY_SPREAD.INTERVAL1_DAYS_FROM is '������ ��������� ��� ����� 1';
comment on column DWH.TREASURY_SPREAD.INTERVAL1_DAYS_TO is '����� ��������� ��� ����� 1';
comment on column DWH.TREASURY_SPREAD.INTERVAL2_DAYS_FROM is '������ ��������� ��� ����� 2';
comment on column DWH.TREASURY_SPREAD.INTERVAL2_DAYS_TO is '����� ��������� ��� ����� 2';
comment on column DWH.TREASURY_SPREAD.VALUE is '��������';
comment on column DWH.TREASURY_SPREAD.START_DT is '���� ������ �������� ������ (����������������)';
comment on column DWH.TREASURY_SPREAD.END_DT is '���� ��������� �������� ������ (����������������)';
comment on column DWH.TREASURY_SPREAD.VALID_FROM_DTTM is '���� ������ �������� ������ (�����������)';
comment on column DWH.TREASURY_SPREAD.VALID_TO_DTTM is '���� ��������� �������� ������ (�����������)';
