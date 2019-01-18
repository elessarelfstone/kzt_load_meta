-- drop before
drop table if exists data_source;

create schema if not exists sys
  authorization meta_worker;

create table data_source (
   data_source_id       SERIAL               not null,
   data_source_type_id  INT4                 not null,
   rdbms_type_id        INT4                 null,
   name                 VARCHAR(500)         not null,
   conn_detail          JSONB                not null,
   code                 VARCHAR(20)          not null,
   constraint PK_DATA_SOURCE primary key (data_source_id),
   constraint DATA_SRC_CODE unique (code)
);