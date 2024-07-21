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
--  ddl for table stg_pitching_stat
--------------------------------------------------------

  create table c##baseball.stg_pitching_stat
   (	sport_id varchar2(8 byte),
	division varchar2(20 byte),
	gender_id varchar2(8 byte),
	season_year number(*,0),
	last_name varchar2(255 byte),
	first_name varchar2(255 byte),
	team varchar2(3 byte),
  country_id varchar2(2 byte),  -- 20240224
	w number(*,0),
	l number(*,0),
	era number(5,2),
	app number(*,0),
	gs number(*,0),
	sv number(*,0),
	cg number(*,0),
	sho number(*,0),
	ip number(5,1),
	h number(*,0),
	r number(*,0),
	er number(*,0),
	bb number(*,0),
	so number(*,0),
	h2 number(*,0),
	h3 number(*,0),
	hr number(*,0),
	ab number(*,0),
	bavg number(5,3),
	wp number(*,0),
	hbp number(*,0),
	bk number(*,0),
	sfa number(*,0),
	sha number(*,0),
	go number(*,0),
	fo number(*,0)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
