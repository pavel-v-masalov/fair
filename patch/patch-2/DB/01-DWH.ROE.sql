drop table DWH.ROE;
create table DWH.ROE (
    ROE NUMBER,
    start_dt date,
    end_dt date,
    USERNAME varchar2(100),
    VALID_FROM_DTTM DATE,
    VALID_TO_DTTM DATE
);
comment on table DWH.ROE is '���������� �������� ������� ������ �� ������� ROE';
comment on column DWH.ROE.ROE is '�������� ������� ������ �� �������';
comment on column DWH.ROE.VALID_FROM_DTTM is '���� ������ �������� ������ (�����������)';
comment on column DWH.ROE.VALID_TO_DTTM is '���� ��������� �������� ������ (�����������)';
