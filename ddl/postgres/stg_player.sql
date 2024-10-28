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
--  ddl for table stg_player
--------------------------------------------------------

  create table stg_player
   (	uniform_number numeric,
	player_name varchar(255),
	position varchar(50),
	bats char(1),
	throws char(1),
	ht numeric,
	wt numeric,
	yob numeric,
	team varchar(3)
   )
;
