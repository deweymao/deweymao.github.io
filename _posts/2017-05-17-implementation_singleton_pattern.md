---
layout: post
title:  "Simple Implementation of Singleton Pattern"
date:   2017-05-17 06:00:00
author: Dewey Mao
categories: C/C++
---
Singleton pattern: Create the only object in the class, and provide a interface to visit the object.

{% highlight c++ linenos %}
//singleton.h
class CSingleton{
public:
	static CSingleton& GetInstance();
	~CSingleton();
private:    
	CSingleton();    
	struct Impl;    
	std::unique_ptr<Impl> impl;
}
{% endhighlight %}

{% highlight c++ linenos %}
//singleton.cpp       
struct CSingleton::Impl{    
	int mem1;     
	Impl(){	mem1 = 0; };   
	~Impl(){}      
};   

CSingleton::CSingleton(): impl(new Impl()){}   

CSingleton::~CSingleton(){}   

CSingleton& CSingleton::GetInstance(){   
	static CSingleton st;   
	return st;   
}
{% endhighlight %}