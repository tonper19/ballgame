/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - tuesday-december-26-2023
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table fact_pitching_stat
--------------------------------------------------------

  create table c##baseball.fact_pitching_stat
   (	sport_id varchar2(8 byte),
	gender_id varchar2(8 byte),
	category_id varchar2(20 byte),
	club_id varchar2(8 byte),
  country_id varchar2(2 byte),  -- 20240224
	season_year number(*,0),
	player_id varchar2(16 byte),
	team_id number(*,0),
	wins number(*,0),
	losses number(*,0),
	games number(*,0),
	games_started number(*,0),
	saves number(*,0),
	complete_games number(*,0),
	shutouts number(*,0),
	innings_pitched_label number(*,1),
	innings_pitched_dec number,
	inning_outs_pitched number(*,0),
	hits number(*,0),
	runs number(*,0),
	earned_runs number(*,0),
	walks number(*,0),
	strike_outs number(*,0),
	doubles number(*,0),
	triples number(*,0),
	home_runs number(*,0),
	at_bats number(*,0),
	wild_pitches number(*,0),
	hit_by_pitchs number(*,0),
	balks number(*,0),
	sacrifice_flies_against number(*,0),
	bunts_against number(*,0),
	ground_outs number(*,0),
	fly_outs number(*,0)
   ) segment creation deferred
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  tablespace users ;
--------------------------------------------------------
--  ddl for index fact_pitching_stat_pk
--------------------------------------------------------

  create unique index c##baseball.fact_pitching_stat_pk on c##baseball.fact_pitching_stat (sport_id, gender_id, category_id, club_id, country_id, season_year, player_id, team_id)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  tablespace users ;
--------------------------------------------------------
--  constraints for table fact_pitching_stat
--------------------------------------------------------

  alter table c##baseball.fact_pitching_stat modify (sport_id not null enable);
  alter table c##baseball.fact_pitching_stat modify (gender_id not null enable);
  alter table c##baseball.fact_pitching_stat modify (category_id not null enable);
  alter table c##baseball.fact_pitching_stat modify (club_id not null enable);
  alter table c##baseball.fact_pitching_stat modify (country_id not null enable);
  alter table c##baseball.fact_pitching_stat modify (season_year not null enable);
  alter table c##baseball.fact_pitching_stat modify (player_id not null enable);
  alter table c##baseball.fact_pitching_stat add constraint fact_pitching_stat_pk primary key (sport_id, gender_id, category_id, club_id, country_id, season_year, player_id, team_id)
  using index c##baseball.fact_pitching_stat_pk  enable;
--------------------------------------------------------
--  ref constraints for table fact_pitching_stat
--------------------------------------------------------

  alter table c##baseball.fact_pitching_stat add constraint pitching_stat_sport_fk foreign key (sport_id, gender_id)
	  references c##baseball.dim_sport (id, gender) enable;
  alter table c##baseball.fact_pitching_stat add constraint pitching_stat_category_fk foreign key (sport_id, gender_id, category_id)
	  references c##baseball.dim_category (sport_id, gender, id) enable;
  alter table c##baseball.fact_pitching_stat add constraint pitching_stat_club_fk foreign key (club_id, country_id)
	  references c##baseball.dim_club (id, country_id) enable;
  alter table c##baseball.fact_pitching_stat add constraint pitching_stat_season_fk foreign key (season_year)
	  references c##baseball.dim_season (season_year) enable;
  alter table c##baseball.fact_pitching_stat add constraint pitching_stat_player_fk foreign key (player_id)
	  references c##baseball.dim_player (id) enable;
