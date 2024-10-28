/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-february-23-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_country
--------------------------------------------------------

CREATE TABLE DIM_COUNTRY (
	COUNTRY_ID varchar(2) NOT NULL,
	COUNTRY_NAME varchar(100),
	FEDERATION_ID varchar(20),
	ADDRESS varchar(255),
	POSTAL_CODE varchar(16),
	CITY varchar(50),
	PROVINCE varchar(50),
	EMAIL varchar(255),
	WEBPAGE varchar(255),
	PRIMARY KEY (COUNTRY_ID)
);
