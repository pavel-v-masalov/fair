create table DWH.RANK_MODELS (
    RANK_MODEL_KEY NUMBER primary key,
    RANK_MODEL_NAME VARCHAR2(100),
    RANK_MODEL_CD VARCHAR2(100),
    DESCRIPTION VARCHAR2(4000),
    RATING_MODEL_KEY NUMBER
);
comment on table DWH.RANK_MODELS is '���������� ������� ������������';
comment on column DWH.RANK_MODELS.RANK_MODEL_KEY is '���� ������ ������������';
comment on column DWH.RANK_MODELS.RANK_MODEL_NAME is '�������� ������ ������������';
comment on column DWH.RANK_MODELS.RANK_MODEL_CD is '������ ������ ������������';
comment on column DWH.RANK_MODELS.DESCRIPTION is '�������� � �������� ���������� ��������';
comment on column DWH.RANK_MODELS.RATING_MODEL_KEY is '���� ����������� ������';
