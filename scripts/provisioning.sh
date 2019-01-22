#!/bin/bash

echo vagrant | su -

# oracle client installation
cd /vagrant/install
yum localinstall oracle* --nogpgcheck -y
echo "export ORACLE_HOME=/usr/lib/oracle/12.2/client64" >> /home/vagrant/.bash_profile
echo "export PATH=$ORACLE_HOME/bin:$PATH" >> /home/vagrant/.bash_profile
echo "export LD_LIBRARY_PATH=$ORACLE_HOME/lib" >> /home/vagrant/.bash_profile
echo "export TNS_ADMIN=$ORACLE_HOME/network/admin" >> /home/vagrant/.bash_profile
echo "export NLS_LANG=AMERICAN_AMERICA.AL32UTF8" >> /home/vagrant/.bash_profile
source /home/vagrant/.bash_profile

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

ln -s /vagrant/db_meta/sql_templates  /var/lib/pgsql/10/data/sql_templates

# creating tables and functions, filling them
psql -U postgres -d postgres -a -w -f /vagrant/db_meta/system.sql
psql -U meta_worker -d meta -a -w -f /vagrant/db_meta/ddl_tables_1.sql
psql -U meta_worker -d meta -a -w -f /vagrant/db_meta/dml_tables_1.sql


# python
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum update
yum install -y python36u python36u-libs python36u-devel python36u-pip
python3.6 -V

# project
yum install git -y
cd /home/vagrant
git clone https://github.com/elessarelfstone/oradump.git
pip3.6 install -r oradump/requirements.txt
