--- 
layout: post 
title: "Clean up Folders and Files" 
date: 2020-04-15 10:56:14 
author: Dewey Mao 
categories: Batch 
--- 
```
@ECHO OFF
setlocal enabledelayedexpansion
set backup_folder=D:\backup_dmmk\mk-20200414
set current_year_month=%date:~0,4%-%date:~5,2%
REM 27=count(backup_folder)+1
REM 35=count(backup_folder)+9
REM set file_name_one=%date:~0,4%-%date:~5,2%-%date:~8,2%-DMMKDB.dump
REM set file_name_two=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom.sql
REM set file_name_thr=%date:~0,4%-%date:~5,2%-%date:~8,2%-RDB_ShellGeom_data
REM set folder_name=%date:~0,4%-%date:~5,2%-%date:~8,2%-shared_attachment

REM 遍历指定目录下的文件（不包括子文件夹下的文件）
for %%f in (%backup_folder%\*) do (
	set file_name=%%f
	echo !file_name!
	if "!file_name:~-4!" == "dump" (
		echo !file_name:~27,7!
		echo !current_year_month!
		pause
		if NOT "!file_name:~27,7!" == "!current_year_month!" (
			echo !file_name!
			echo !file_name:~35,2!
			if NOT "!file_name:~35,2!" == "15" (
				echo !file_name!
				del /q !file_name!
			)
		)
	)
	if "!file_name:~-4!" == ".sql" (
		echo !file_name:~27,7!
		echo !current_year_month!
		pause
		if NOT "!file_name:~27,7!" == "!current_year_month!" (
			echo !file_name!
			echo !file_name:~35,2!
			if NOT "!file_name:~35,2!" == "15" (
				echo !file_name!
				del /q !file_name!
			)
		)
	)
	if "!file_name:~-4!" == "data" (
		echo !file_name:~27,7!
		echo !current_year_month!
		pause
		if NOT "!file_name:~27,7!" == "!current_year_month!" (
			echo !file_name!
			echo !file_name:~35,2!
			if NOT "!file_name:~35,2!" == "15" (
				echo !file_name!
				del /q !file_name!
			)
		)
	)
	pause
)
pause

REM 遍历指定目录下的文件夹（不包括子文件夹）
for /d %%d in (%backup_folder%\*) do (
	set dir_name=%%d
	echo !dir_name!
	echo !dir_name:~-17!
	if "!dir_name:~-17!" == "shared_attachment" (
		echo !dir_name:~27,7!
		echo !current_year_month!
		pause
		if NOT "!dir_name:~27,7!" == "!current_year_month!" (
			echo !dir_name!
			echo !dir_name:~35,2!
			if NOT "!dir_name:~35,2!" == "15" (
				echo !dir_name!
				rd /s /q  !dir_name!
			)
		)
	)	
	pause
)
```
