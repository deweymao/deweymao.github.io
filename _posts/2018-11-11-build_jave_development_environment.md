--- 
layout: post 
title: "Build Jave Development Environment" 
date: 2018-11-11 19:51:50 
author: Dewey Mao 
categories: Java 
--- 

### Install Java developmental tools
- install jdk
- install apache-tomcat
- install myeclipse

### Set environmental variable
{% highlight batch linenos %}
JAVA_HOME:		D:\Program Files (x86)\Java\jdk1.6.0_38
CLASSPATH:		.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
Path£º			%JAVA_HOME%\bin
CATALINA_HOME:		C:\apache-tomcat-6.0.36
{% endhighlight %}
 
### Reference 
- <a href="https://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank"> jdk download </a> 
- <a href="http://tomcat.apache.org/" target="_blank"> apache tomcat </a> 
