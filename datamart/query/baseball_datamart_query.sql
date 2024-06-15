/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- European Baseball & Softball Datamart Query
-- 31/01/2024  Tony Pérez
-- 24/02/2024  Tony Pérez  Introduced European Leagues
-- 02/03/2024  Tony Pérez  season data to calculate stat leaders
-- 21/03/2024  Tony Pérez  Club/Stadium geo location (latitude/longitude)
-- 07/04/2024  Tony Pérez  Season/League Rankings

with sport_category as
(
  select dsp.id  sport_id
        ,dsp.gender  gender_id
        ,dsp.name  sport_name
        ,dsp.wiki  sport_wiki
        ,dca.id  category_id
        ,dca.country_id  country_id
        ,dca.era_innings
        ,dca.name  category_name
        ,dco.country_name  federation_country_name
        ,dco.federation_id  federation_id
        ,dco.address  federation_address
        ,dco.postal_code  federation_postal_code
        ,dco.city  federation_city
        ,dco.province  federation_province_region
        ,dco.email  federation_email
        ,dco.webpage  federation_webpage
    from c##baseball.dim_sport  dsp
   inner join c##baseball.dim_category  dca
      on dsp.id  = dca.sport_id
     and dsp.gender = dca.gender
   inner join c##baseball.dim_country dco
      on dca.country_id = dco.country_id
)
,batting_stat as
(
  select fbs.*
        ,br.country_id  br_country_id  -- international competitions included

         -- SABR metric calculations
         -- League/Season OBS (used to calculate OPS+ in a MicroStrategy metric)
        ,( sum(fbs.hits) over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)
         + sum(fbs.base_on_balls)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)
         + sum(fbs.hit_by_pitchs)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
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
                              ,br.country_id
                              ,fbs.season_year)
         + sum(fbs.hit_by_pitchs)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)
         + sum(fbs.sacrfice_flies)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)

         )  league_obp_divisor
         -- League/Season SLG (used to calculate OPS+ in a MicroStrategy metric)
        ,sum(fbs.total_bases)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)  league_slg_dividend
        ,sum(fbs.at_bats)
                         over (partition by
                               fbs.sport_id
                              ,fbs.gender_id
                              ,fbs.category_id
                              ,br.country_id
                              ,fbs.season_year)  league_slg_divisor
        ,dcl.name  bat_club_name
        ,dcl.address  bat_club_address
        ,dcl.postal_code  bat_club_postal_code
        ,dcl.city  bat_club_city
        ,dcl.province  bat_club_province
        ,dcl.country  bat_club_country
        ,dcl.email  bat_club_email
        ,dcl.webpage  bat_club_webpage
        ,dcl.ballpark_id  bat_ballpark_id
        ,dcl.president  bat_club_president
        ,dcl.secretary  bat_club_secretary
        ,dcl.treasurer  bat_club_treasurer
        ,dcl.governance_person  bat_governance_person
        ,dcl.club_latitude  bat_club_latitude
        ,dcl.club_longitude  bat_club_longitude
        ,dcl.stadium_latitude  bat_stadium_latitude
        ,dcl.stadium_longitude  bat_stadium_longitude
        ,sc.federation_country_name  bat_federation_country_name
        ,sc.federation_id  bat_federation_id
        ,sc.federation_address  bat_federation_address
        ,sc.federation_postal_code  bat_federation_postal_code
        ,sc.federation_city  bat_federation_city
        ,sc.federation_province_region  bat_federation_province_region
        ,sc.federation_email  bat_federation_email
        ,sc.federation_webpage  bat_federation_webpage
    from c##baseball.fact_batting_stat  fbs
   inner join sport_category  sc
      on fbs.sport_id = sc.sport_id
     and fbs.gender_id = sc.gender_id
     and fbs.category_id = sc.category_id
   inner join c##baseball.dim_club  dcl
      on fbs.club_id = dcl.id
   inner join c##baseball.dim_club_country_bridge  br -- 20240615 International competitions: allow a club to belong to one country/region or more
      on fbs.club_id = br.club_id
     and sc.country_id = br.country_id
)
,pitching_stat as
(
  select fps.*
        ,br.country_id  br_country_id  -- international competitions included

         -- SABR metrics
        ,sum(fps.earned_runs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_earned_runs
        ,sum(fps.innings_pitched_dec)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_innings_pitched
        ,sum(fps.home_runs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_home_runs
        ,sum(fps.walks)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_walks
        ,sum(fps.hit_by_pitchs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_hit_by_pitchs
        ,sum(fps.strike_outs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,br.country_id
                              ,fps.season_year)  league_strike_outs
        ,sc.era_innings
        ,dcl.name  pit_club_name
        ,dcl.address  pit_club_address
        ,dcl.postal_code  pit_club_postal_code
        ,dcl.city  pit_club_city
        ,dcl.province  pit_club_province
        ,dcl.country  pit_club_country
        ,dcl.email  pit_club_email
        ,dcl.webpage  pit_club_webpage
        ,dcl.ballpark_id  pit_ballpark_id
        ,dcl.president  pit_club_president
        ,dcl.secretary  pit_club_secretary
        ,dcl.treasurer  pit_club_treasurer
        ,dcl.governance_person  pit_governance_person
        ,dcl.club_latitude  pit_club_latitude
        ,dcl.club_longitude  pit_club_longitude
        ,dcl.stadium_latitude  pit_stadium_latitude
        ,dcl.stadium_longitude  pit_stadium_longitude
        ,sc.federation_country_name  pit_federation_country_name
        ,sc.federation_id  pit_federation_id
        ,sc.federation_address  pit_federation_address
        ,sc.federation_postal_code  pit_federation_postal_code
        ,sc.federation_city  pit_federation_city
        ,sc.federation_province_region  pit_federation_province_region
        ,sc.federation_email  pit_federation_email
        ,sc.federation_webpage  pit_federation_webpage
    from c##baseball.fact_pitching_stat  fps
   inner join sport_category  sc
      on fps.sport_id = sc.sport_id
     and fps.gender_id = sc.gender_id
     and fps.category_id = sc.category_id
   inner join c##baseball.dim_club  dcl
      on fps.club_id = dcl.id
   inner join c##baseball.dim_club_country_bridge  br -- 20240615 International competitions: allow a club to belong to one country/region or more
      on fps.club_id = br.club_id
     and sc.country_id = br.country_id
)
,fielding_stat as
(
  select ffs.*
        ,br.country_id  br_country_id  -- international competitions included

        ,dcl.name  fld_club_name
        ,dcl.address  fld_club_address
        ,dcl.postal_code  fld_club_postal_code
        ,dcl.city  fld_club_city
        ,dcl.province  fld_club_province
        ,dcl.country  fld_club_country
        ,dcl.email  fld_club_email
        ,dcl.webpage  fld_club_webpage
        ,dcl.ballpark_id  fld_ballpark_id
        ,dcl.president  fld_club_president
        ,dcl.secretary  fld_club_secretary
        ,dcl.treasurer  fld_club_treasurer
        ,dcl.governance_person  fld_governance_person
        ,dcl.club_latitude  fld_club_latitude
        ,dcl.club_longitude  fld_club_longitude
        ,dcl.stadium_latitude  fld_stadium_latitude
        ,dcl.stadium_longitude  fld_stadium_longitude
        ,sc.federation_country_name  fld_federation_country_name
        ,sc.federation_id  fld_federation_id
        ,sc.federation_address  fld_federation_address
        ,sc.federation_postal_code  fld_federation_postal_code
        ,sc.federation_city  fld_federation_city
        ,sc.federation_province_region  fld_federation_province_region
        ,sc.federation_email  fld_federation_email
        ,sc.federation_webpage  fld_federation_webpage
    from c##baseball.fact_fielding_stat  ffs
   inner join sport_category  sc
      on ffs.sport_id = sc.sport_id
     and ffs.gender_id = sc.gender_id
     and ffs.category_id = sc.category_id
   inner join c##baseball.dim_club  dcl
      on ffs.club_id = dcl.id
   inner join c##baseball.dim_club_country_bridge  br -- 20240615 International competitions: allow a club to belong to one country/region or more
      on ffs.club_id = br.club_id
     and sc.country_id = br.country_id
)
,stats_bp as
(
  select coalesce(fbs.sport_id,fps.sport_id)  sport_id
        ,coalesce(fbs.gender_id,fps.gender_id)  gender_id
        ,coalesce(fbs.category_id,fps.category_id)  category_id
        ,coalesce(fbs.club_id,fps.club_id)  club_id
        ,coalesce(fbs.br_country_id,fps.br_country_id)  br_country_id  -- coming from the bridge
        ,coalesce(fbs.season_year,fps.season_year)  season_year
        ,coalesce(fbs.player_id,fps.player_id)  player_id
        ,coalesce(fbs.team_id,fps.team_id)  team_id
        ,fbs.at_bats  fbs_at_bats
        ,fbs.runs  fbs_runs
        ,fbs.hits  fbs_hits
        ,fbs.doubles  fbs_doubles
        ,fbs.triples  fbs_triples
        ,fbs.home_runs  fbs_home_runs
        ,fbs.rbi  fbs_rbi
        ,fbs.total_bases  fbs_total_bases
        ,fbs.base_on_balls  fbs_base_on_balls
        ,fbs.hit_by_pitchs  fbs_hit_by_pitchs
        ,fbs.strike_outs  fbs_strike_outs
        ,fbs.ground_into_doubleplays  fbs_ground_into_doubleplays
        ,fbs.sacrfice_flies  fbs_sacrfice_flies
        ,fbs.bunts  fbs_bunts
        ,fbs.stolen_bases  fbs_stolen_bases
        ,fbs.caught_stealing  fbs_caught_stealing
         -- SABR metrics
        ,round((fbs.league_obp_dividend / fbs.league_obp_divisor), 3) fbs_league_obp
        ,round((fbs.league_slg_dividend / fbs.league_slg_divisor), 3) fbs_league_slg
         --
        ,fps.wins  fps_wins
        ,fps.losses  fps_losses
        ,fps.games  fps_games
        ,fps.games_started  fps_games_started
        ,fps.saves  fps_saves
        ,fps.complete_games  fps_complete_games
        ,fps.shutouts  fps_shutouts
        ,fps.innings_pitched_label  fps_innings_pitched_label
        ,fps.innings_pitched_dec  fps_innings_pitched_dec
        ,fps.era_innings  fps_era_innings_calc
        ,fps.inning_outs_pitched  fps_inning_outs_pitched
        ,fps.hits  fps_hits
        ,fps.runs  fps_runs
        ,fps.earned_runs  fps_earned_runs
        ,fps.walks  fps_walks
        ,fps.strike_outs  fps_strike_outs
        ,fps.doubles  fps_doubles
        ,fps.triples  fps_triples
        ,fps.home_runs  fps_home_runs
        ,fps.at_bats  fps_at_bats
        ,fps.wild_pitches  fps_wild_pitches
        ,fps.hit_by_pitchs  fps_hit_by_pitchs
        ,fps.balks  fps_balks
        ,fps.sacrifice_flies_against  fps_sacrifice_flies_against
        ,fps.bunts_against  fps_bunts_against
        ,fps.ground_outs  fps_ground_outs
        ,fps.fly_outs  fps_fly_outs
         -- SABR metrics
        ,fps.league_earned_runs  fps_league_earned_runs
        ,fps.league_innings_pitched  fps_league_innings_pitched
        ,fps.league_home_runs  fps_league_home_runs
        ,fps.league_walks  fps_league_walks
        ,fps.league_hit_by_pitchs  fps_league_hit_by_pitchs
        ,fps.league_strike_outs  fps_league_strike_outs
        ,(fps.era_innings * (fps.league_earned_runs / fps.league_innings_pitched))
         -
         (((13 * fps.league_home_runs)
          +(3 * (fps.league_walks + fps.league_hit_by_pitchs))
          -(2 *  fps.league_strike_outs)
          ) / fps.league_innings_pitched)  fps_fip_constant
         --
        ,coalesce(bat_club_name,pit_club_name)  club_name
        ,coalesce(bat_club_address,pit_club_address)  club_address
        ,coalesce(bat_club_postal_code,pit_club_postal_code)  club_postal_code
        ,coalesce(bat_club_city,pit_club_city)  club_city
        ,coalesce(bat_club_province,pit_club_province)  club_province
        ,coalesce(bat_club_country,pit_club_country)  club_country
        ,coalesce(bat_club_email,pit_club_email)  club_email
        ,coalesce(bat_club_webpage,pit_club_webpage)  club_webpage
        ,coalesce(bat_ballpark_id,pit_ballpark_id)  ballpark_id
        ,coalesce(bat_club_president,pit_club_president)  club_president
        ,coalesce(bat_club_secretary,pit_club_secretary)  club_secretary
        ,coalesce(bat_club_treasurer,pit_club_treasurer)  club_treasurer
        ,coalesce(bat_governance_person,pit_governance_person)  club_governance_person
        ,coalesce(bat_club_latitude,pit_club_latitude)  club_latitude
        ,coalesce(bat_club_longitude,pit_club_longitude)  club_longitude
        ,coalesce(bat_stadium_latitude,pit_stadium_latitude)  stadium_latitude
        ,coalesce(bat_stadium_longitude,pit_stadium_longitude)  stadium_longitude
        ,coalesce(bat_federation_country_name, pit_federation_country_name) federation_country_name
        ,coalesce(bat_federation_id, pit_federation_id)  federation_id
        ,coalesce(bat_federation_address, pit_federation_address) federation_address
        ,coalesce(bat_federation_postal_code, pit_federation_postal_code)  federation_postal_code
        ,coalesce(bat_federation_city, pit_federation_city) federation_city
        ,coalesce(bat_federation_province_region, pit_federation_province_region)  federation_province_region
        ,coalesce(bat_federation_email, pit_federation_email)  federation_email
        ,coalesce(bat_federation_webpage, pit_federation_webpage)  federation_webpage
     from batting_stat  fbs
     full outer join pitching_stat  fps
       on fbs.sport_id = fps.sport_id
      and fbs.gender_id = fps.gender_id
      and fbs.category_id = fps.category_id
      and fbs.club_id = fps.club_id
      and fbs.br_country_id = fps.br_country_id
      and fbs.season_year = fps.season_year
      and fbs.player_id = fps.player_id
      and fbs.team_id = fps.team_id
)
,all_stats as
(
  select coalesce(sbp.sport_id,ffs.sport_id)  sport_id
        ,coalesce(sbp.gender_id,ffs.gender_id)  gender_id
        ,coalesce(sbp.category_id,ffs.category_id)  category_id
        ,coalesce(sbp.club_id,ffs.club_id)  club_id
        ,coalesce(sbp.br_country_id,ffs.br_country_id)  country_id  -- coming from the bridge/alias left with same name to avoid MicroStrategy mismatches
        ,coalesce(sbp.season_year,ffs.season_year)  season_year
        ,coalesce(sbp.player_id,ffs.player_id)  player_id
        ,coalesce(sbp.team_id,ffs.team_id)  team_id
        ,fbs_at_bats
        ,fbs_runs
        ,fbs_hits
        ,fbs_doubles
        ,fbs_triples
        ,fbs_home_runs
        ,fbs_rbi
        ,fbs_total_bases
        ,fbs_base_on_balls
        ,fbs_hit_by_pitchs
        ,fbs_strike_outs
        ,fbs_ground_into_doubleplays
        ,fbs_sacrfice_flies
        ,fbs_bunts
        ,fbs_stolen_bases
        ,fbs_caught_stealing
         -- SABR metrics
        ,fbs_league_obp
        ,fbs_league_slg
         --
        ,fps_wins
        ,fps_losses
        ,fps_games
        ,fps_games_started
        ,fps_saves
        ,fps_complete_games
        ,fps_shutouts
        ,fps_innings_pitched_label
        ,fps_innings_pitched_dec
        ,fps_era_innings_calc
        ,fps_inning_outs_pitched
        ,fps_hits
        ,fps_runs
        ,fps_earned_runs
        ,fps_walks
        ,fps_strike_outs
        ,fps_doubles
        ,fps_triples
        ,fps_home_runs
        ,fps_at_bats
        ,fps_wild_pitches
        ,fps_hit_by_pitchs
        ,fps_balks
        ,fps_sacrifice_flies_against
        ,fps_bunts_against
        ,fps_ground_outs
        ,fps_fly_outs
         -- SABR metrics
        ,fps_league_earned_runs
        ,fps_league_innings_pitched
        ,fps_league_home_runs
        ,fps_league_walks
        ,fps_league_hit_by_pitchs
        ,fps_league_strike_outs
        ,fps_fip_constant
         --
        ,ffs.games_played_at_position  ffs_games_played_at_position
        ,ffs.total_chances  ffs_total_chances
        ,ffs.total_successful_chances  ffs_total_successful_chances
        ,ffs.putouts  ffs_putouts
        ,ffs.assists  ffs_assists
        ,ffs.errors  ffs_errors
        ,ffs.doubleplays  ffs_doubleplays
        ,ffs.stolen_bases_against  ffs_stolen_bases_against
        ,ffs.players_caught_steeling  ffs_players_caught_steeling
        ,ffs.passed_balls  ffs_passed_balls
        ,ffs.catcher_interferences  ffs_catcher_interferences
        ,coalesce(club_name,fld_club_name)  club_name
        ,coalesce(club_address,fld_club_address)  club_address
        ,coalesce(club_postal_code,fld_club_postal_code)  club_postal_code
        ,coalesce(club_city,fld_club_city)  club_city
        ,coalesce(club_province,fld_club_province)  club_province
        ,coalesce(club_country,fld_club_country)  club_country
        ,coalesce(club_email,fld_club_email)  club_email
        ,coalesce(club_webpage,fld_club_webpage)  club_webpage
        ,coalesce(ballpark_id,fld_ballpark_id)  ballpark_id
        ,coalesce(club_president,fld_club_president)  club_president
        ,coalesce(club_secretary,fld_club_secretary)  club_secretary
        ,coalesce(club_treasurer,fld_club_treasurer)  club_treasurer
        ,coalesce(club_governance_person,fld_governance_person)  club_governance_person
        ,coalesce(club_latitude,fld_club_latitude)  club_latitude
        ,coalesce(club_longitude,fld_club_longitude)  club_longitude
        ,coalesce(stadium_latitude,fld_stadium_latitude)  stadium_latitude
        ,coalesce(stadium_longitude,fld_stadium_longitude)  stadium_longitude
        ,coalesce(federation_country_name, fld_federation_country_name) federation_country_name
        ,coalesce(federation_id, fld_federation_id)  federation_id
        ,coalesce(federation_address, fld_federation_address) federation_address
        ,coalesce(federation_postal_code, fld_federation_postal_code)  federation_postal_code
        ,coalesce(federation_city, fld_federation_city) federation_city
        ,coalesce(federation_province_region, fld_federation_province_region)  federation_province_region
        ,coalesce(federation_email, fld_federation_email)  federation_email
        ,coalesce(federation_webpage, fld_federation_webpage)  federation_webpage
     from stats_bp  sbp
     full outer join fielding_stat  ffs
       on sbp.sport_id = ffs.sport_id
      and sbp.gender_id = ffs.gender_id
      and sbp.category_id = ffs.category_id
      and sbp.club_id = ffs.club_id
      and sbp.br_country_id = ffs.br_country_id
      and sbp.season_year = ffs.season_year
      and sbp.player_id = ffs.player_id
      and sbp.team_id = ffs.team_id
)
select dpl.last_name  player_last_name
      ,dpl.first_name  player_first_name
      ,initcap(dpl.last_name) || ', ' || initcap(dpl.first_name)  player_full_name

      ,dpl.position  player_position
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
                    order by stat.fbs_at_bats desc nulls last)  fbs_rank_at_bats
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_runs desc nulls last)  fbs_rank_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_hits desc nulls last)  fbs_rank_hits
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_doubles desc nulls last)  fbs_rank_doubles
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_triples desc nulls last)  fbs_rank_triples
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_home_runs desc nulls last)  fbs_rank_home_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_rbi desc nulls last)  fbs_rank_rbi
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_total_bases desc nulls last)  fbs_rank_total_bases
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_base_on_balls desc nulls last)  fbs_rank_base_on_balls
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_hit_by_pitchs desc nulls last)  fbs_rank_hit_by_pitchs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_strike_outs desc nulls last)  fbs_rank_strike_outs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_ground_into_doubleplays desc nulls last)  fbs_rank_ground_into_doubleplays
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_sacrfice_flies desc nulls last)  fbs_rank_sacrfice_flies
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_bunts desc nulls last)  fbs_rank_bunts
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_stolen_bases desc nulls last)  fbs_rank_stolen_bases
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fbs_caught_stealing desc nulls last)  fbs_rank_caught_stealing

       -- Pitching Ranks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_wins desc nulls last)  fps_rank_wins
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_losses desc nulls last)  fps_rank_losses
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_games desc nulls last)  fps_rank_games
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_games_started desc nulls last)  fps_rank_games_started
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_saves desc nulls last)  fps_rank_saves
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_complete_games desc nulls last)  fps_rank_complete_games
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_shutouts desc nulls last)  fps_rank_shutouts
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_innings_pitched_dec desc nulls last)  fps_rank_innings_pitched_dec
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_hits desc nulls last)  fps_rank_hits
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_runs desc nulls last)  fps_rank_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_earned_runs desc nulls last)  fps_rank_earned_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_walks desc nulls last)  fps_rank_walks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_strike_outs desc nulls last)  fps_rank_strike_outs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_doubles desc nulls last)  fps_rank_doubles
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_triples desc nulls last)  fps_rank_triples
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_home_runs desc nulls last)  fps_rank_home_runs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_at_bats desc nulls last)  fps_rank_at_bats
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_wild_pitches desc nulls last)  fps_rank_wild_pitches
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_hit_by_pitchs desc nulls last)  fps_rank_hit_by_pitchs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_balks desc nulls last)  fps_rank_balks
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_sacrifice_flies_against desc nulls last)  fps_rank_sacrifice_flies_against
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_bunts_against desc nulls last)  fps_rank_bunts_against
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_ground_outs desc nulls last)  fps_rank_ground_outs
      ,rank() over (partition by stat.sport_id
                                ,stat.gender_id
                                ,stat.category_id
                                ,stat.country_id
                                ,stat.season_year
                    order by stat.fps_fly_outs desc nulls last)  fps_rank_fly_outs


      ,dsg.number_of_games  season_number_of_games
      ,dsg.pa_coefficient  season_pa_coefficient
      ,dsg.innings_pitched_percent  season_innings_pitched_percent
  from c##baseball.dim_player  dpl
  left outer join all_stats  stat
    on dpl.id  = stat.player_id
  left outer join c##baseball.dim_season_games  dsg
    on stat.sport_id = dsg.sport_id
   and stat.gender_id = dsg.gender_id
   and stat.category_id = dsg.category_id
   and stat.country_id = dsg.country_id
   and stat.season_year = dsg.season_year
 order by stat.sport_id, stat.gender_id, stat.category_id, stat.country_id, stat.season_year, 1
;
