with sport_category as
(
  select dsp.id  sport_id
        ,dsp.gender  gender_id
        ,dsp.name  sport_name
        ,dsp.wiki  sport_wiki
        ,dca.id  category_id
        ,dca.era_innings
        ,dca.name  category_name
    from c##baseball.dim_sport  dsp
   inner join c##baseball.dim_category  dca
      on dsp.id  = dca.sport_id
     and dsp.gender = dca.gender
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
                              ,fps.season_year)  league_earned_runs
        ,sum(fps.innings_pitched_dec)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.season_year)  league_innings_pitched
        ,sum(fps.home_runs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.season_year)  league_home_runs
        ,sum(fps.walks)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.season_year)  league_walks
        ,sum(fps.hit_by_pitchs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
                              ,fps.season_year)  league_hit_by_pitchs
        ,sum(fps.strike_outs)
                         over (partition by
                               fps.sport_id
                              ,fps.gender_id
                              ,fps.category_id
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
    from c##baseball.fact_pitching_stat  fps
   inner join sport_category  sc
      on fps.sport_id = sc.sport_id
     and fps.gender_id = sc.gender_id
     and fps.category_id = sc.category_id
   inner join c##baseball.dim_club  dcl
      on fps.club_id = dcl.id
)
,pitching_temp as
(
  select stat.*
         ,(stat.era_innings * (stat.league_earned_runs / stat.league_innings_pitched))
            -
            (((13 * stat.league_home_runs)
            +(3 * (stat.league_walks + stat.league_hit_by_pitchs))
            -(2 *  stat.league_strike_outs)
            ) / stat.league_innings_pitched)  fip_constant
    from pitching_stat  stat
)
select
--       dpl.last_name  player_last_name
--      ,dpl.first_name  player_first_name
--      ,initcap(dpl.last_name) || ', ' || initcap(dpl.first_name)  player_full_name
--       (
--         (
--          (13 * stat.home_runs) +
--          (3 * (stat.walks + stat.hit_by_pitchs)) -
--          (2 * stat.strike_outs)
--         )
--         / stat.innings_pitched_dec
--       )
--       +  stat.fip_constant
      -- (stat.era_innings * (stat.league_earned_runs / stat.league_innings_pitched))
      --   -
      --   (((13 * stat.league_home_runs)
      --    +(3 * (stat.league_walks + stat.league_hit_by_pitchs))
      --    -(2 *  stat.league_strike_outs)
      --    ) / stat.league_innings_pitched)
--       fip

-- aggregate fip

       (
         (
          (13 * sum(stat.home_runs)) +
          (3 * (sum(stat.walks) + sum(stat.hit_by_pitchs))) -
          (2 * sum(stat.strike_outs))
         )
         / sum(stat.innings_pitched_dec)
       )
       + max(fip_constant)
       fip
--      ,stat.*
  from c##baseball.dim_player  dpl
  left outer join pitching_temp  stat
    on dpl.id  = stat.player_id
 where stat.sport_id = 'BB'
   and stat.category_id = 'D1'
   and dpl.last_name = 'DESMEDT'
   and stat.season_year = 2023
 order by 1
;


-- 4.86 = MicroStrategy