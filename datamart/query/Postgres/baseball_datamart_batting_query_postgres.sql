/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- European Baseball & Softball Datamart Query
-- 21/07/2024  Tony Pérez  initial

with sport_category as
(
  select dsp.id  as sport_id
        ,dsp.gender  as gender_id
        ,dsp.sport_name  as sport_name
        ,dsp.wiki  as sport_wiki
        ,dca.id  as category_id
        ,dca.country_id  as country_id
        ,dca.era_innings
        ,dca.category_name  as category_name
        ,dco.country_name  as federation_country_name
        ,dco.federation_id  as federation_id
        ,dco.address  as federation_address
        ,dco.postal_code  as federation_postal_code
        ,dco.city  as federation_city
        ,dco.province  as federation_province_region
        ,dco.email  as federation_email
        ,dco.webpage  as federation_webpage
    from dim_sport  as dsp
   inner join dim_category  as dca
      on dsp.id  = dca.sport_id
     and dsp.gender = dca.gender
   inner join dim_country as dco
      on dca.country_id = dco.country_id
)
,batting_stat as
(
  select fbs.*
         -- SABR metric calculations
         -- League/Season OBS (used to calculate OPS+ in a MicroStrategy metric)
        ,( sum(fbs.hits) over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         + sum(fbs.base_on_balls)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         + sum(fbs.hit_by_pitchs)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         )  league_obp_dividend
        ,( sum(fbs.at_bats)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         + sum(fbs.base_on_balls)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         + sum(fbs.hit_by_pitchs)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)
         + sum(fbs.sacrfice_flies)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)

         )  league_obp_divisor
         -- League/Season SLG (used to calculate OPS+ in a MicroStrategy metric)
        ,sum(fbs.total_bases)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)  league_slg_dividend
        ,sum(fbs.at_bats)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,fbs.country_id
                              ,fbs.season_year)  league_slg_divisor
    from fact_batting_stat  fbs
)
,stats_batting as
(
  select fbs.*
         -- SABR metrics
        ,round((fbs.league_obp_dividend / fbs.league_obp_divisor), 3) league_obp
        ,round((fbs.league_slg_dividend / fbs.league_slg_divisor), 3) league_slg
         --
     from batting_stat  fbs
)
select dpl.last_name  player_last_name
      ,dpl.first_name  player_first_name
      ,upper(substr(dpl.last_name, 1, 1)) || lower(substr(dpl.last_name, 2)) || ', ' || upper(substr(dpl.first_name, 1, 1)) || lower(substr(dpl.first_name, 2))  player_full_name

      ,dpl.player_position  player_position
      ,dpl.bats  player_bats
      ,dpl.throws  player_throws
      ,dpl.yob  player_yob
      ,dpl.uniform_number  player_uniform_number
      ,dpl.license_number  player_license_number
      ,dpl.license_type  player_license_type
      ,stat.*
       -- Batting Ranks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.at_bats desc nulls last)  rank_at_bats
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.runs desc nulls last)  rank_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.hits desc nulls last)  rank_hits
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.doubles desc nulls last)  rank_doubles
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.triples desc nulls last)  rank_triples
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.home_runs desc nulls last)  rank_home_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.rbi desc nulls last)  rank_rbi
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.total_bases desc nulls last)  rank_total_bases
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.base_on_balls desc nulls last)  rank_base_on_balls
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.hit_by_pitchs desc nulls last)  rank_hit_by_pitchs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.strike_outs desc nulls last)  rank_strike_outs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.ground_into_doubleplays desc nulls last)  rank_ground_into_doubleplays
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.sacrfice_flies desc nulls last)  rank_sacrfice_flies
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.bunts desc nulls last)  rank_bunts
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.stolen_bases desc nulls last)  rank_stolen_bases
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.caught_stealing desc nulls last)  rank_caught_stealing



      ,dsg.number_of_games  season_number_of_games
      ,dsg.pa_coefficient  season_pa_coefficient
  from dim_player  dpl
  left outer join stats_batting  stat
    on dpl.id  = stat.player_id
  left outer join dim_season_games  dsg
    on stat.sport_id = dsg.sport_id
   and stat.gender_id = dsg.gender_id
   and stat.category_id = dsg.category_id
   and stat.country_id = dsg.country_id
   and stat.season_year = dsg.season_year
 order by stat.sport_id, stat.gender_id, stat.category_id, stat.country_id, stat.season_year, 1
;
