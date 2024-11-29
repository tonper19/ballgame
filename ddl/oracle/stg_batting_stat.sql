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
--  ddl for table stg_batting_stat
--------------------------------------------------------

  create table c##baseball.stg_batting_stat
   (	sport_id varchar2(8 byte),
	division varchar2(20 byte),
	gender_id varchar2(8 byte),
	season_year number(*,0),
	last_name varchar2(255 byte),
	first_name varchar2(255 byte),
	team varchar2(8 byte),
  country_id varchar2(2 byte),  -- 20240224
	ab number(*,0),
	r number(*,0),
	h number(*,0),
	h2 number(*,0),
	h3 number(*,0),
	hr number(*,0),
	rbi number(*,0),
	tb number(*,0),
	avg number(5,3),
	slg number(5,3),
	obp number(5,3),
	ops number(5,3),
	bb number(*,0),
	hbp number(*,0),
	so number(*,0),
	gdp number(*,0),
	sf number(*,0),
	sh number(*,0),
	sb number(*,0),
	cs number
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
