create table DWH.PD_CORP_STG
(
  rating_model VARCHAR2(4000),
  rat_on_date  VARCHAR2(4000),
  pd1_macro    NUMBER,
  pd2_macro    NUMBER,
  pd3_macro    NUMBER,
  pd4_macro    NUMBER,
  pd5_macro    NUMBER,
  pd6_macro    NUMBER,
  pd7_macro    NUMBER,
  pd8_macro    NUMBER,
  pd9_macro    NUMBER,
  pd10_macro   NUMBER
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
                      BADFILE 'PD_CORP_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      RATING_MODEL         char(4000),
      RAT_ON_DATE          char(4000),
      PD1_MACRO            char(4000),
      PD2_MACRO            char(4000),
      PD3_MACRO            char(4000),
      PD4_MACRO            char(4000),
      PD5_MACRO            char(4000),
      PD6_MACRO            char(4000),
      PD7_MACRO            char(4000),
      PD8_MACRO            char(4000),
      PD9_MACRO            char(4000),
      PD10_MACRO           char(4000)
    )
  )
  location (CSV_DIR:'PD_CORP_STG.csv')
)
reject limit UNLIMITED;
