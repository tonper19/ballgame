/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- European Baseball & Softball Datamart Pitching Stats Query
-- 31/01/2024  Tony Pérez
-- 24/02/2024  Tony Pérez  Introduced European Leagues
-- 02/03/2024  Tony Pérez  season data to calculate stat leaders
-- 21/03/2024  Tony Pérez  Club/Stadium geo location (latitude/longitude)
-- 07/04/2024  Tony Pérez  Season/League Rankings
-- 29/08/2024  Tony Pérez  PostgreSQL version

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
,pitching_stat as
(
  select fps.*
         -- SABR metrics
        ,sum(fps.earned_runs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_earned_runs
        ,sum(fps.innings_pitched_dec)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_innings_pitched
        ,sum(fps.home_runs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_home_runs
        ,sum(fps.walks)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_walks
        ,sum(fps.hit_by_pitchs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_hit_by_pitchs
        ,sum(fps.strike_outs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.country_id
                              ,fps.season_year)  league_strike_outs
        ,sc.era_innings
    from fact_pitching_stat  fps
   inner join sport_category  sc
      on fps.sport_id = sc.sport_id
     and fps.gender_id = sc.gender_id
     and fps.category_id = sc.category_id
     and fps.country_id = sc.country_id

)
,stats_pitching as
(
  select fps.*
         -- SABR metrics
        ,(fps.era_innings * (fps.league_earned_runs / fps.league_innings_pitched))
         -
         (((13 * fps.league_home_runs)
          +(3 * (fps.league_walks + fps.league_hit_by_pitchs))
          -(2 *  fps.league_strike_outs)
          ) / fps.league_innings_pitched)  fip_constant
         --
     from pitching_stat  fps
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
       -- Pitching Ranks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.wins desc nulls last)  rank_wins
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.losses desc nulls last)  rank_losses
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.games desc nulls last)  rank_games
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.games_started desc nulls last)  rank_games_started
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.saves desc nulls last)  rank_saves
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.complete_games desc nulls last)  rank_complete_games
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.shutouts desc nulls last)  rank_shutouts
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.innings_pitched_dec desc nulls last)  rank_innings_pitched_dec
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
                    order by stat.runs desc nulls last)  rank_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.earned_runs desc nulls last)  rank_earned_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.walks desc nulls last)  rank_walks
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
                    order by stat.at_bats desc nulls last)  rank_at_bats
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.wild_pitches desc nulls last)  rank_wild_pitches
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
                    order by stat.balks desc nulls last)  rank_balks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.sacrifice_flies_against desc nulls last)  rank_sacrifice_flies_against
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.bunts_against desc nulls last)  rank_bunts_against
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.ground_outs desc nulls last)  rank_ground_outs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fly_outs desc nulls last)  rank_fly_outs
      ,dsg.number_of_games  season_number_of_games
      ,dsg.innings_pitched_percent  season_innings_pitched_percent
  from dim_player  dpl
  left outer join stats_pitching  stat
    on dpl.id  = stat.player_id
  left outer join dim_season_games  dsg
    on stat.sport_id = dsg.sport_id
   and stat.gender_id = dsg.gender_id
   and stat.category_id = dsg.category_id
   and stat.country_id = dsg.country_id
   and stat.season_year = dsg.season_year
 order by stat.sport_id, stat.gender_id, stat.category_id, stat.country_id, stat.season_year, 1
;
