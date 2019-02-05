-- типы источников данных
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (1,'Автоматизированная система расчетов БИТТл', 'asr', NULL);
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (2,'BiMEG', 'bmg', NULL);
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (3,'Siebel CRM', 'crm', NULL);
insert into meta.data_source_type(data_source_type_id, name, code, params)
    values (4,'Siebel CRM 2', 'crm2', NULL);



-- типы хранения
insert into meta.storage_type(storage_type_id, name, code, type_code)
    values (1,'Реалиционная база Oracle', 'oracle', 'rdbms');

-- источники

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (1, 1, 1, 'АСР БИТТл Алматы', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.10.70.63)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  orcl1) ) )"}', 'asr_ala', '{"rdt_id": "6", "server_id": "90"}', True);

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (2, 1, 1, 'АСР БИТТл Кызылорда', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.8.29.11)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  kyzyasr) ) )"}', 'asr_kzl', '{"rdt_id": "5", "server_id": "105"}', True);

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (3, 1, 1, 'АСР БИТТл Шымкент', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.8.29.7)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = shymasr) ) )"}', 'asr_shm', '{"rdt_id": "5", "server_id": "106"}', True);

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (4, 1, 1, 'АСР БИТТл Тараз', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.8.29.9)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  taraasr) ) )"}', 'asr_tar', '{"rdt_id": "5", "server_id": "78"}', True);

insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (5, 1, 1, 'АСР БИТТл ОДТ Алматы', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.8.29.5)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  taldasr) ) )"}', 'asr_tal', '{"rdt_id": "6", "server_id": "75"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (6, 1, 1, 'АСР БИТТл ГТС Астана', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.72.1.50)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = orcl.Astanatelecom) ) )"}', 'asr_ast', '{"rdt_id": "1", "server_id": "73"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (7, 1, 1, 'АСР БИТТл Кокшетау', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =   10.71.200.6)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = koksasr.Akmola) ) )"}', 'asr_kok', '{"rdt_id": "1", "server_id": "71"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (8, 1, 1, 'АСР БИТТл Актау', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.71.200.16)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = aktaasr.Mangistau) ) )"}', 'asr_akt', '{"rdt_id": "3", "server_id": "66"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (9, 1, 1, 'АСР БИТТл Актобе', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.71.200.8)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  aktoasr.aktobe) ) )"}', 'asr_aktb', '{"rdt_id": "3", "server_id": "89"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (10, 1, 1, 'АСР БИТТл Атырау', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =   10.71.200.4)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = atyrasr.Atyrau) ) )"}', 'asr_atr', '{"rdt_id": "3", "server_id": "65"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (11, 1, 1, 'АСР БИТТл Уральск', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =   10.71.200.15)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = uralasr.weskaz) ) )"}', 'asr_ura', '{"rdt_id": "3", "server_id": "64"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (12, 1, 1, 'АСР БИТТл Караганда', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.189.214.8)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME =  karaasr.Karaganda) ) )"}', 'asr_kar', '{"rdt_id": "1", "server_id": "48"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (13, 1, 1, 'АСР БИТТл Костанай', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.189.214.4)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = kostasr.kustanai) ) )"}', 'asr_kos', '{"rdt_id": "4", "server_id": "69"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (14, 1, 1, 'АСР БИТТл Павлодар', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.189.214.12)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = pavlasr.Pavlodar) ) )"}', 'asr_pav', '{"rdt_id": "2", "server_id": "72"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (15, 1, 1, 'АСР БИТТл Петропавловск', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =   10.189.214.14)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = petrasr.NorthKaz) ) )"}', 'asr_pet', '{"rdt_id": "5", "server_id": "105"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (16, 1, 1, 'АСР БИТТл Семей', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =  10.189.214.16)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = semeasr.semey) ) )"}', 'asr_sem', '{"rdt_id": "2", "server_id": "114"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (17, 1, 1, 'АСР БИТТл Оскемен', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =   10.189.214.6)(PORT = 1521)) ) (CONNECT_DATA = (SERVICE_NAME = ustkasr) ) )"}', 'asr_osk', '{"rdt_id": "2", "server_id": "77"}', True);


insert into meta.data_source(data_source_id, data_source_type_id, storage_type_id, name, conn_detail, code, params, is_active)
    values (18, 2, 1, 'Bimeg', '{"tns": "(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 10.8.8.134)(PORT = 1521)) ) (CONNECT_DATA = (SID = megaline1) ) )"}', 'bmg_main', '{}', True);



-- таблицы
insert into meta.data_source_table(data_source_table_id, data_source_type_id, name, description, sql_template, is_active, status, params)
    values(1, 1, 'db.tdr', 'Таблица начислений АСР БИТТл', meta.get_text_document('asr_db.tdr.sql'), True, 'big',  '{}');

