--- 
layout: post 
title: "PostgreSQL Scripts" 
date: 2019-03-19 12:49:40 
author: Dewey Mao 
categories: PostgreSQL 
--- 
{% highlight SQL lineons %}   
// create testdb    
createdb -h localhost -p 5432 -U postgres testdb    

// drop testdb    
dropdb -h localhost -p 5432 -U postgres testdb     

// backup testdb    
pg_dump -h localhost -p 5432 -U postgres testdb > testdb_backup    

// restore testdb [first create testdb]    
psql -h localhost -p 5432 -U postgres testdb < testdb_backup   

// [FIRST] access testdb    
psql -h localhost -p 5432 -U postgres -d testdb   

// display all dbs    
\l   

// get out of psql    
\q   

// modify password of user postgres    
\password   

// excute sql script file    
\i F:/clean.sql  

// query data from table sys_role    
SELECT * FROM sys_role;   

// insert a record into table RDB_AttachmentPathConfig     
INSERT INTO "RDB_AttachmentPathConfig" ("AttachmentPath", "Note") VALUES ('\\localhost\shared_attachment', '共享文件夹');    

// insert a record into table t_bc_business    
INSERT INTO t_bc_business (bizid, bizname, createdate) VALUES ('f0285dfea9a140c7bd0f9f84a70341b4', '示例流程20190', '2019-02-26 19:44:52.544');    

// modify  data type of field    
ALTER TABLE "RDB_MediumHole_SingleRowLine" ALTER COLUMN "RowNum" TYPE integer USING ("RowNum"::integer);   

// empty table zhr    
DELETE FROM zhr;   

// drop table zhr    
DROP TABLE zhr;   
{% endhighlight %}
### Reference
- <a href="https://www.postgresql.org/docs/manuals/" target="_blank"> PostgreSQL Documnetation </a>