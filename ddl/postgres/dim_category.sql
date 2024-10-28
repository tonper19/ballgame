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
--  ddl for table dim_category
--------------------------------------------------------
CREATE TABLE DIM_CATEGORY (
	SPORT_ID varchar(8) NOT NULL,
	GENDER varchar(8) NOT NULL,
	ID varchar(20) NOT NULL,
	COUNTRY_ID varchar(2),
	ERA_INNINGS numeric,
	category_NAME varchar(50),
	PRIMARY KEY (SPORT_ID,GENDER,ID)
);
