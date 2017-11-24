--- 
layout: post 
title: "IIS installation and configuration" 
date: 2017-11-17 14:23:28 
author: Dewey Mao 
categories: IIS 
--- 

### 1 Enable <a href="https://www.iis.net/downloads/category/develop" target="_blank">IIS</a>
{% highlight batch linenos %}
Open control panel(in command prompt): control
program->peogram and function->open or close Windows function: checked [Internet Information Services]
Open computer management to check: compmgmt.msc
{% endhighlight %}

### 2 Install <a href="https://www.microsoft.com/net/download/windows" target="_blank">.Net Core SDK</a>
DotNetCore.2.0.3-WindowsHosting.exe

### 3 Create a Web site
AssetService: modify config.json
Error 405: module -> delete WebDAV