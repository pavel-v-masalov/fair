create table DWH.FORMULATION_IND_CNCL (
    FORMULATION_IND_CNCL_KEY NUMBER primary key,
    FORMULATION_IND_CNCL_NAME VARCHAR2(100),
    DESCRIPTION VARCHAR2(4000)
);
comment on table DWH.FORMULATION_IND_CNCL is '���������� ������������ ������/���������� �����������';
comment on column DWH.FORMULATION_IND_CNCL.FORMULATION_IND_CNCL_KEY is '���� ������������';
comment on column DWH.FORMULATION_IND_CNCL.FORMULATION_IND_CNCL_NAME is '�������� ������������';
comment on column DWH.FORMULATION_IND_CNCL.DESCRIPTION is '�������� ������������ ��� ����������� � ������� � � APEX';
