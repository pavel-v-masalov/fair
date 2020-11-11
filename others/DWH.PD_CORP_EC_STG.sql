create table DWH.PD_CORP_EC_STG
(
  rank_model  VARCHAR2(4000),
  rat_on_date VARCHAR2(4000),
  pd          NUMBER
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
                      BADFILE 'PD_CORP_EC_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      RANK_MODEL           char(4000),
      RAT_ON_DATE          char(4000),
      PD                   char(4000)
    )
  )
  location (CSV_DIR:'PD_CORP_EC_STG.csv')
)
reject limit UNLIMITED;
