create table DWH.CURRATES_STG
(
  denj       DATE,
  curr       VARCHAR2(4000),
  ratename   VARCHAR2(4000),
  rateperiod NUMBER,
  ratt       NUMBER
)
organization external
(
  type ORACLE_LOADER
  default directory CSV_DIR
  access parameters
  (
    RECORDS DELIMITED BY newline
                      characterset CL8MSWIN1251
                      skip 1
                      BADFILE 'CURRATES_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      DENJ           char(4000) date_format DATE mask "mm/dd/yyyy",
      CURR           char(4000),
      RATENAME       char(4000),
      RATEPERIOD     char(4000),
      RATT           char(4000)

    )
  )
  location (CSV_DIR:'CURRATES_STG.csv')
)
reject limit UNLIMITED;
