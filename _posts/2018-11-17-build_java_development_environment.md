--- 
layout: post 
title: "Build Java Development Environment" 
date: 2018-11-17 19:02:21 
author: Dewey Mao 
categories: Java 
--- 
 
### Install Java developmental tools
- install jdk
- install apache-tomcat
- install myeclipse
 
### Set environmental variable
{% highlight batch linenos %}
JAVA_HOME:D:\Java\jdk1.6.0_38
JRE_HOME:D:\Java\jdk1.6.0_38\jre
Path:%JAVA_HOME%\bin
check:java -version
{% endhighlight %}

### Configure Tomcat
- Keep D:\apache-tomcat-6.0.36\bin\setclasspath.bat "set JAVA_HOME=D:\Java\jdk1.6.0_38" same with JAVA_HOME.
- Modify port: D:\apache-tomcat-6.0.36\conf\server.xml
{% highlight batch linenos %}
<Connector port="8080" protocol="HTTP/1.1" connectionTimeout="20000" redirectPort="8443" URIEncoding="UTF-8"/>
{% endhighlight %}

### Configure MyEclipse
- Set UTF-8 code: [Window->Preferences->General->Workspace->Text file encoding] other UTF-8
- Add jdk: [Window->Preferences->Java->Installed JREs->Add->Standard VM] check the added item
- Import project: [File->Import->General->Existing projects into workspace] or [File->Import->SVN->Checked out from SVN]

### Reference 
- <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank"> jdk download </a> 
- <a href="http://tomcat.apache.org/" target="_blank"> apache tomcat </a> 
