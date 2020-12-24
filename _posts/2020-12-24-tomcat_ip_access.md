--- 
layout: post 
title: "Tomcat IP Access" 
date: 2020-12-24 13:23:48 
author: Dewey Mao 
categories: Tomcat 
--- 
### Tomcat/conf/server.xml
- modify port 80   

```   
<Connector port="80" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" />
```   

- add host context   

```   
<Host name="localhost"  appBase="webapps" unpackWARs="true" autoDeploy="true">
	<!-- add -->
	<Context path="" docBase="/home/dimine/deploy/apache-tomcat-8.5.61/webapps/web" debug="0" reloadable="true"></Context>

</Host>   
```   

- open server port 80   

```   
firewall-cmd --query-port=80/tcp
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload
firewall-cmd --query-port=80/tcp
```   

- restart tomcat server   
