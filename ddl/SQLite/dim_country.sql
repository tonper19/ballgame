--
-- File generated with SQLiteStudio v3.4.4 on Sun Jun 30 16:20:49 2024
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: dim_country
DROP TABLE IF EXISTS dim_country;

CREATE TABLE IF NOT EXISTS dim_country (
    COUNTRY_ID    TEXT,
    COUNTRY_NAME  TEXT,
    FEDERATION_ID TEXT,
    ADDRESS       TEXT,
    POSTAL_CODE   TEXT,
    CITY          TEXT,
    PROVINCE      TEXT,
    EMAIL         TEXT,
    WEBPAGE       TEXT
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
