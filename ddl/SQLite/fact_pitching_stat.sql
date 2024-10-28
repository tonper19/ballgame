--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:27:18 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: fact_pitching_stat
DROP TABLE IF EXISTS fact_pitching_stat;

CREATE TABLE IF NOT EXISTS fact_pitching_stat (
    SPORT_ID                TEXT,
    GENDER_ID               TEXT,
    CATEGORY_ID             TEXT,
    CLUB_ID                 TEXT,
    COUNTRY_ID              TEXT,
    SEASON_YEAR             NUMERIC,
    PLAYER_ID               TEXT,
    TEAM_ID                 NUMERIC,
    WINS                    NUMERIC,
    LOSSES                  NUMERIC,
    GAMES                   NUMERIC,
    GAMES_STARTED           NUMERIC,
    SAVES                   NUMERIC,
    COMPLETE_GAMES          NUMERIC,
    SHUTOUTS                NUMERIC,
    INNINGS_PITCHED_LABEL   NUMERIC,
    INNINGS_PITCHED_DEC     NUMERIC,
    INNING_OUTS_PITCHED     NUMERIC,
    HITS                    NUMERIC,
    RUNS                    NUMERIC,
    EARNED_RUNS             NUMERIC,
    WALKS                   NUMERIC,
    STRIKE_OUTS             NUMERIC,
    DOUBLES                 NUMERIC,
    TRIPLES                 NUMERIC,
    HOME_RUNS               NUMERIC,
    AT_BATS                 NUMERIC,
    WILD_PITCHES            NUMERIC,
    HIT_BY_PITCHS           NUMERIC,
    BALKS                   NUMERIC,
    SACRIFICE_FLIES_AGAINST NUMERIC,
    BUNTS_AGAINST           NUMERIC,
    GROUND_OUTS             NUMERIC,
    FLY_OUTS                NUMERIC
);


-- Index: fact_pitching_stat_pk
DROP INDEX IF EXISTS fact_pitching_stat_pk;

CREATE INDEX IF NOT EXISTS fact_pitching_stat_pk ON fact_pitching_stat (
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
