--- 
layout: post 
title: "Install PostgreSQL and Postgis in CentOS 7" 
date: 2020-12-18 15:33:11 
author: Dewey Mao 
categories: PostgreSQL 
--- 
### Install PostgreSQL
```
//find right version
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum list | grep postgresql

//install
yum -y install postgresql12-contrib.x86_64 postgresql12-server.x86_64

//configure DATA directory
mkdir -p /home/pgdata
systemctl edit postgresql-12.service
[Service]
Environment=PGDATA=/home/pgdata

//modify directory access right
chmod -R 777 /home/pgdata

//modify directory owner
chown -R postgres.postgres /home/pgdata

//reload configuration file of service
systemctl daemon-reload

//init db
/usr/pgsql-12/bin/postgresql-12-setup initdb

//start service
systemctl enable postgresql-12
systemctl start postgresql-12

// modify login password
ALTER USER postgres WITH PASSWORD 'password';

// exit psql
CTRL + d

// remote access to pg
vim pg_hba.conf
vim pg_hba.conf

//restart service
systemctl restart postgresql-12

//open port 5432
firewall-cmd --query-port=5432/tcp
firewall-cmd --add-port=5432/tcp --permanent
firewall-cmd --reload
firewall-cmd --query-port=5432/tcp
```
### Install Postgis
```
yum -y install epel-release
yum search postgis
yum -y install postgis30_12

```
