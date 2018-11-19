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
JAVA_HOME:D:\Program Files (x86)\Java\jdk1.6.0_38
CLASSPATH:.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
Path:%JAVA_HOME%\bin
CATALINA_HOME:C:\apache-tomcat-6.0.36
{% endhighlight %}

### Configure MyEclipse
- Set UTF-8 code: [Window->Preferences->General->Workspace->Text file encoding] other UTF-8
- Add jdk: [Window->Preferences->Java->Installed JREs->Add->Standard VM] check the added item
- Import project: [File->Import->General->Existing projects into workspace] or [File->Import->SVN->Checked out from SVN]

### Reference 
- <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank"> jdk download </a> 
- <a href="http://tomcat.apache.org/" target="_blank"> apache tomcat </a> 
