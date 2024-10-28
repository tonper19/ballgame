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
--  ddl for table dim_club
--------------------------------------------------------

CREATE TABLE DIM_CLUB (
	ID varchar(8) NOT NULL,
	COUNTRY_ID varchar(2) NOT NULL,
	club_NAME varchar(255),
	ADDRESS varchar(255),
	POSTAL_CODE varchar(16),
	CITY varchar(50),
	PROVINCE varchar(50),
	COUNTRY varchar(50),
	EMAIL varchar(255),
	WEBPAGE varchar(255),
	BALLPARK_ID varchar(8),
	PRESIDENT varchar(50),
	SECRETARY varchar(50),
	TREASURER varchar(50),
	GOVERNANCE_PERSON varchar(50),
	CLUB_LATITUDE numeric,
	CLUB_LONGITUDE numeric,
	STADIUM_LATITUDE numeric,
	STADIUM_LONGITUDE numeric,
	PRIMARY KEY (ID,COUNTRY_ID)
);
