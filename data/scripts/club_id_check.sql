-- Check Team constraint error
-- when the Team ID has been changed in the official stats
-- the Club dimenstion is the one that leads (FK) and
-- the stats should change with the ID in the dimension.
-- 18/04/2024  Tony Pérez

-- Stage loading

with cl as
(
select id
  from dim_club
)
select *
  from stg_batting_stat
 where team not in
       (select * from cl)
 order by 8, 7, 4
;


select c.id
      ,c.name
      ,c.country_id
      ,b.*
  from stg_batting_stat  b
  left outer join dim_club  c
    on b.team = c.id
   and b.country_id = c.country_id
 order by 1, 2, 3, 4, 5, 6, 7
;


-- Fact loading

with player as
(
select upper(trim(last_name)) || ' ' || upper(trim(first_name)) last_first
      ,id
      ,last_name
      ,first_name
  from c##baseball.dim_player
)
select s.sport_id
      ,s.gender_id
      ,s.division  category_id
      ,s.team  club_id
      ,s.country_id
      ,s.season_year
      ,p.id  player_id
      ,s.ab  at_bats
      ,s.r  runs
      ,s.h  hits
      ,s.h2  doubles
      ,s.h3  triples
      ,s.hr  home_runs
      ,s.rbi
      ,s.tb  total_bases
      ,s.bb  base_on_balls
      ,s.hbp  hit_by_pitchs
      ,s.so  strike_outs
      ,s.gdp  ground_into_doubleplays
      ,s.sf  sacrfice_flies
      ,s.sh  bunts
      ,s.sb  stolen_bases
      ,s.cs  caught_stealing
  from c##baseball.stg_batting_stat  s
  left outer join player  p
    on upper(trim(s.last_name)) || ' ' || upper(trim(s.first_name)) = p.last_first
-- where s.team = 'RED'
;

select *
  from fact_batting_stat
;
