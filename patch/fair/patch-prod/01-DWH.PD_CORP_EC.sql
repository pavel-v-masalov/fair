create table DWH.PD_CORP_EC (
    RATING_MODEL_KEY number,
    RATING_MODEL varchar2(60),
    rat_on_date varchar2(16),
    pd number,
    start_dt date,
    end_dt date,
    valid_from_dttm date,
    valid_to_dttm date,
    constraint PD_CORP_EC_UK01 unique(RATING_MODEL_KEY, rat_on_date, valid_to_dttm, END_DT) using index compress 1
);
comment on table DWH.PD_CORP_EC is 'PD ��� �������������� ��������';
comment on column DWH.PD_CORP_EC.RATING_MODEL_KEY is '���� ����������� ������';
comment on column DWH.PD_CORP_EC.RATING_MODEL is '����������� ������';
comment on column DWH.PD_CORP_EC.RAT_ON_DATE is '�������';
comment on column DWH.PD_CORP_EC.PD is 'PD';
comment on column DWH.PD_CORP_EC.START_DT is '���� ������ �������� ������ (����������������)';
comment on column DWH.PD_CORP_EC.END_DT is '���� ��������� �������� ������ (����������������)';
comment on column DWH.PD_CORP_EC.VALID_FROM_DTTM is '���� ������ �������� ������ (�����������)';
comment on column DWH.PD_CORP_EC.VALID_TO_DTTM is '���� ��������� �������� ������ (�����������)';

alter table DWH.PD_CORP_EC add file_id number;