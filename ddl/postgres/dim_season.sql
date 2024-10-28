/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - friday-july-19-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_season
--------------------------------------------------------

CREATE TABLE DIM_SEASON (
	SEASON_YEAR numeric NOT NULL,
	PRIMARY KEY (SEASON_YEAR)
);
