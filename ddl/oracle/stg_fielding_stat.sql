--------------------------------------------------------
--  File created - Monday-December-25-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STG_FIELDING_STAT
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."STG_FIELDING_STAT" 
   (	"SPORT_ID" VARCHAR2(8 BYTE), 
	"DIVISION" VARCHAR2(8 BYTE), 
	"GENDER_ID" VARCHAR2(8 BYTE), 
	"SEASON_YEAR" NUMBER(*,0), 
	"LAST_NAME" VARCHAR2(255 BYTE), 
	"FIRST_NAME" VARCHAR2(255 BYTE), 
	"TEAM" VARCHAR2(3 BYTE), 
	"G" NUMBER(*,0), 
	"C" NUMBER(*,0), 
	"PO" NUMBER(*,0), 
	"A" NUMBER(*,0), 
	"E" NUMBER(*,0), 
	"FLDP" NUMBER(5,3), 
	"DP" NUMBER(*,0), 
	"SBA" NUMBER(*,0), 
	"CSB" NUMBER(*,0), 
	"SBAP" NUMBER(5,1), 
	"PB" NUMBER(*,0), 
	"CI" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
