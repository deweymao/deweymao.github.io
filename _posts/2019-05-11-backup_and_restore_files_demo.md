--- 
layout: post 
title: "Backup and Restore Files Demo" 
date: 2019-05-11 20:43:43 
author: Dewey Mao 
categories: Batch 
--- 
### Demo Backup Files
```
@ECHO OFF
setlocal enabledelayedexpansion
set backup_folder=F:\BACKUP_DMMKDB
set file_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-DMMKDB_backup
set host_name=192.168.0.101
set port_name=5432
set user_name=postgres
set db_name=DMMKDB
set folder_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-shared_attachment

echo BACKUP DMMKDB
pg_dump -h !host_name! -p !port_name! -U !user_name! !db_name! > !backup_folder!\!file_name!
echo BACKUP DMMKDB SUCCESS

echo BACKUP SHARED FOLDER
echo \test\ > !backup_folder!\list_of_exclusion.txt
echo \test1\ >> !backup_folder!\list_of_exclusion.txt
mkdir !backup_folder!\!folder_name!
xcopy \\!host_name!\shared_attachment !backup_folder!\!folder_name! /s /e /y /exclude:!backup_folder!\list_of_exclusion.txt
del !backup_folder!\list_of_exclusion.txt
echo BACKUP SHARED FOLDER SUCCESS

pause

```
### Demo Restore Files
```
@ECHO OFF
setlocal enabledelayedexpansion
set backup_folder=F:\BACKUP_DMMKDB
set file_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-DMMKDB_backup
set host_name=192.168.0.101
set port_name=5432
set user_name=postgres
set db_name=DMMKDBtest
set folder_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-shared_attachment

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
psql -h !host_name! -p !port_name! -U !user_name! !db_name! < !backup_folder!\!file_name!
echo RESTORE FROM DMMKDB SUCCESS

echo MODIFY TABLE RDB_AttachmentPathConfig
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "DELETE FROM ""RDB_AttachmentPathConfig"";"
psql -h !host_name! -p !port_name! -U !user_name! -d !db_name! -c "INSERT INTO ""RDB_AttachmentPathConfig"" (""AttachmentPath"", ""Note"") VALUES ('\\172.16.14.28\shared_attachment\test', 'shared folder');"
echo MODIFY TABLE RDB_AttachmentPathConfig SUCCESS

echo RESTORE SHARED FOLDER
rd /s /q \\!host_name!\shared_attachment\test 
mkdir \\!host_name!\shared_attachment\test
xcopy !backup_folder!\!folder_name! \\!host_name!\shared_attachment\test /s /e /y
echo RESTORE SHARED FOLDER SUCCESS

pause


```