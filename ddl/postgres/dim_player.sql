/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - friday-july-19-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_player
--------------------------------------------------------

CREATE TABLE DIM_PLAYER (
	ID varchar(16) NOT NULL,
	LAST_NAME varchar(255),
	FIRST_NAME varchar(255),
	player_POSITION varchar(32),
	BATS varchar(10),
	THROWS varchar(10),
	YOB numeric,
	UNIFORM_NUMBER varchar(3),
	LICENSE_NUMBER varchar(16),
	LICENSE_TYPE varchar(8) DEFAULT 'null
   ',
	PRIMARY KEY (ID)
);
