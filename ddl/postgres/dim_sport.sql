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
--  ddl for table dim_sport
--------------------------------------------------------

CREATE TABLE DIM_SPORT (
	ID varchar(8) NOT NULL,
	GENDER varchar(8) NOT NULL,
	sport_NAME varchar(50),
	WIKI varchar(255),
	PRIMARY KEY (ID,GENDER)
);
