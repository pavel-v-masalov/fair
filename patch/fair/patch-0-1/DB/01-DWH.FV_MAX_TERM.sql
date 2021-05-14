create table DWH.FV_MAX_TERM (
    RATE_TYPE VARCHAR2(100),
    RATE_TYPE_CD VARCHAR2(100) primary key,
    MAX_TERM NUMBER,
    VALUE NUMBER
);
comment on table DWH.FV_MAX_TERM is '���������� ������ ��� ������������ ������';
comment on column DWH.FV_MAX_TERM.RATE_TYPE is '��� ������/������';
comment on column DWH.FV_MAX_TERM.RATE_TYPE_CD is '��� ���� ������/������';
comment on column DWH.FV_MAX_TERM.MAX_TERM is '������������ ���� - ����, ��� ���������� �������� ������������ �������� ������ (�����)';
comment on column DWH.FV_MAX_TERM.VALUE is '��������';
