--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:11:43 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_category
DROP TABLE IF EXISTS dim_category;

CREATE TABLE IF NOT EXISTS dim_category (
    SPORT_ID    TEXT,
    GENDER      TEXT,
    ID          TEXT,
    COUNTRY_ID  TEXT,
    ERA_INNINGS NUMERIC,
    NAME        TEXT
);


-- Index: category_pk
DROP INDEX IF EXISTS category_pk;

CREATE UNIQUE INDEX IF NOT EXISTS category_pk ON dim_category (
    SPORT_ID,
    GENDER,
    ID
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
