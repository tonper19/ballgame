/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-december-25-2023
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table fact_batting_stat
--------------------------------------------------------

  create table c##baseball.fact_batting_stat
   (	sport_id varchar2(8 byte),
	gender_id varchar2(8 byte),
	category_id varchar2(20 byte),
	club_id varchar2(8 byte),
  country_id varchar2(2 byte),  -- 20240224
	season_year number(*,0),
	player_id varchar2(16 byte),
	team_id number(*,0),
	at_bats number(*,0),
	runs number(*,0),
	hits number(*,0),
	doubles number(*,0),
	triples number(*,0),
	home_runs number(*,0),
	rbi number(*,0),
	total_bases number(*,0),
	base_on_balls number(*,0),
	hit_by_pitchs number(*,0),
	strike_outs number(*,0),
	ground_into_doubleplays number(*,0),
	sacrfice_flies number(*,0),
	bunts number(*,0),
	stolen_bases number(*,0),
	caught_stealing number(*,0)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  ddl for index fact_batting_stat_pk
--------------------------------------------------------

  create unique index c##baseball.fact_batting_stat_pk on c##baseball.fact_batting_stat (sport_id, gender_id, category_id, club_id, country_id, season_year, player_id, team_id)
  pctfree 10 initrans 2 maxtrans 255
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table fact_batting_stat
--------------------------------------------------------

  alter table c##baseball.fact_batting_stat modify (sport_id not null enable);
  alter table c##baseball.fact_batting_stat modify (gender_id not null enable);
  alter table c##baseball.fact_batting_stat modify (category_id not null enable);
  alter table c##baseball.fact_batting_stat modify (club_id not null enable);
  alter table c##baseball.fact_batting_stat modify (country_id not null enable);
  alter table c##baseball.fact_batting_stat modify (season_year not null enable);
  alter table c##baseball.fact_batting_stat modify (player_id not null enable);
  alter table c##baseball.fact_batting_stat add constraint fact_batting_stat_pk primary key (sport_id, gender_id, category_id, club_id, country_id, season_year, player_id, team_id)
  using index pctfree 10 initrans 2 maxtrans 255
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
--------------------------------------------------------
--  ref constraints for table fact_batting_stat
--------------------------------------------------------

  alter table c##baseball.fact_batting_stat add constraint batting_stat_sport_fk foreign key (sport_id, gender_id)
	  references c##baseball.dim_sport (id, gender) enable;
  alter table c##baseball.fact_batting_stat add constraint batting_stat_category_fk foreign key (sport_id, gender_id, category_id)
	  references c##baseball.dim_category (sport_id, gender, id) enable;
  alter table c##baseball.fact_batting_stat add constraint batting_stat_club_fk foreign key (club_id, country_id)
	  references c##baseball.dim_club (id, country_id) enable;
  alter table c##baseball.fact_batting_stat add constraint batting_stat_season_fk foreign key (season_year)
	  references c##baseball.dim_season (season_year) enable;
  alter table c##baseball.fact_batting_stat add constraint batting_stat_player_fk foreign key (player_id)
	  references c##baseball.dim_player (id) enable;
