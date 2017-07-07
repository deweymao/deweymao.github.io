--- 
layout: post 
title: "Customize your own Trace" 
date: 2017-07-07 13:48:03 
author: Dewey Mao 
categories: C/C++ 
--- 

Trace implemnented by yourself will help you to debug your program. This is an example that uses OutputDebugString function. 
And <a href="https://debugview.en.softonic.com/" target="_blank">DebugView</a> will be the best choice to view the contents that Trace outputs.

{% highlight c++ linenos %}
//Trace.h
#pragma once

namespace CommonUtils {
	void Trace(const char* format, ...);
	void Trace(const wchar_t* format, ...);
	void ThreadTrace(const char* format, ...);
	void ThreadTrace(const wchar_t* format, ...);
}
{% endhighlight %}

{% highlight c++ linenos %}
//Trace.cpp
#include "stdafx.h"
#include <Windows.h>
#include "trace.h"

void CommonUtils::Trace(const char* format, ...) {
	char msg[1024];
	va_list args;
	va_start(args, format);
	vsnprintf_s(msg, _countof(msg), _TRUNCATE, format, args);
	va_end(args);
	OutputDebugStringA(msg);
}

void CommonUtils::Trace(const wchar_t* format, ...) {
	wchar_t msg[1024];
	va_list args;
	va_start(args, format);
	_vsnwprintf_s(msg, _countof(msg), _TRUNCATE, format, args);
	va_end(args);
	OutputDebugStringW(msg);
}

void CommonUtils::ThreadTrace(const char* format, ...) {
	char msg[1024];
	va_list args;
	va_start(args, format);
	vsnprintf_s(msg, _countof(msg), _TRUNCATE, format, args);
	va_end(args);
	CommonUtils::Trace("[%.4d] %s", GetCurrentThreadId(), msg);
}

void CommonUtils::ThreadTrace(const wchar_t* format, ...) {
	wchar_t msg[1024];
	va_list args;
	va_start(args, format);
	_vsnwprintf_s(msg, _countof(msg), _TRUNCATE, format, args);
	va_end(args);
	CommonUtils::Trace(L"[%.4d] %s", GetCurrentThreadId(), msg);
}

{% endhighlight %}
