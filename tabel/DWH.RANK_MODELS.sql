create table DWH.RANK_MODELS (
    RANK_MODEL_KEY NUMBER primary key,
    RANK_MODEL_NAME VARCHAR2(100),
    RANK_MODEL_CD VARCHAR2(100),
    DESCRIPTION VARCHAR2(4000),
    RATING_MODEL_KEY NUMBER
);
comment on table DWH.RANK_MODELS is 'Справочник моделей ранжирования';
comment on column DWH.RANK_MODELS.RANK_MODEL_KEY is 'Ключ модели ранжирования';
comment on column DWH.RANK_MODELS.RANK_MODEL_NAME is 'Название модели ранжирования';
comment on column DWH.RANK_MODELS.RANK_MODEL_CD is 'Индекс модели ранжирования';
comment on column DWH.RANK_MODELS.DESCRIPTION is 'Описание – критерии применения методики';
comment on column DWH.RANK_MODELS.RATING_MODEL_KEY is 'Ключ рейтинговой модели';
