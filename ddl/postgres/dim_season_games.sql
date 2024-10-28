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
--  ddl for table dim_season_games
--------------------------------------------------------

CREATE TABLE DIM_SEASON_GAMES (
	SPORT_ID varchar(8) NOT NULL,
	GENDER_ID varchar(8) NOT NULL,
	CATEGORY_ID varchar(20) NOT NULL,
	COUNTRY_ID varchar(2) NOT NULL,
	SEASON_YEAR numeric NOT NULL,
	NUMBER_OF_GAMES numeric,
	PA_COEFFICIENT numeric,
	INNINGS_PITCHED_PERCENT numeric,
	PRIMARY KEY (SPORT_ID,GENDER_ID,CATEGORY_ID,COUNTRY_ID,SEASON_YEAR)
);
