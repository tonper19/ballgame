/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-february-23-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_country
--------------------------------------------------------
  create table c##baseball.dim_country
   (	country_id varchar2(2 byte),
	country_name varchar2(100 byte),
	federation_id varchar2(20 byte),
	address varchar2(255 byte),
	postal_code varchar2(16 byte),
	city varchar2(50 byte),
	province varchar2(50 byte),
	email varchar2(255 byte),
	webpage varchar2(255 byte)
   )
;
--------------------------------------------------------
--  ddl for index country_pk
--------------------------------------------------------

  create unique index c##baseball.country_pk on c##baseball.dim_country (country_id)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_category
--------------------------------------------------------

  alter table c##baseball.dim_country add constraint country_pk primary key (country_id)
  using index pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
