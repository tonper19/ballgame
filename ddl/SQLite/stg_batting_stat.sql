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
--  SQLite ddl for table stg_batting_stat
--------------------------------------------------------
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: stg_player
DROP TABLE IF EXISTS stg_batting_stat;

CREATE TABLE IF NOT EXISTS  stg_batting_stat
   (	sport_id text,
	division text,
	gender_id text,
	season_year numeric,
	last_name text,
	first_name text,
	team text,
  country_id text,  -- 20240224
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


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
