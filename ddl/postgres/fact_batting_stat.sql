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
--  ddl for table fact_batting_stat
--------------------------------------------------------

CREATE TABLE FACT_BATTING_STAT (
	SPORT_ID varchar(8) NOT NULL,
	GENDER_ID varchar(8) NOT NULL,
	CATEGORY_ID varchar(20) NOT NULL,
	CLUB_ID varchar(8) NOT NULL,
	COUNTRY_ID varchar(2) NOT NULL,
	SEASON_YEAR numeric NOT NULL,
	PLAYER_ID varchar(16) NOT NULL,
	TEAM_ID numeric NOT NULL,
	AT_BATS numeric,
	RUNS numeric,
	HITS numeric,
	DOUBLES numeric,
	TRIPLES numeric,
	HOME_RUNS numeric,
	RBI numeric,
	TOTAL_BASES numeric,
	BASE_ON_BALLS numeric,
	HIT_BY_PITCHS numeric,
	STRIKE_OUTS numeric,
	GROUND_INTO_DOUBLEPLAYS numeric,
	SACRFICE_FLIES numeric,
	BUNTS numeric,
	STOLEN_BASES numeric,
	CAUGHT_STEALING numeric,
	PRIMARY KEY (SPORT_ID,GENDER_ID,CATEGORY_ID,CLUB_ID,COUNTRY_ID,SEASON_YEAR,PLAYER_ID,TEAM_ID)
);

ALTER TABLE FACT_BATTING_STAT
	ADD FOREIGN KEY (SEASON_YEAR)
	REFERENCES DIM_SEASON (SEASON_YEAR);

ALTER TABLE FACT_BATTING_STAT
	ADD FOREIGN KEY (CLUB_ID, country_id)
	REFERENCES DIM_CLUB (ID, country_id);

ALTER TABLE FACT_BATTING_STAT
	ADD FOREIGN KEY (SPORT_ID, gender_id)
	REFERENCES DIM_SPORT (ID, gender);

ALTER TABLE FACT_BATTING_STAT
	ADD FOREIGN KEY (SPORT_ID,GENDER_id,category_ID)
	REFERENCES DIM_CATEGORY (SPORT_ID,GENDER,ID);

ALTER TABLE FACT_BATTING_STAT
	ADD FOREIGN KEY (PLAYER_ID)
	REFERENCES DIM_PLAYER (ID);

