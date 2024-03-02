/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - wednesday-february-28-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_season_games
--------------------------------------------------------

  create table c##baseball.dim_season_games
   (sport_id varchar2(8 byte),
	gender_id varchar2(8 byte),
	category_id varchar2(20 byte),
  country_id varchar2(2 byte),
	season_year number(*,0),
  number_of_games number,
  pa_coefficient number,
  innings_pitched_percent number
   )
  ;

  create unique index c##baseball.dim_season_games_pk on c##baseball.dim_season_games (sport_id, gender_id, category_id, country_id, season_year);

  alter table c##baseball.dim_season_games modify (sport_id not null enable);
  alter table c##baseball.dim_season_games modify (gender_id not null enable);
  alter table c##baseball.dim_season_games modify (category_id not null enable);
  alter table c##baseball.dim_season_games modify (country_id not null enable);
  alter table c##baseball.dim_season_games modify (season_year not null enable);
  alter table c##baseball.dim_season_games add constraint dim_season_games_pk primary key (sport_id, gender_id, category_id, country_id, season_year);
