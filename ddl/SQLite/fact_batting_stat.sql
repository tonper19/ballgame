--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:26:06 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: fact_batting_stat
DROP TABLE IF EXISTS fact_batting_stat;

CREATE TABLE IF NOT EXISTS fact_batting_stat (
    SPORT_ID                TEXT,
    GENDER_ID               TEXT,
    CATEGORY_ID             TEXT,
    CLUB_ID                 TEXT,
    COUNTRY_ID              TEXT,
    SEASON_YEAR             NUMERIC,
    PLAYER_ID               TEXT,
    TEAM_ID                 NUMERIC,
    AT_BATS                 NUMERIC,
    RUNS                    NUMERIC,
    HITS                    NUMERIC,
    DOUBLES                 NUMERIC,
    TRIPLES                 NUMERIC,
    HOME_RUNS               NUMERIC,
    RBI                     NUMERIC,
    TOTAL_BASES             NUMERIC,
    BASE_ON_BALLS           NUMERIC,
    HIT_BY_PITCHS           NUMERIC,
    STRIKE_OUTS             NUMERIC,
    GROUND_INTO_DOUBLEPLAYS NUMERIC,
    SACRFICE_FLIES          NUMERIC,
    BUNTS                   NUMERIC,
    STOLEN_BASES            NUMERIC,
    CAUGHT_STEALING         NUMERIC
);


-- Index: fact_batting_stat_pk
DROP INDEX IF EXISTS fact_batting_stat_pk;

CREATE INDEX IF NOT EXISTS fact_batting_stat_pk ON fact_batting_stat (
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
