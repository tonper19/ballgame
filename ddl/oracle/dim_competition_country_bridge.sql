/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- competion - country bridge table
-- this table allows many competitions and countries permutations
-- to be used to distinguish between national and international
-- competions
-- when       who          what
-- ---------- ------------ ----------------------------------------------------
-- 25/06/2024 Tony Perez   initial

create table c##baseball.dim_competition_country_bridge
  (	competition_id varchar2(20 byte)  -- club PK
   ,country_id varchar2(2 byte)  -- club PK
   ,creby  varchar2(32)  default user
   ,cre  date default sysdate
   ,luby  varchar2(32)
   ,lu  date
  )
;

create unique index dim_competition_country_bridge_pk
  on c##baseball.dim_competition_country_bridge (competition_id, country_id);
alter table c##baseball.dim_competition_country_bridge
  add constraint dim_competition_country_bridge_pk primary key (competition_id, country_id);
alter table c##baseball.dim_competition_country_bridge
  add constraint b_competition_id_fk foreign key (competition_id)
  references c##baseball.dim_competition (competition_id) enable;
alter table c##baseball.dim_competition_country_bridge
  add constraint b_country_id_fk foreign key (country_id)
  references c##baseball.dim_country (country_id) enable;

create or replace trigger c##baseball.tr_bi_compet_country_bridge
before insert on c##baseball.dim_competition_country_bridge
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.creby := username;
  :new.cre := sysdate;
end tr_bi_compet_country_bridge;
/

create or replace trigger c##baseball.tr_bu_compet_country_bridge
before update on c##baseball.dim_competition_country_bridge
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.luby := username;
  :new.lu := sysdate;
end tr_bu_compet_country_bridge;
/
