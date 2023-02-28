--
--    Copyright 2006-2022 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       https://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

drop table FieldsOnly if exists;
drop table PKOnly if exists;
drop table PKFields if exists;
drop table PKBlobs if exists;
drop table PKFieldsBlobs if exists;
drop table FieldsBlobs if exists;
drop table "awful table" if exists;
drop table BlobsOnly if exists;
drop view NameView if exists;
drop table RegexRename if exists;
drop table mbgtest.AnotherAwfulTable if exists;
drop table mbgtest.Ids if exists;
drop table mbgtest.Translations if exists;
drop table CompoundKey if exists;
drop schema mbgtest if exists;
drop table EnumTest if exists;
drop table EnumOrdinalTest if exists;
drop table GeneratedAlwaysTest if exists;
drop table GeneratedAlwaysTestNoUpdates if exists;
drop table IgnoreManyColumns if exists;
drop sequence TestSequence if exists;
drop table suffix_rename if exists;

create sequence TestSequence as integer start with 1;

create table FieldsOnly (
  IntegerField int,
  DoubleField double,
  FloatField float
);

create table PKOnly (
  id int not null,
  seq_num int not null,
  primary key(id, seq_num)
);

create table PKFields (
  id1 int not null,
  id2 int not null,
  firstName varchar(20),
  lastName varchar(20),
  dateField date,
  timeField time,
  timestampField timestamp,
  decimal30Field decimal(3, 0),
  decimal60Field decimal(6, 0),
  decimal100Field decimal(10, 0),
  decimal155Field decimal(15, 5),
  "wierd$Field" int,
  "birth date" date,
  stringBoolean char(1),
  primary key (id2, id1)
);

create table PKBlobs (
  id int not null,
  blob1 longvarbinary,
  blob2 longvarbinary,
  characterlob clob(5k),
  primary key (id)
);

create table PKFieldsBlobs (
  id1 int not null,
  id2 int not null,
  firstName varchar(20),
  lastName varchar(20),
  blob1 longvarbinary,
  primary key (id1, id2)
);

create table FieldsBlobs (
  firstName varchar(20),
  lastName varchar(20),
  blob1 longvarbinary,
  blob2 longvarbinary,
  blob3 binary
);

create table "awful table" (
  "CuStOmEr iD" int generated by default as identity (start with 57) not null,
  "first name" varchar(30) default 'Mabel',
  first_name varchar(30),
  firstName varchar(30),
  "last name" varchar(30),
  E_MAIL varchar(30),
  "_id1" int,
  "$id2" int,
  "id5_" int,
  "id6$" int,
  "id7$$" int,
  EmailAddress varchar(30),
  "from" varchar(30),
  active bit,
  active1 boolean,
  active2 bit(22),
  class varchar(5),
  primary key("CuStOmEr iD")
);

-- this table should be ignored, nothing generated
create table BlobsOnly (
  blob1 longvarbinary,
  blob2 longvarbinary
);

create table RegexRename (
  CUST_ID integer not null,
  CUST_NAME varchar(30),
  CUST_ADDRESS varchar(30),
  ZIP_CODE char(5),
  primary key(CUST_ID)
);

create view NameView (id, name) as
  select CUST_ID, CUST_NAME from RegexRename;

create schema mbgtest;

create table mbgtest.AnotherAwfulTable (
  id int not null,
  "select" varchar(30),
  "insert" varchar(30),
  "update" varchar(30),
  "delete" varchar(30),
  primary key(id)
);

create table CompoundKey (
  id int not null,
  updateDate date not null,
  description varchar(30),
  primary key(id, updateDate)
);

create table EnumTest (
  id int not null,
  name varchar(20) not null,
  primary key(id)
);

create table EnumOrdinalTest (
  id int not null,
  name int not null,
  primary key(id)
);

create table GeneratedAlwaysTest (
  id int not null,
  name varchar(20) not null,
  id_plus1 int generated always as (id + 1),
  id_plus2 int generated always as (id + 2),
  blob1 longvarbinary,
  primary key(id)
);

-- this table should not have any update by primary key statements generated
create table GeneratedAlwaysTestNoUpdates (
  id int not null,
  id_plus1 int generated always as (id + 1),
  id_plus2 int generated always as (id + 2),
  primary key(id)
);

create table IgnoreManyColumns (
  col01 int not null,
  col02 int null,
  col03 int null,
  col04 int null,
  col05 int null,
  col06 int null,
  col07 int null,
  col08 int null,
  col09 int null,
  col10 int null,
  col11 int null,
  col12 int null,
  col13 int null,
  col14 int null,
  col15 int null,
  primary key(col01)
);

comment on table EnumTest is 'This is a comment for the EnumTest table';
comment on column EnumTest.name is 'This is a comment for the EnumTest.name column';

create table suffix_rename (
  ID integer not null,
  NAME varchar(30),
  ADDRESS varchar(30),
  ZIP_CODE char(5),
  primary key(ID)
);

create table mbgtest.Translations (
  id integer not null,
  translation varchar(30),
  primary key (id)
);

create table mbgtest.Ids (
  id integer not null,
  description varchar(30),
  primary key (id)
);
