create table DWH.FV_MAX_TERM (
    RATE_TYPE VARCHAR2(100),
    RATE_TYPE_CD VARCHAR2(100) primary key,
    MAX_TERM NUMBER,
    VALUE NUMBER
);
comment on table DWH.FV_MAX_TERM is 'Справочник ставок для максимальных сроков';
comment on column DWH.FV_MAX_TERM.RATE_TYPE is 'Тип спреда/ставки';
comment on column DWH.FV_MAX_TERM.RATE_TYPE_CD is 'Код типа спреда/ставки';
comment on column DWH.FV_MAX_TERM.MAX_TERM is 'Максимальный срок - Срок, при превышении которого используется заданная ставка (спред)';
comment on column DWH.FV_MAX_TERM.VALUE is 'Значение';
