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
--  ddl for table dim_player
--------------------------------------------------------

  create table c##baseball.dim_player
   (	id varchar2(16 byte),
	last_name varchar2(255 byte),
	first_name varchar2(255 byte),
	position varchar2(16 byte),
	bats varchar2(10 byte),
	throws varchar2(10 byte),
	yob number,
	uniform_number varchar2(3 byte),
	license_number varchar2(16 byte) default null,
	license_type varchar2(8 byte) default null
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  ddl for index player_pk
--------------------------------------------------------

  create unique index c##baseball.player_pk on c##baseball.dim_player (id)
  pctfree 10 initrans 2 maxtrans 255
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_player
--------------------------------------------------------

  alter table c##baseball.dim_player modify (id not null enable);
  alter table c##baseball.dim_player add constraint player_pk primary key (id)
  using index pctfree 10 initrans 2 maxtrans 255
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
