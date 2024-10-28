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
--  SQLite ddl for table stg_fielding_stat
--------------------------------------------------------
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: stg_fielding_stat
DROP TABLE IF EXISTS stg_fielding_stat;

CREATE TABLE IF NOT EXISTS  stg_fielding_stat
   (	sport_id text,
	division text,
	gender_id text,
	season_year numeric,
	last_name text,
	first_name text,
	team text,
  country_id text,  -- 20240224
	g numeric,
	c numeric,
	po numeric,
	a numeric,
	e numeric,
	fldp numeric,
	dp numeric,
	sba numeric,
	csb numeric,
	sbap numeric,
	pb numeric,
	ci numeric
   ) ;

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
