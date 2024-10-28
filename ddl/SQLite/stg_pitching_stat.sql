/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - 21/09/2024
--------------------------------------------------------
--------------------------------------------------------
--  SQLite ddl for table stg_pitching_stat
--------------------------------------------------------
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: stg_pitching_stat
DROP TABLE IF EXISTS stg_pitching_stat;

CREATE TABLE IF NOT EXISTS  stg_pitching_stat
   (	sport_id text,
	division text,
	gender_id text,
	season_year numeric,
	last_name text,
	first_name text,
	team text,
  country_id text,  -- 20240224
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


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
