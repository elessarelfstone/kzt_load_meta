create database meta;
create user meta_worker with encrypted password 'meta';
alter user meta_worker with superuser;
grant all privileges on database meta to meta_worker;
\c meta