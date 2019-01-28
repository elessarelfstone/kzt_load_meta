-- типы источников данных
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (1,'Автоматизированная система расчетов БИТТл', 'asr', NULL);
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (2,'BiMEG', 'bmg', NULL);
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (3,'Siebel CRM', 'crm', NULL);

-- типы хранения
insert into meta.storage_type(storage_type_id, name, code, type_code)
    values (1,'Реалиционная база Oracle', 'oracle', 'rdbms');

-- источники
insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params)
    values (1, 1, 1, 'АСР БИТТл Караганда', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.189.214.8)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  karaasr.Karaganda) ) )"}', 'asr_kar', '{"rdt_id": "1", "server_id": "48"}');

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params)
    values (1, 1, 1, 'АСР БИТТл Караганда', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.189.214.8)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  karaasr.Karaganda) ) )"}', 'asr_kar', '{"rdt_id": "1", "server_id": "48"}');

-- таблицы
insert into meta.data_source_table(data_source_table_id, data_source_type_id, name, description, sql_template, is_active, status, params)
    values(1, 1, 'db.tdr', 'Таблица начислений АСР БИТТл', meta.get_text_document('asr_db.tdr.sql'), True, 'big',  '{}');

