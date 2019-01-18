-- drop before
drop table if exists meta.data_source;
drop table if exists meta.data_source_table;
drop table if exists meta.data_source_type;
drop table if exists meta.storage_type;

create schema if not exists meta
  authorization meta_worker;

--источники данных
create table meta.data_source (
   data_source_id       SERIAL               not null,
   data_source_type_id  INT4                 not null,
   rdbms_type_id        INT4                 null,
   name                 VARCHAR(500)         not null,
   conn_detail          JSONB                not null,
   code                 VARCHAR(20)          not null,
   constraint PK_DATA_SOURCE primary key (data_source_id),
   constraint DATA_SRC_CODE unique (code)
);

-- таблицы типов источников данных
create table meta.data_source_table (
   data_source_table_id SERIAL               not null,
   data_source_type_id  INT4                 not null,
   name                 VARCHAR(100)         not null,
   description          TEXT                 null,
   sql_template         VARCHAR(100)         not null,
   is_active            BOOL                 not null,
   status               VARCHAR(10)          not null,
   params               JSONB                null,
   constraint PK_DATA_SOURCE_TABLE primary key (data_source_table_id)
);


--типы источников
create table meta.data_source_type (
   data_source_type_id  SERIAL               not null,
   name                 VARCHAR(500)         null,
   code                 VARCHAR(20)          null,
   params               JSONB                null,
   constraint PK_DATA_SOURCE_TYPE primary key (data_source_type_id),
   constraint DATA_SRC_TYPE_CODE unique (code)
);

--типы хранений
create table meta.storage_type (
   storage_type_id      SERIAL               not null,
   name                 VARCHAR(100)         null,
   code                 VARCHAR(20)          null,
   manufacture_code     VARCHAR(50)          null,
   constraint PK_STORAGE_TYPE primary key (storage_type_id),
   constraint STORAGE_TYPE_CODE unique (code)
);

--связь источник данных - тип источника данных
alter table data_source
   add constraint FK_DATA_SRC_TYPE_DS foreign key (data_source_type_id)
      references data_source_type (data_source_type_id);

--связь источник данных - тип хранилища
alter table data_source
   add constraint FK_DATA_SRC_STRG_TYPE foreign key (rdbms_type_id)
      references storage_type (storage_type_id)
      on delete restrict on update restrict;

--связь таблицы типа источника данных - тип источника данных
alter table data_source_table
   add constraint FK_DATA_SRC_TYPE_DST foreign key (data_source_type_id)
      references data_source_type (data_source_type_id)
      on delete restrict on update restrict;