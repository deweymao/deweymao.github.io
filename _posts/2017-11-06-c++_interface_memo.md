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
