/*
Copyright (c) 2023, Antonio Alberto Pérez Pérez
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.
*/

--------------------------------------------------------
--  File created - Monday-December-25-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STG_PITCHING_STAT
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."STG_PITCHING_STAT" 
   (	"SPORT_ID" VARCHAR2(8 BYTE), 
	"DIVISION" VARCHAR2(8 BYTE), 
	"GENDER_ID" VARCHAR2(8 BYTE), 
	"SEASON_YEAR" NUMBER(*,0), 
	"LAST_NAME" VARCHAR2(255 BYTE), 
	"FIRST_NAME" VARCHAR2(255 BYTE), 
	"TEAM" VARCHAR2(3 BYTE), 
	"W" NUMBER(*,0), 
	"L" NUMBER(*,0), 
	"ERA" NUMBER(5,2), 
	"APP" NUMBER(*,0), 
	"GS" NUMBER(*,0), 
	"SV" NUMBER(*,0), 
	"CG" NUMBER(*,0), 
	"SHO" NUMBER(*,0), 
	"IP" NUMBER(5,1), 
	"H" NUMBER(*,0), 
	"R" NUMBER(*,0), 
	"ER" NUMBER(*,0), 
	"BB" NUMBER(*,0), 
	"SO" NUMBER(*,0), 
	"H2" NUMBER(*,0), 
	"H3" NUMBER(*,0), 
	"HR" NUMBER(*,0), 
	"AB" NUMBER(*,0), 
	"BAVG" NUMBER(5,3), 
	"WP" NUMBER(*,0), 
	"HBP" NUMBER(*,0), 
	"BK" NUMBER(*,0), 
	"SFA" NUMBER(*,0), 
	"SHA" NUMBER(*,0), 
	"GO" NUMBER(*,0), 
	"FO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
