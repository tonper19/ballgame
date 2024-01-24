with sport_category as
(
  select dsp.id  sport_id
        ,dsp.gender  gender_id 
        ,dsp.name  sport_name
        ,dsp.wiki  sport_wiki
        ,dca.id  category_id
        ,dca.name  category_name
    from c##baseball.dim_sport  dsp
   inner join c##baseball.dim_category  dca
      on dsp.id  = dca.sport_id
     and dsp.gender = dca.gender
)
,batting_stat as
(
  select fbs.*
        ,dpl.last_name  bat_last_name
        ,dpl.first_name  bat_first_name
        ,dpl.position  bat_position
        ,dpl.bats  bat_bats
        ,dpl.throws  bat_throws
        ,dpl.yob  bat_yob
        ,dpl.uniform_number  bat_uniform_number
        ,dpl.license_number  bat_license_number
        ,dpl.license_type  bat_license_type
        ,dcl.name  bat_club_name
        ,dcl.address  bat_club_address
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
    from c##baseball.fact_batting_stat  fbs
   inner join c##baseball.dim_player  dpl
      on fbs.player_id = dpl.id
   inner join c##baseball.dim_club  dcl
      on fbs.club_id = dcl.id
)
,pitching_stat as
(
  select fps.*
         case
           when fps.sport_id = 'BB'  then 9
           when fps.sport_id in ('SBFP', 'SBSP')  the 7
           else null  -- I don't know how many innings to calculate ERA on BB5
         end  era_innings  
        ,dpl.last_name  pit_last_name
        ,dpl.first_name  pit_first_name
        ,dpl.position  pit_position
        ,dpl.bats  pit_bats
        ,dpl.throws  pit_throws
        ,dpl.yob  pit_yob
        ,dpl.uniform_number  pit_uniform_number
        ,dpl.license_number  pit_license_number
        ,dpl.license_type  pit_license_type
        ,dcl.name  pit_club_name
        ,dcl.address  pit_club_address
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
   inner join c##baseball.dim_player  dpl
      on fps.player_id = dpl.id
   inner join c##baseball.dim_club  dcl
      on fps.club_id = dcl.id
)
,fielding_stat as
(
  select ffs.*
        ,dpl.last_name  fld_last_name
        ,dpl.first_name  fld_first_name
        ,dpl.position  fld_position
        ,dpl.bats  fld_bats
        ,dpl.throws  fld_throws
        ,dpl.yob  fld_yob
        ,dpl.uniform_number  fld_uniform_number
        ,dpl.license_number  fld_license_number
        ,dpl.license_type  fld_license_type
        ,dcl.name  fld_club_name
        ,dcl.address  fld_club_address
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
    from c##baseball.fact_fielding_stat  ffs
   inner join c##baseball.dim_player  dpl
      on ffs.player_id = dpl.id
   inner join c##baseball.dim_club  dcl
      on ffs.club_id = dcl.id
)

select sc.*
      ,coalesce(bat_last_name,pit_last_name,fld_last_name)  player_last_name
      ,coalesce(bat_first_name,pit_first_name,fld_first_name)  player_first_name
      ,coalesce(bat_position,pit_position,fld_position)  player_position
      ,coalesce(bat_bats,pit_bats,fld_bats)  player_bats
      ,coalesce(bat_throws,pit_throws,fld_throws)  player_throws
      ,coalesce(fld_yob
      ,coalesce(fld_uniform_number
      ,coalesce(fld_license_number
      ,coalesce(fld_license_type
      ,coalesce(fld_club_name
      ,coalesce(fld_club_address
      ,coalesce(fld_club_city
      ,coalesce(fld_club_province
      ,coalesce(fld_club_country
      ,coalesce(fld_club_email
      ,coalesce(fld_club_webpage
      ,coalesce(fld_ballpark_id
      ,coalesce(fld_club_president
      ,coalesce(fld_club_secretary
      ,coalesce(fld_club_treasurer
      ,coalesce(fld_governance_person

  from sport_category sc
  left outer join batting_stat
  left outer join pitching_stat
  left outer join fielding_stat
