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

  create table stg_pitching_stat
   (	sport_id varchar(8),
	division varchar(20),
	gender_id varchar(8),
	season_year numeric,
	last_name varchar(255),
	first_name varchar(255),
	team varchar(3),
  country_id varchar(2),  -- 20240224
	w numeric,
	l numeric,
	era numeric,
	app numeric,
	gs numeric,
	sv numeric,
	cg numeric,
	sho numeric,
	ip numeric,
	h numeric,
	r numeric,
	er numeric,
	bb numeric,
	so numeric,
	h2 numeric,
	h3 numeric,
	hr numeric,
	ab numeric,
	bavg numeric,
	wp numeric,
	hbp numeric,
	bk numeric,
	sfa numeric,
	sha numeric,
	go numeric,
	fo numeric
   )  ;
