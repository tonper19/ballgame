/*
Copyright (c) 2023, Antonio Alberto Pérez Pérez
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.
*/

-- baseball Postgres DB
-- drop stage and result tables
-- they are recreated at ETL Start
-- 21/12/2023  Tony Perez
drop table stg_player;
drop table stg_pitching_stat;
drop table stg_fielding_stat;
drop table stg_batting_stat;
drop table rslt_player;
drop table lu_team_split;