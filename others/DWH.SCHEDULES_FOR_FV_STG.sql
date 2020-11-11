create table DWH.SCHEDULES_FOR_FV_STG
(
  date_from DATE,
  date_to   DATE,
  loan_amt  NUMBER
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
                      BADFILE 'SCHEDULES_FOR_FV_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      date_from     char(4000) date_format DATE mask "mm/dd/yyyy",
      date_to       char(4000) date_format DATE mask "mm/dd/yyyy",
      loan_amt      char(4000)

    )
  )
  location (CSV_DIR:'SCHEDULES_FOR_FV_STG.csv')
)
reject limit UNLIMITED;
