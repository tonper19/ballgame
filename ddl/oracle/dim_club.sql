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
--  ddl for table dim_club
--------------------------------------------------------

  create table c##baseball.dim_club
   (	id varchar2(8 byte),
  country_id varchar2(2 byte),  -- 20240224
	name varchar2(255 byte),
	address varchar2(255 byte),
	postal_code varchar2(16 byte),
	city varchar2(50 byte),
	province varchar2(50 byte),
	country varchar2(50 byte),
	email varchar2(255 byte),
	webpage varchar2(255 byte),
	ballpark_id varchar2(8 byte),
	president varchar2(50 byte),
	secretary varchar2(50 byte),
	treasurer varchar2(50 byte),
	governance_person varchar2(50 byte),
  club_latitude  number,
  club_longitude  number,
  stadium_latitude  number,
  stadium_longitude  number
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  ddl for index club_pk
--------------------------------------------------------

  create unique index c##baseball.club_pk on c##baseball.dim_club (id, country_id)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_club
--------------------------------------------------------

  alter table c##baseball.dim_club add constraint club_pk primary key (id, country_id)
  using index pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
