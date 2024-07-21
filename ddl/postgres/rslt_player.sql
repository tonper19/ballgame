/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - friday-july-19-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table rslt_player
--------------------------------------------------------

  create table c##baseball.rslt_player
   (	key varchar2(2000 byte),
	key_seq varchar2(2000 byte),
	last_name varchar2(255 byte),
	first_name varchar2(255 byte)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table rslt_player
--------------------------------------------------------

  alter table c##baseball.rslt_player modify (key not null enable);
  alter table c##baseball.rslt_player modify (key_seq not null enable);
