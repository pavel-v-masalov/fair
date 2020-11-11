create table DWH.REF_LGD_STG
(
  leasing_subject_type_cd VARCHAR2(4000),
  lgd                     NUMBER
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
                      BADFILE 'REF_LGD_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      LEASING_SUBJECT_TYPE_CD  char(4000),
      LGD                      char(4000)
    )
  )
  location (CSV_DIR:'REF_LGD_STG.csv')
)
reject limit UNLIMITED;
