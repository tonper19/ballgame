--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:25:16 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_sport
DROP TABLE IF EXISTS dim_sport;

CREATE TABLE IF NOT EXISTS dim_sport (
    ID     TEXT,
    GENDER TEXT,
    NAME   TEXT,
    WIKI   TEXT
);


-- Index: sport_pk
DROP INDEX IF EXISTS sport_pk;

CREATE UNIQUE INDEX IF NOT EXISTS sport_pk ON dim_sport (
    ID,
    GENDER
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
