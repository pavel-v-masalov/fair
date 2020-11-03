-- Create table
create table ETL.LOAD_LOG_APEX
(
  file_id         NUMBER not null,
  user_nam        VARCHAR2(100) not null,
  snapshot_dt     DATE not null,
  start_dt        DATE not null,
  end_dt          DATE,
  status_desc     VARCHAR2(100),
  status_cd       VARCHAR2(20),
  file_name       VARCHAR2(4000),
  file_short_name VARCHAR2(4000),
  file_type_cd    VARCHAR2(4000) not null,
  blob_content    BLOB,
  mime_type       VARCHAR2(255),
  param_1         VARCHAR2(4000),
  param_2         VARCHAR2(4000),
  param_3         VARCHAR2(4000)
);
-- Add comments to the table 
comment on table ETL.LOAD_LOG_APEX
  is 'Лог для загрузки файлов в APEX';
-- Add comments to the columns 
comment on column ETL.LOAD_LOG_APEX.file_id
  is 'ID файла';
comment on column ETL.LOAD_LOG_APEX.user_nam
  is 'Пользователь';
comment on column ETL.LOAD_LOG_APEX.snapshot_dt
  is 'Отчётная дата';
comment on column ETL.LOAD_LOG_APEX.start_dt
  is 'Дата начала загрузки';
comment on column ETL.LOAD_LOG_APEX.end_dt
  is 'Дата окончание загрузки';
comment on column ETL.LOAD_LOG_APEX.status_desc
  is 'Статус (Загружен/Загружен с ошибкой/Загружается и т.д.)';
comment on column ETL.LOAD_LOG_APEX.status_cd
  is 'STATUS_CD из таблицы ETL.CTL_FILE_STATUSES';
comment on column ETL.LOAD_LOG_APEX.file_name
  is 'Полный путь к файлу';
comment on column ETL.LOAD_LOG_APEX.file_short_name
  is 'Имя файла';
comment on column ETL.LOAD_LOG_APEX.file_type_cd
  is 'Тип работы';
comment on column ETL.LOAD_LOG_APEX.blob_content
  is 'Файл';
comment on column ETL.LOAD_LOG_APEX.param_1
  is 'Параметр 1';
comment on column ETL.LOAD_LOG_APEX.param_2
  is 'Параметр 2';
comment on column ETL.LOAD_LOG_APEX.param_3
  is 'Параметр 3';
-- Create/Recreate indexes 
create unique index ETL.PK_LOAD_LOG_APEX on ETL.LOAD_LOG_APEX (FILE_ID);
create unique index ETL.UNQ_LOAD_LOG_APEX on ETL.LOAD_LOG_APEX (FILE_TYPE_CD, START_DT);
