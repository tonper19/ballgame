--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:21:38 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_player
DROP TABLE IF EXISTS dim_player;

CREATE TABLE IF NOT EXISTS dim_player (
    ID             TEXT,
    LAST_NAME      TEXT,
    FIRST_NAME     TEXT,
    POSITION       TEXT,
    BATS           TEXT,
    THROWS         TEXT,
    YOB            NUMERIC,
    UNIFORM_NUMBER TEXT,
    LICENSE_NUMBER TEXT,
    LICENSE_TYPE   TEXT
);


-- Index: player_pk
DROP INDEX IF EXISTS player_pk;

CREATE UNIQUE INDEX IF NOT EXISTS player_pk ON dim_player (
    ID
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
