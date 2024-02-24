/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - monday-december-25-2023
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table dim_season
--------------------------------------------------------

  create table c##baseball.dim_season
   (	season_year number
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  ddl for index season_pk
--------------------------------------------------------

  create unique index c##baseball.season_pk on c##baseball.dim_season (season_year)
  pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
--------------------------------------------------------
--  constraints for table dim_season
--------------------------------------------------------

  alter table c##baseball.dim_season add constraint season_pk primary key (season_year)
  using index pctfree 10 initrans 2 maxtrans 255 compute statistics
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users  enable;
