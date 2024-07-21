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
--  ddl for table fact_pitching_stat
--------------------------------------------------------

CREATE TABLE FACT_PITCHING_STAT (
	SPORT_ID varchar(8) NOT NULL,
	GENDER_ID varchar(8) NOT NULL,
	CATEGORY_ID varchar(20) NOT NULL,
	CLUB_ID varchar(8) NOT NULL,
	COUNTRY_ID varchar(2) NOT NULL,
	SEASON_YEAR numeric NOT NULL,
	PLAYER_ID varchar(16) NOT NULL,
	TEAM_ID numeric NOT NULL,
	WINS numeric,
	LOSSES numeric,
	GAMES numeric,
	GAMES_STARTED numeric,
	SAVES numeric,
	COMPLETE_GAMES numeric,
	SHUTOUTS numeric,
	INNINGS_PITCHED_LABEL numeric,
	INNINGS_PITCHED_DEC numeric,
	INNING_OUTS_PITCHED numeric,
	HITS numeric,
	RUNS numeric,
	EARNED_RUNS numeric,
	WALKS numeric,
	STRIKE_OUTS numeric,
	DOUBLES numeric,
	TRIPLES numeric,
	HOME_RUNS numeric,
	AT_BATS numeric,
	WILD_PITCHES numeric,
	HIT_BY_PITCHS numeric,
	BALKS numeric,
	SACRIFICE_FLIES_AGAINST numeric,
	BUNTS_AGAINST numeric,
	GROUND_OUTS numeric,
	FLY_OUTS numeric,
	PRIMARY KEY (SPORT_ID,GENDER_ID,CATEGORY_ID,CLUB_ID,COUNTRY_ID,SEASON_YEAR,PLAYER_ID,TEAM_ID)
);

ALTER TABLE FACT_PITCHING_STAT
	ADD FOREIGN KEY (SEASON_YEAR)
	REFERENCES DIM_SEASON (SEASON_YEAR);

ALTER TABLE FACT_PITCHING_STAT
	ADD FOREIGN KEY (CLUB_ID, country_id)
	REFERENCES DIM_CLUB (ID, country_id);

ALTER TABLE FACT_PITCHING_STAT
	ADD FOREIGN KEY (SPORT_ID, gender_id)
	REFERENCES DIM_SPORT (ID, gender);

ALTER TABLE FACT_PITCHING_STAT
	ADD FOREIGN KEY (SPORT_ID,GENDER_id,category_ID)
	REFERENCES DIM_CATEGORY (SPORT_ID,GENDER,ID);

ALTER TABLE FACT_PITCHING_STAT
	ADD FOREIGN KEY (PLAYER_ID)
	REFERENCES DIM_PLAYER (ID);

