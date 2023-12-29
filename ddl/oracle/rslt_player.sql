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
--  DDL for Table RSLT_PLAYER
--------------------------------------------------------

  CREATE TABLE "C##BASEBALL"."RSLT_PLAYER" 
   (	"KEY" VARCHAR2(2000 BYTE), 
	"KEY_SEQ" VARCHAR2(2000 BYTE), 
	"LAST_NAME" VARCHAR2(255 BYTE), 
	"FIRST_NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table RSLT_PLAYER
--------------------------------------------------------

  ALTER TABLE "C##BASEBALL"."RSLT_PLAYER" MODIFY ("KEY" NOT NULL ENABLE);
  ALTER TABLE "C##BASEBALL"."RSLT_PLAYER" MODIFY ("KEY_SEQ" NOT NULL ENABLE);
