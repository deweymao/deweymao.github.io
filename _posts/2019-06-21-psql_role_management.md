--- 
layout: post 
title: "PSQL Role Management" 
date: 2019-06-21  8:20:30 
author: Dewey Mao 
categories: PostgreSQL 
--- 
```
1、创建视图
CREATE VIEW v_comms_test AS 
SELECT "MiningArea","Level","Stope","RockType","TFeGrade","Weight","Volume"
FROM "RDB_StopeReserve";

2、删除视图
DROP VIEW v_comms_test;

3、新建登录角色
CREATE USER u_comms WITH PASSWORD '123456';

4、限制角色连接数
ALTER USER u_comms connection limit 10;

5、查看角色权限
SELECT * FROM pg_roles WHERE rolname = 'u_comms';

6、授权访问schema
GRANT USAGE ON SCHEMA test_schema TO u_comms;

7、授权访问表
GRANT SELECT, INSERT, UPDATE ON t_test TO u_comms;
GRANT SELECT ON v_comms_test TO u_comms; 
```
