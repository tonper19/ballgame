--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:19:58 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_club
DROP TABLE IF EXISTS dim_club;

CREATE TABLE IF NOT EXISTS dim_club (
    ID                TEXT,
    COUNTRY_ID        TEXT,
    NAME              TEXT,
    ADDRESS           TEXT,
    POSTAL_CODE       TEXT,
    CITY              TEXT,
    PROVINCE          TEXT,
    COUNTRY           TEXT,
    EMAIL             TEXT,
    WEBPAGE           TEXT,
    BALLPARK_ID       TEXT,
    PRESIDENT         TEXT,
    SECRETARY         TEXT,
    TREASURER         TEXT,
    GOVERNANCE_PERSON TEXT,
    CLUB_LATITUDE     NUMERIC,
    CLUB_LONGITUDE    NUMERIC,
    STADIUM_LATITUDE  NUMERIC,
    STADIUM_LONGITUDE NUMERIC
);


-- Index: club_pk
DROP INDEX IF EXISTS club_pk;

CREATE UNIQUE INDEX IF NOT EXISTS club_pk ON dim_club (
    ID,
    COUNTRY_ID
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
