create table DWH.FV_MSFO_RATES_STG
(
  comission_rate VARCHAR2(4000),
  term_year      VARCHAR2(4000),
  fv_msfo_rate   NUMBER
)
organization external
(
  type ORACLE_LOADER
  default directory CSV_DIR
  access parameters
  (
    RECORDS DELIMITED BY newline
                      characterset CL8MSWIN1251
                      skip 2
                      BADFILE 'FV_MSFO_RATES_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      COMISSION_RATE     char(4000),
      TERM_YEAR          char(4000),
      FV_MSFO_RATE       char(4000)
    )
  )
  location (CSV_DIR:'FV_MSFO_RATES_STG.csv')
)
reject limit UNLIMITED;
