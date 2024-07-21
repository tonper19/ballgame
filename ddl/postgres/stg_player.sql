/*
copyright (c) 2023, antonio alberto pérez pérez
all rights reserved.

this source code is licensed under the bsd-style license found in the
license file in the root directory of this source tree.
*/

--------------------------------------------------------
--  file created - friday-july-19-2024
--------------------------------------------------------
--------------------------------------------------------
--  ddl for table stg_player
--------------------------------------------------------

  create table c##baseball.stg_player
   (	uniform_number number(*,0),
	player_name varchar2(255 byte),
	position varchar2(50 byte),
	bats char(1 byte),
	throws char(1 byte),
	ht number(*,0),
	wt number(*,0),
	yob number(*,0),
	team varchar2(3 byte)
   ) segment creation immediate
  pctfree 10 pctused 40 initrans 1 maxtrans 255
 nocompress logging
  storage(initial 65536 next 1048576 minextents 1 maxextents 2147483645
  pctincrease 0 freelists 1 freelist groups 1
  buffer_pool default flash_cache default cell_flash_cache default)
  tablespace users ;
