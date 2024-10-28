--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:23:21 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_season_games
DROP TABLE IF EXISTS dim_season_games;

CREATE TABLE IF NOT EXISTS dim_season_games (
    SPORT_ID                TEXT,
    GENDER_ID               TEXT,
    CATEGORY_ID             TEXT,
    COUNTRY_ID              TEXT,
    SEASON_YEAR             NUMERIC,
    NUMBER_OF_GAMES         NUMERIC,
    PA_COEFFICIENT          NUMERIC,
    INNINGS_PITCHED_PERCENT NUMERIC
);


-- Index: dim_season_games_pk
DROP INDEX IF EXISTS dim_season_games_pk;

CREATE UNIQUE INDEX IF NOT EXISTS dim_season_games_pk ON dim_season_games (
    SPORT_ID,
    GENDER_ID,
    CATEGORY_ID,
    COUNTRY_ID,
    SEASON_YEAR
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
