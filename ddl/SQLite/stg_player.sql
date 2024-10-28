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
--  SQLite ddl for table stg_player
--------------------------------------------------------
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: stg_player
DROP TABLE IF EXISTS dim_player;

CREATE TABLE IF NOT EXISTS  stg_player
   (	uniform_number numeric,
	player_name text,
	position text,
	bats text,
	throws text,
	ht numeric,
	wt numeric,
	yob numeric,
	team text
   )
;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
