--- 
layout: post 
title: "PostgresSQL installation and configuration" 
date: 2017-11-16 10:04:44 
author: Dewey Mao 
categories: PostgreSQL 
--- 

<a href="https://www.enterprisedb.com/edb-postgresql" target="_blank">PostgreSQL</a> is EDB's open source distribution of PostgreSQL, the high performance, reliable, flexible, and open source multi-model database platform.
### 1 Download PostgreSQL
You can get the installation package via clicking <a href="https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows" target="_blank">here</a>
### 2 Install PostgreSQL
- provide a password for the database superuser(postgres)
- select the port number the server should listen on, default port number: 5432
- select the locale to be used by the new database cluster: [Default locale]
- start/restart/stop PostgreSQL servece in a command prompt: pg_ctl -D ../data start/restart/stop
- log in PostgreSQL in a command prompt: psql -d postgres -h localhost -p 5432 -U postgres
- log out PostgreSQL in a command prompt: \q

### 3 Remote access configuration
