--------------------------------------------------------
--  File created - Monday-December-25-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STG_BATTING_STAT
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."STG_BATTING_STAT" 
   (	"SPORT_ID" VARCHAR2(8 BYTE), 
	"DIVISION" VARCHAR2(8 BYTE), 
	"GENDER_ID" VARCHAR2(8 BYTE), 
	"SEASON_YEAR" NUMBER(*,0), 
	"LAST_NAME" VARCHAR2(255 BYTE), 
	"FIRST_NAME" VARCHAR2(255 BYTE), 
	"TEAM" VARCHAR2(3 BYTE), 
	"AB" NUMBER(*,0), 
	"R" NUMBER(*,0), 
	"H" NUMBER(*,0), 
	"H2" NUMBER(*,0), 
	"H3" NUMBER(*,0), 
	"HR" NUMBER(*,0), 
	"RBI" NUMBER(*,0), 
	"TB" NUMBER(*,0), 
	"AVG" NUMBER(5,3), 
	"SLG" NUMBER(5,3), 
	"OBP" NUMBER(5,3), 
	"OPS" NUMBER(5,3), 
	"BB" NUMBER(*,0), 
	"HBP" NUMBER(*,0), 
	"SO" NUMBER(*,0), 
	"GDP" NUMBER(*,0), 
	"SF" NUMBER(*,0), 
	"SH" NUMBER(*,0), 
	"SB" NUMBER(*,0), 
	"CS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
