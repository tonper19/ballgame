/*
Copyright (c) 2023, Antonio Alberto Pérez Pérez
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.
*/

-- c##baseball
-- drop stage and result tables
-- they are recreated at ETL Start
-- 26/12/2023  Tony Perez
drop table c##baseball.stg_player;
drop table c##baseball.stg_pitching_stat;
drop table c##baseball.stg_fielding_stat;
drop table c##baseball.stg_batting_stat;
drop table c##baseball.rslt_player;
drop table c##baseball.lu_team_split;