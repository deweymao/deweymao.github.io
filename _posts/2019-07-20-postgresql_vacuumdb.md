--- 
layout: post 
title: "PostgreSQL vacuumdb" 
date: 2019-07-20 20:44:23 
author: Dewey Mao 
categories: PostgreSQL 
---
``` 
vacuumdb --help
```
```
vacuumdb 清理并且优化一个 PostgreSQL 数据库.
使用方法:
  vacuumdb [选项]... [数据库名]
选项:
  -a, --all                       清理所有的数据库
  -d, --dbname=DBNAME             清理数据库 DBNAME
  -e, --echo                      显示发送到服务端的命令
  -f, --full                      完全清理
  -F, --freeze                    冻结记录的事务信息
  -q, --quiet                     不写任何信息
  -t, --table='TABLE[(COLUMNS)]'  只清理指定的表
  -v, --verbose                   写大量的输出
  -V, --version                   输出版本信息, 然后退出
  -z, --anaylze                   更新优化器的统计信息
  -z, --analyze-only               只更新优化器的统计信息
  -?, --help                      显示此帮助信息, 然后退出
联接选项:
  -h, --host=HOSTNAM        数据库服务器所在机器的主机名或套接字目录
  -p, --port=PORT           数据库服务器端口号
  -U, --username=USERNAME   联接的用户名
  -w, -no-password         永远不提示输入口令
  -W, --password            强制提示输入口令
  --maintenance-db=DBNAME   更改维护数据库
```
```
vacuumdb -h localhost -p 5432 -U postgres -d DMMKDB -f -z -v
```

