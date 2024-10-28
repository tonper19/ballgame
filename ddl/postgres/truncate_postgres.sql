/*
Copyright (c) 2024, Antonio Alberto Pérez Pérez
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.

20-07-2024  Tony Perez
*/

-- baseball
-- TRUNCATE ALL
truncate table fact_batting_stat cascade;
truncate table fact_pitching_stat cascade;
truncate table fact_fielding_stat cascade;
truncate table stg_player cascade;
truncate table stg_pitching_stat cascade;
truncate table stg_fielding_stat cascade;
truncate table stg_batting_stat cascade;
truncate table rslt_player cascade;
truncate table dim_club cascade;
truncate table dim_category cascade;
truncate table dim_season cascade;
truncate table dim_player cascade;
truncate table dim_sport cascade;
truncate table dim_country cascade;
truncate table dim_season_games cascade;
truncate table lu_team_split cascade;

