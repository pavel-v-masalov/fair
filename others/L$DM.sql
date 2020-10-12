--------------------------------------------------------
--  File created - суббота-Сентябрь-26-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table L$DM
--------------------------------------------------------

  CREATE TABLE "DM"."L$DM" 
   (	"DT" TIMESTAMP (6), 
	"PROC_NAME" VARCHAR2(256 BYTE), 
	"STEP_NAME" VARCHAR2(256 BYTE), 
	"INFO" VARCHAR2(4000 BYTE), 
	"CLIENT_IDENTIFIER" VARCHAR2(256 BYTE) DEFAULT sys_context('USERENV','CLIENT_IDENTIFIER'), 
	"SESSION_USER" VARCHAR2(256 BYTE) DEFAULT sys_context('USERENV','SESSION_USER')
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT);

   COMMENT ON COLUMN "DM"."L$DM"."INFO" IS 'Detail info';
