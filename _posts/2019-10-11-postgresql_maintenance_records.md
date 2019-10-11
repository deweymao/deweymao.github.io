--- 
layout: post 
title: "PostgreSQL Maintenance Records" 
date: 2019-10-11 10:20:15 
author: Dewey Mao 
categories: PostgreSQL 
--- 
#### Rec-1 Unable to restart service after power down
Error message:
```
2019-10-05 16:41:36 HKT 致命错误:  数据库系统启动中
2019-10-05 16:41:37 HKT 致命错误:  数据库系统启动中
2019-10-05 16:42:28 HKT 日志:  数据库系统没有正确的关闭; 处于自动恢复状态中
2019-10-05 16:42:28 HKT 日志:  在 3/624CF0 位置有零长度的记录
2019-10-05 16:42:28 HKT 日志:  不需要 redo
2019-10-05 16:42:28 HKT 日志:  MultiXact member wraparound protections are now enabled
2019-10-05 16:42:28 HKT 日志:  数据库系统准备接受连接
2019-10-05 16:42:28 HKT 日志:  已启动autovacuum
```
Todo:
- delete data/postmaster.pid
- pg_resetxlog
- restart server

postmaster.pid:   
While the server is running, its PID is stored in the file postmaster.pid in the data directory. 
This is used to prevent multiple server instances from running in the same data directory and can also be used for shutting down the server.

pg_resetxlog:   
reset the write-ahead log and other control information of a PostgreSQL database cluster.
pg_resetxlog clears the write-ahead log (WAL) and optionally resets some other control information stored in the pg_control file. 
This function is sometimes needed if these files have become corrupted. 
It should be used only as a last resort, when the server will not start due to such corruption.
 
### Reference 
- <a href="https://www.postgresql.org/docs/current/server-start.html" target="_blank"> Start Server </a> 
- <a href="https://www.postgresql.org/docs/9.6/app-pgresetxlog.html" target="_blank"> pg_resetxlog </a> 

