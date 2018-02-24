--- 
layout: post 
title: "Memo Regular Expressions" 
date: 2017-06-09 17:11:13 
author: Dewey Mao 
categories: Memo 
--- 
A regular expression, often called a pattern, is an expression used to specify a set of strings required for a particular purpose. 
I will collect some real useful regular expressions in this blog. 

{% highlight batch linenos %}
To find Chinese string in code: (".*[\u4E00-\u9FA5]+)|([\u4E00-\u9FA5]+.*")
To count lines of code in Microsoft Visual Studio: b*[^:b#/]+.*$
{% endhighlight %}