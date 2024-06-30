--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:26:41 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: fact_fielding_stat
DROP TABLE IF EXISTS fact_fielding_stat;

CREATE TABLE IF NOT EXISTS fact_fielding_stat (
    SPORT_ID                 TEXT,
    GENDER_ID                TEXT,
    CATEGORY_ID              TEXT,
    CLUB_ID                  TEXT,
    COUNTRY_ID               TEXT,
    SEASON_YEAR              NUMERIC,
    PLAYER_ID                TEXT,
    TEAM_ID                  NUMERIC,
    GAMES_PLAYED_AT_POSITION NUMERIC,
    TOTAL_CHANCES            NUMERIC,
    TOTAL_SUCCESSFUL_CHANCES NUMERIC,
    PUTOUTS                  NUMERIC,
    ASSISTS                  NUMERIC,
    ERRORS                   NUMERIC,
    DOUBLEPLAYS              NUMERIC,
    STOLEN_BASES_AGAINST     NUMERIC,
    PLAYERS_CAUGHT_STEELING  NUMERIC,
    PASSED_BALLS             NUMERIC,
    CATCHER_INTERFERENCES    NUMERIC
);


-- Index: fact_fielding_stat_pk
DROP INDEX IF EXISTS fact_fielding_stat_pk;

CREATE INDEX IF NOT EXISTS fact_fielding_stat_pk ON fact_fielding_stat (
    SPORT_ID,
    GENDER_ID,
    CATEGORY_ID,
    CLUB_ID,
    COUNTRY_ID,
    SEASON_YEAR,
    PLAYER_ID,
    TEAM_ID
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
