/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-december-25-2023
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_sport
--------------------------------------------------------

  create table c##baseball.dim_sport
   (	id varchar2(8 byte),
	gender varchar2(8 byte),
	name varchar2(50 byte),
	wiki varchar2(255 byte)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  ddl for index sport_pk
--------------------------------------------------------

  create unique index c##baseball.sport_pk on c##baseball.dim_sport (id, gender)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_sport
--------------------------------------------------------

  alter table c##baseball.dim_sport add constraint sport_pk primary key (id, gender)
  using index pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
