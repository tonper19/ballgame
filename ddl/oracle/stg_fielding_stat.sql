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
--  ddl for table stg_fielding_stat
--------------------------------------------------------

  create table c##baseball.stg_fielding_stat
   (	sport_id varchar2(8 byte),
	division varchar2(20 byte),
	gender_id varchar2(8 byte),
	season_year number(*,0),
	last_name varchar2(255 byte),
	first_name varchar2(255 byte),
	team varchar2(3 byte),
  country_id varchar2(2 byte),  -- 20240224
	g number(*,0),
	c number(*,0),
	po number(*,0),
	a number(*,0),
	e number(*,0),
	fldp number(5,3),
	dp number(*,0),
	sba number(*,0),
	csb number(*,0),
	sbap number(5,1),
	pb number(*,0),
	ci number(*,0)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
