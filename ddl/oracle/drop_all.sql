/*
Copyright (c) 2023, Antonio Alberto Pérez Pérez
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree.
*/

-- c##baseball
-- DROP ALL
drop table c##baseball.fact_batting_stat;
drop table c##baseball.fact_pitching_stat;
drop table c##baseball.fact_fielding_stat;
drop table c##baseball.stg_player;
drop table c##baseball.stg_pitching_stat;
drop table c##baseball.stg_fielding_stat;
drop table c##baseball.stg_batting_stat;
drop table c##baseball.rslt_player;
drop table c##baseball.dim_club;
drop table c##baseball.dim_category;
drop table c##baseball.dim_season;
drop table c##baseball.dim_player;
drop table c##baseball.dim_sport;
drop table c##baseball.dim_country;

