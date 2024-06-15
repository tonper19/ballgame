/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- club - country bridge table
-- this table allows many countries (or regions) for a club
-- allows a club to belong to more than one geographical place
-- (country) to be used in international competions
--
-- when       who          what
-- ---------- ------------ ----------------------------------------------------
-- 15/06/2024 Tony Perez   initial

create table c##baseball.dim_club_country_bridge
  (	club_id varchar2(20 byte)  -- club PK
   ,country_id varchar2(2 byte)  -- club PK
   ,country2_id varchar2(2 byte)  -- country PK
   ,creby  varchar2(32)  default user
   ,cre  date default sysdate
   ,luby  varchar2(32)
   ,lu  date
  )
;

create unique index dim_club_country_bridge_pk
  on c##baseball.dim_club_country_bridge (club_id, country_id);
alter table c##baseball.dim_club_country_bridge
  add constraint dim_club_country_bridge_pk_pk primary key (club_id, country_id);
alter table c##baseball.dim_club_country_bridge
  add constraint club_id_fk foreign key (club_id)
  references c##baseball.dim_club (id) enable;
alter table c##baseball.dim_club_country_bridge
  add constraint country_id_fk foreign key (country_id)
  references c##baseball.dim_country (country_id) enable;

create or replace trigger c##baseball.tr_bi_club_country_bridge
before insert on c##baseball.dim_club_country_bridge
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.creby := username;
  :new.cre := sysdate;
end tr_bi_club_country_bridge;
/

create or replace trigger c##baseball.tr_bu_club_country_bridge
before update on c##baseball.dim_club_country_bridge
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.luby := username;
  :new.lu := sysdate;
end tr_bu_club_country_bridge;
/
