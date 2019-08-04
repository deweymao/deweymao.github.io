--- 
layout: post 
title: "PostgreSQL 9.3 upgrade to 9.5" 
date: 2019-07-27 10:05:56 
author: Dewey Mao 
categories: PostgreSQL 
--- 
My database is
postgresql-9.3.14-1-windows.exe + postgis-bundle-pg93x32-setup-2.1.5-1.exe.
Now database backup failure due to insufficent memory, I want to upgrade to 
postgresql-9.5.4-1-windows-x64.exe + postgis-bundle-pg95x64-setup-2.2.2-2.exe.

### 1 install postgresql-9.5.4-1-windows-x64.exe + postgis-bundle-pg95x64-setup-2.2.2-2.exe
modify postgresql databse port : 5433 when installing.
rename 9.5/lib/postgis-2.2.dll as 9.5/lib/postgis-2.1.dll.
rename 9.5/lib/rtpostgis-2.2.dll as 9.5/lib/rtpostgis-2.1.dll.

### 2 create Windows USER: postgres
give USER postgres permission to modify 9.5/bin files.
logs will be written into here.

### 3 initdb by postgres
CMD: RUNAS USER: postgres "CMD.exe"
9.5/bin/: 
```
initdb -U postgres -D D:\pg95_data
```
modify postgresql.conf:
```
port = 5433
client_encoding = GBK
lc_messages = 'GBK'
```
regedit: 9.5-ImagePath: -D D:\pg95_data

### 4 stop 9.3 and 9.5 postgresql services

### 5 upgrade to 9.5
```
pg_upgrade -U postgres -b "C:\Program Files (x86)\PostgreSQL\9.3\bin" -B "C:\Program Files\PostgreSQL\9.5\bin" 
-d D:\postgresql_data -D D:\pg95_data -p 5432 -P 5433
```

### 6 failure 
```
pg_restore: [归档 (db)] PROCESSING TOC 时错误:
pg_restore: [归档 (db)] 错误来自 TOC 记录 702; 1255 86417 FUNCTION geomfromewkb("bytea") postgres
pg_restore: [归档 (db)] could not execute query: ERROR:  could not find function "LWGEOMFromWKB" in file "C:/Program Files/PostgreSQL/9.5/lib/postgis-2.1.dll"
    命令是: CREATE FUNCTION "geomfromewkb"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-2.1', '...
```
postgis 2.2 can not support all functions of postgis 2.1

### 7 temporary solution
```
@ECHO OFF
setlocal enabledelayedexpansion
set backup_folder=F:\BACKUP_DMMK
set file_name_one=%date:~0,4%-%date:~5,2%-%date:~8,2%-DMMKDB.dump
set file_name_two=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom.sql
set file_name_thr=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom_data

set host_name=localhost
set port_name=5432
set user_name=postgres
set db_name=DMMKDB

echo BACKUP DMMKDB
pg_dump --inserts -T "\"RDB_ShellGeom\"" -h !host_name! -p !port_name! -U !user_name! -Fc !db_name! > !backup_folder!\!file_name_one!
pg_dump -s -t "\"RDB_ShellGeom\"" -h !host_name! -p !port_name! -U !user_name! !db_name! > !backup_folder!\!file_name_two!
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "copy "\"RDB_ShellGeom\"" to '!backup_folder!\!file_name_thr!' Binary;"
echo BACKUP DMMKDB SUCCESS

pause
```

```
@ECHO OFF
setlocal enabledelayedexpansion
set backup_folder=F:\BACKUP_DMMK
set file_name_one=%date:~0,4%-%date:~5,2%-%date:~8,2%-DMMKDB.dump
set file_name_two=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom.sql
set file_name_thr=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom_data

set host_name=localhost
set port_name=5432
set user_name=postgres
set db_name=DMMKDB

echo DROPDB DMMKDBtest
dropdb -h !host_name! -p !port_name! -U !user_name! !db_name!
echo DROPDB DMMKDBtest SUCCESS
pause

echo CREATEDB DMMKDBtest
createdb -h !host_name! -p !port_name! -U !user_name! !db_name!
echo CREATEDB DMMKDBtest SUCCESS

echo CREATE EXTENSION
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "create extension "postgis";"
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "create extension ""uuid-ossp"";"
echo CREATE EXTENSION SUCCESS

echo RESTORE FROM DMMKDB
pg_restore -h !host_name! -p !port_name! -U !user_name! -d !db_name! !backup_folder!\!file_name_one!
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -f !backup_folder!\!file_name_two!
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "copy "\"RDB_ShellGeom\"" from '!backup_folder!\!file_name_thr!' Binary;"
echo RESTORE FROM DMMKDB SUCCESS

pause
```

 
### Reference 
- <a href="https://www.postgresql.org/docs/9.5/pgupgrade.html" target="_blank"> pg_upgrade </a> 
- <a href="http://www.bostongis.com/blog/index.php?/archives/268-Using-pg_upgrade-to-upgrade-PostGIS-without-installing-an-older-version-of-PostGIS.html" target="_blank"> postgis problem </a> 
