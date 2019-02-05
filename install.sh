#!/bin/bash

echo vagrant | su -

# postgresql installation

yum install mc -y
yum install net-tools -y
yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm -y
yum install postgresql10 -y
yum install postgresql10-server -y

# postgresql preparation
/usr/pgsql-10/bin/postgresql-10-setup initdb
systemctl enable postgresql-10
systemctl start postgresql-10
adduser meta_worker
echo meta | passwd meta_worker --stdin
sed -i 's/^local/#local/' /var/lib/pgsql/10/data/pg_hba.conf
sed -i 's/^host/#host/' /var/lib/pgsql/10/data/pg_hba.conf
echo "local 	all		all		trust" >> /var/lib/pgsql/10/data/pg_hba.conf
echo "host 	all		all		192.168.100.1/16			md5" >> /var/lib/pgsql/10/data/pg_hba.conf
echo "listen_addresses = '*'" >> /var/lib/pgsql/10/data/postgresql.conf
sudo systemctl reload postgresql-10
sudo systemctl restart postgresql-10

# link to sync directories with sql-templates
ln -s /vagrant/db_meta/sql_templates  /var/lib/pgsql/10/data/sql_templates

# creating tables and functions, filling them
psql -U postgres -d postgres -a -w -f /vagrant/db_meta/base.sql
psql -U meta_worker -d meta -a -w -f /vagrant/db_meta/fill.sql