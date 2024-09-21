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
--  ddl for table stg_batting_stat
--------------------------------------------------------

  create table stg_batting_stat
   (	sport_id varchar(8),
	division varchar(20),
	gender_id varchar(8),
	season_year numeric,
	last_name varchar(255),
	first_name varchar(255),
	team varchar(3),
  country_id varchar(2),  -- 20240224
	ab numeric,
	r numeric,
	h numeric,
	h2 numeric,
	h3 numeric,
	hr numeric,
	rbi numeric,
	tb numeric,
	avg numeric,
	slg numeric,
	obp numeric,
	ops numeric,
	bb numeric,
	hbp numeric,
	so numeric,
	gdp numeric,
	sf numeric,
	sh numeric,
	sb numeric,
	cs numeric
   )
  ;