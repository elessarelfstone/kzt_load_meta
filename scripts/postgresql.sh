#!/bin/bash

echo vagrant | su -
yum install mc -y
yum install net-tools -y
yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm -y
yum install postgresql10 -y
yum install postgresql10-server -y
/usr/pgsql-10/bin/postgresql-10-setup initdb
systemctl enable postgresql-10
systemctl start postgresql-10
adduser worker
echo pass | passwd worker --stdin
sed -i 's/^local/#local/' /var/lib/pgsql/10/data/pg_hba.conf
sed -i 's/^host/#host/' /var/lib/pgsql/10/data/pg_hba.conf
echo "local 	all		all		trust" >> /var/lib/pgsql/10/data/pg_hba.conf
echo "host 	all		all		192.168.100.1/16			md5" >> /var/lib/pgsql/10/data/pg_hba.conf
echo "listen_addresses = '*'" >> /var/lib/pgsql/10/data/postgresql.conf
sudo systemctl reload postgresql-10
sudo systemctl restart postgresql-10
psql -U postgres -d postgres -a -w -f /vagrant/db_meta/system.sql
psql -U meta_worker -d meta -a -w -f /vagrant/db/ddl_tables_1.sql