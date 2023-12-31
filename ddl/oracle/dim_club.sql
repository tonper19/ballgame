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
--  DDL for Table DIM_CLUB
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."DIM_CLUB" 
   (	"ID" VARCHAR2(8 BYTE), 
	"NAME" VARCHAR2(255 BYTE), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"POSTAL_CODE" VARCHAR2(16 BYTE), 
	"CITY" VARCHAR2(50 BYTE), 
	"PROVINCE" VARCHAR2(50 BYTE), 
	"COUNTRY" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"WEBPAGE" VARCHAR2(255 BYTE), 
	"BALLPARK_ID" VARCHAR2(8 BYTE), 
	"PRESIDENT" VARCHAR2(50 BYTE), 
	"SECRETARY" VARCHAR2(50 BYTE), 
	"TREASURER" VARCHAR2(50 BYTE), 
	"GOVERNANCE_PERSON" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CLUB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##BASEBALL"."CLUB_PK" ON "C##BASEBALL"."DIM_CLUB" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table DIM_CLUB
--------------------------------------------------------

  ALTER TABLE "C##BASEBALL"."DIM_CLUB" ADD CONSTRAINT "CLUB_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
