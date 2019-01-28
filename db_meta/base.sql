create database meta;
create user meta_worker with encrypted password 'meta';
alter user meta_worker with superuser;
grant all privileges on database meta to meta_worker;


create schema if not exists meta
  authorization meta_worker;

-- drop before
drop table if exists meta.data_source;
drop table if exists meta.data_source_table;
drop table if exists meta.data_source_type;
drop table if exists meta.storage_type;


--источники данных
create table meta.data_source (
   data_source_id       SERIAL               not null,
   data_source_type_id  INT4                 not null,
   storage_type_id        INT4               not null,
   name                 VARCHAR(500)         not null,
   conn_detail          JSONB                not null,
   code                 VARCHAR(20)          not null,
   params               JSONB                not null,
   constraint PK_DATA_SOURCE primary key (data_source_id),
   constraint DATA_SRC_CODE unique (code)
);

-- таблицы типов источников данных
create table meta.data_source_table (
   data_source_table_id INT4               not null,
   data_source_type_id  INT4                 not null,
   name                 VARCHAR(100)         not null,
   description          TEXT                 null,
   sql_template         TEXT                 not null,
   is_active            BOOL                 not null,
   status               VARCHAR(10)          not null,
   params               JSONB                null,
   constraint PK_DATA_SOURCE_TABLE primary key (data_source_table_id)
);


--типы источников
create table meta.data_source_type (
   data_source_type_id  INT4               not null,
   name                 VARCHAR(500)         null,
   code                 VARCHAR(20)          null,
   params               JSONB                null,
   constraint PK_DATA_SOURCE_TYPE primary key (data_source_type_id),
   constraint DATA_SRC_TYPE_CODE unique (code)
);

--типы хранений
create table meta.storage_type (
   storage_type_id      INT4              not null,
   name                 VARCHAR(100)         null,
   code                 VARCHAR(20)          null,
   type_code            VARCHAR(20)          null,
   constraint PK_STORAGE_TYPE primary key (storage_type_id),
   constraint STORAGE_TYPE_CODE unique (code)
);

--связь: источник данных - тип источника данных
alter table meta.data_source
   add constraint FK_DATA_SRC_TYPE_DS foreign key (data_source_type_id)
      references meta.data_source_type (data_source_type_id);

--связь: источник данных - тип хранилища
alter table meta.data_source
   add constraint FK_DATA_SRC_STRG_TYPE foreign key (storage_type_id)
      references meta.storage_type (storage_type_id)
      on delete restrict on update restrict;

--связь: таблицы типа источника данных - тип источника данных
alter table meta.data_source_table
   add constraint FK_DATA_SRC_TYPE_DST foreign key (data_source_type_id)
      references meta.data_source_type (data_source_type_id)
      on delete restrict on update restrict;

-- функция для чтения с файловой системы sql скриптов
-- директория sql_templates должна находится в рабочей директории pg (/var/lib/pgsql/10/data/)
create function meta.get_text_document(p_filename character varying) returns text
  security definer
  language sql
as
$$
  SELECT CAST(pg_read_file(E'sql_templates/' || $1 ,0, 100000000) AS TEXT);
$$;

alter function meta.get_text_document(varchar) owner to meta_worker;




--\c meta