/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-december-25-2023
--  modified friday-february-23-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_category
--------------------------------------------------------

  create table c##baseball.dim_category
   (	sport_id varchar2(8 byte),
	gender varchar2(8 byte),
	id varchar2(20 byte),
  country_id varchar2(2 byte),  -- 20240224
  era_innings number,
	name varchar2(50 byte)
   )
;
--------------------------------------------------------
--  ddl for index category_pk
--------------------------------------------------------

  create unique index c##baseball.category_pk on c##baseball.dim_category (sport_id, gender, id)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_category
--------------------------------------------------------

  alter table c##baseball.dim_category add constraint category_pk primary key (sport_id, gender, id)
  using index pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
