/*
copyright (c) 2024, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

-- competions table
-- this table should be above country to allow international
-- competitions.
--
-- when       who          what
-- ---------- ------------ ----------------------------------------------------
-- 25/06/2024 Tony Perez   initial

create table c##baseball.dim_competition
  (	competition_id varchar2(20 byte)  -- PK
   ,competition varchar2(255 byte)
   ,creby  varchar2(32)  default user
   ,cre  date default sysdate
   ,luby  varchar2(32)
   ,lu  date
  )
;

create unique index dim_competition_pk
  on c##baseball.dim_competition (competition_id);
alter table c##baseball.dim_competition
  add constraint dim_competition_pk primary key (competition_id);

create or replace trigger c##baseball.tr_bi_dim_competition
before insert on c##baseball.dim_competition
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.creby := username;
  :new.cre := sysdate;
end tr_bi_dim_competition;
/

create or replace trigger c##baseball.tr_bu_dim_competition
before update on c##baseball.dim_competition
for each row
declare
  username varchar2(32);
begin
  select substr(user, 1, 32) into username from dual;
  :new.luby := username;
  :new.lu := sysdate;
end tr_bu_dim_competition;
/
