--- 
layout: post 
title: "C++ interface memo" 
date: 2017-11-06 16:02:18 
author: Dewey Mao 
categories: C/C++ 
--- 
In my development process, Although I have an impression on some C++ APIs, I can't write them correctly and quickly. So I write this memo for my poor memory.

### API-1 <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb762153(v=vs.85).aspx" target="_blank">ShellExecute</a>
To perform an operation on a specified file. For example:
{% highlight c++ linenos %}
// open a file
ShellExecute(NULL, "open", filePath, NULL, NULL, SW_SHOW);
{% endhighlight %}

### API-2 <a href="https://msdn.microsoft.com/zh-cn/library/ee404875.aspx" target="_blank">std::to_string</a> and <a href="https://msdn.microsoft.com/zh-cn/library/ee404765.aspx" target="_blank">std::to_wstring</a>
To convert a value to a string or a wide string.
{% highlight c++ linenos %}
std::string s = std::to_string(2);
{% endhighlight %}

### API-3 <a href="https://msdn.microsoft.com/en-us/library/ms725501(VS.85).aspx" target="_blank">WritePrivateProfileString</a> and <a href="https://msdn.microsoft.com/zh-cn/library/ms724353.aspx" target="_blank">GetPrivateProfileString</a>
To copy a string into the specified section of an initialization file.
To retrieve a string from the specified section in an initialization file.
for example:
{% highlight c++ linenos %}
int nValue = GetPrivateProfileInt("AppName","SectionName",nDefaultValue,filePath);
{% endhighlight %}