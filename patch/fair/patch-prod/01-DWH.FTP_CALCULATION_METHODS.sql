create table DWH.FTP_CALCULATION_METHODS (
    FTP_CALCULATION_METHOD_KEY NUMBER primary key,
    FTP_CALCULATION_METHOD_NAME VARCHAR2(100)
);
comment on table DWH.FTP_CALCULATION_METHODS is '���������� ������� ������� FTP';
comment on column DWH.FTP_CALCULATION_METHODS.FTP_CALCULATION_METHOD_KEY is '���� ��������';
comment on column DWH.FTP_CALCULATION_METHODS.FTP_CALCULATION_METHOD_NAME is '�������� ��������';
