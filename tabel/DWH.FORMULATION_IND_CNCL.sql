create table DWH.FORMULATION_IND_CNCL (
    FORMULATION_IND_CNCL_KEY NUMBER primary key,
    FORMULATION_IND_CNCL_NAME VARCHAR2(100),
    DESCRIPTION VARCHAR2(4000)
);
comment on table DWH.FORMULATION_IND_CNCL is 'Справочник формулировок отмены/отсутствия индикаторов';
comment on column DWH.FORMULATION_IND_CNCL.FORMULATION_IND_CNCL_KEY is 'Ключ формулировки';
comment on column DWH.FORMULATION_IND_CNCL.FORMULATION_IND_CNCL_NAME is 'Название формулировки';
comment on column DWH.FORMULATION_IND_CNCL.DESCRIPTION is 'Описание формулировки для отображения в отчетах и в APEX';
