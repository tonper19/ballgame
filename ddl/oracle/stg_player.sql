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
--  DDL for Table STG_PLAYER
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."STG_PLAYER" 
   (	"UNIFORM_NUMBER" NUMBER(*,0), 
	"PLAYER_NAME" VARCHAR2(255 BYTE), 
	"POSITION" VARCHAR2(50 BYTE), 
	"BATS" CHAR(1 BYTE), 
	"THROWS" CHAR(1 BYTE), 
	"HT" NUMBER(*,0), 
	"WT" NUMBER(*,0), 
	"YOB" NUMBER(*,0), 
	"TEAM" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
