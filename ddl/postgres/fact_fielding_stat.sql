/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - tuesday-december-26-2023
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table fact_fielding_stat
--------------------------------------------------------

CREATE TABLE FACT_FIELDING_STAT (
	SPORT_ID varchar(8) NOT NULL,
	GENDER_ID varchar(8) NOT NULL,
	CATEGORY_ID varchar(20) NOT NULL,
	CLUB_ID varchar(8) NOT NULL,
	COUNTRY_ID varchar(2) NOT NULL,
	SEASON_YEAR numeric NOT NULL,
	PLAYER_ID varchar(16) NOT NULL,
	TEAM_ID numeric NOT NULL,
	GAMES_PLAYED_AT_POSITION numeric,
	TOTAL_CHANCES numeric,
	TOTAL_SUCCESSFUL_CHANCES numeric,
	PUTOUTS numeric,
	ASSISTS numeric,
	ERRORS numeric,
	DOUBLEPLAYS numeric,
	STOLEN_BASES_AGAINST numeric,
	PLAYERS_CAUGHT_STEELING numeric,
	PASSED_BALLS numeric,
	CATCHER_INTERFERENCES numeric,
	PRIMARY KEY (SPORT_ID,GENDER_ID,CATEGORY_ID,CLUB_ID,COUNTRY_ID,SEASON_YEAR,PLAYER_ID,TEAM_ID)
);

ALTER TABLE FACT_FIELDING_STAT
	ADD FOREIGN KEY (SEASON_YEAR)
	REFERENCES DIM_SEASON (SEASON_YEAR);

ALTER TABLE FACT_FIELDING_STAT
	ADD FOREIGN KEY (CLUB_ID, country_id)
	REFERENCES DIM_CLUB (ID, country_id);

ALTER TABLE FACT_FIELDING_STAT
	ADD FOREIGN KEY (SPORT_ID, gender_id)
	REFERENCES DIM_SPORT (ID, gender);

ALTER TABLE FACT_FIELDING_STAT
	ADD FOREIGN KEY (SPORT_ID,GENDER_id,category_ID)
	REFERENCES DIM_CATEGORY (SPORT_ID,GENDER,ID);

ALTER TABLE FACT_FIELDING_STAT
	ADD FOREIGN KEY (PLAYER_ID)
	REFERENCES DIM_PLAYER (ID);

