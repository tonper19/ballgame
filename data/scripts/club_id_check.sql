-- Check Team constraint error
-- when the Team ID has been changed in the official stats
-- the Club dimenstion is the one that leads (FK) and
-- the stats should change with the ID in the dimension.
-- 18/04/2024  Tony Pérez

with cl as
(
select id
  from dim_club
)
select *
  from stg_pitching_stat
 where team not in
       (select * from cl)
;

