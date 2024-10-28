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
--  SQLite ddl for table rslt_player
--------------------------------------------------------
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: rslt_player
DROP TABLE IF EXISTS rslt_player;

CREATE TABLE IF NOT EXISTS rslt_player
   (	key text not null,
	key_seq text  not null,
	last_name text,
	first_name text
   ) ;



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
