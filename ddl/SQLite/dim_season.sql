--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:22:26 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_season
DROP TABLE IF EXISTS dim_season;

CREATE TABLE IF NOT EXISTS dim_season (
    SEASON_YEAR NUMERIC
);


-- Index: season_pk
DROP INDEX IF EXISTS season_pk;

CREATE UNIQUE INDEX IF NOT EXISTS season_pk ON dim_season (
    SEASON_YEAR
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
