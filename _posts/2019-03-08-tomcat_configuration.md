--- 
layout: post 
title: "Tomcat Configuration" 
date: 2019-03-08  8:15:19 
author: Dewey Mao 
categories: Tomcat 
--- 
 
The Apache Tomcat software is an open source implementation of the Jave Servlet, JavaServer Pages, Java Expression Language and Java WebSocket 
technologies.

### Install Tomcat
- check bin/setclasspath.bat "set JAVA_HOME = " same with system environment variable JAVA_HOME.

### Deploy Web Application
- modify conf/server.xml
{% highlight batch linenos %}
<Host name="localhost" appBase="webapps" 
		unpackWARs="true" autoDeploy="true" 
		xmlValidation="false" xmlNamespaceAware="false">
	<Context path="/DEMO" docBase="D:\web_application\DEMO" debug="0" reloadable="false" />
</Host>
{% endhighlight %} 

### Deploy multiple Web applications in one Tomcat
- modify conf/server.xml
{% highlight batch linenos %} 
<Host name="localhost" appBase="webapps" 
		unpackWARs="true" autoDeploy="true" 
		xmlValidation="false" xmlNamespaceAware="false">
	<Context path="/DEMO" docBase="D:\web_application\DEMO" debug="0" reloadable="false" />
	<Context path="/DEMO1" docBase="D:\web_application\DEMO1" debug="0" reloadable="false" />
</Host>
{% endhighlight %} 
- Set different 'webAppRootKey' in Web.xml of every Web application
{% highlight batch linenos %} 
<!-- define webAppRootKey in web.xml -->
    <context-param>
    <param-name>webAppRootKey</param-name>
    <param-value>demo.root</param-value>
    </context-param>
{% endhighlight %} 

### Run multiple Tomcats in one machine
To modify all ports in server.xml of Tomcat 
 
### Reference 
- <a href="http://tomcat.apache.org/" target="_blank"> Apache Tomcat </a> 
