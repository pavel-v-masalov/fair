CREATE TABLE "DWH"."REQ_PAYMENTS_UNLOAD_STG"
   (    "BRANCH_NAM" VARCHAR2(1000),
    "SELECTION_METHOD" VARCHAR2(1000),
    "CONTRACT_ID_CD" VARCHAR2(1000),
    "CONTRACT_NUM" VARCHAR2(1000),
    "CONTRACT_NUM_FULL" VARCHAR2(1000),
    "CLIENT_ID" VARCHAR2(1000),
    "SHORT_CLIENT_RU_NAM" VARCHAR2(1000)
   )
   ORGANIZATION EXTERNAL
    ( TYPE ORACLE_LOADER
      DEFAULT DIRECTORY "CSV_DIR"
      ACCESS PARAMETERS
      ( RECORDS DELIMITED BY newline
                      characterset CL8MSWIN1251
                      skip 2
                      BADFILE 'REQ_PAYMENTS_UNLOAD_STG_BAD.bad'
                      NODISCARDFILE
                      NOLOGFILE
                      READSIZE 1048576
                      fields terminated by ","  optionally enclosed by '"'  notrim
                      missing field values are null
                      reject rows with all null fields
    (
      BRANCH_NAM           char(1000),
      SELECTION_METHOD     char(1000),
      CONTRACT_ID_CD       char(1000),
      CONTRACT_NUM         char(1000),
      CONTRACT_NUM_FULL    char(1000),
      CLIENT_ID            char(1000),
      SHORT_CLIENT_RU_NAM  char(1000)
    )
      )
      LOCATION
       ( 'REQ_PAYMENTS_UNLOAD_STG.csv'
       )
    )
   REJECT LIMIT UNLIMITED