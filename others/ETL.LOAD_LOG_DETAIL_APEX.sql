create table ETL.LOAD_LOG_DETAIL_APEX
(
    log_detail_key NUMBER not null,
    file_id        NUMBER not null,
    row_number     NUMBER,
    code           VARCHAR2(4000),
    text           VARCHAR2(4000),
    description    VARCHAR2(4000),
    error_flg      NUMBER,
    visible        NUMBER
);
