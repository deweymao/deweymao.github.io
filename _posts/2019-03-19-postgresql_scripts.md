--- 
layout: post 
title: "PostgreSQL Scripts" 
date: 2019-03-19 12:49:40 
author: Dewey Mao 
categories: PostgreSQL 
--- 

{% highlight bash linenos %}
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

{% endhighlight %}

### Reference
- <a href="https://www.postgresql.org/docs/manuals/" target="_blank"> PostgreSQL Documnetation </a>