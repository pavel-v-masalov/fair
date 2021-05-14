create table DWH.DIRECT_COST_RATES (
    DIRECT_COST_RATE NUMBER,
    START_DT DATE,
    END_DT DATE,
    VALID_FROM_DTTM DATE,
    VALID_TO_DTTM DATE,
    constraint DIRECT_COST_RATES_UK01 unique (VALID_TO_DTTM, END_DT) using index compress 1
);
comment on table DWH.DIRECT_COST_RATES is '���������� �������� �� �������� ������ ��������';
comment on column DWH.DIRECT_COST_RATES.DIRECT_COST_RATE is '�������� ��������';
comment on column DWH.DIRECT_COST_RATES.START_DT is '���� ������ �������� ������ (����������������)';
comment on column DWH.DIRECT_COST_RATES.END_DT is '���� ��������� �������� ������ (����������������)';
comment on column DWH.DIRECT_COST_RATES.VALID_FROM_DTTM is '���� ������ �������� ������ (�����������)';
comment on column DWH.DIRECT_COST_RATES.VALID_TO_DTTM is 'MAINTENENCE_COST_RATES';
alter table DWH.DIRECT_COST_RATES add file_id number;
