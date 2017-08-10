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
	void TraceBytes(const unsigned char* buffer, unsigned long length, const char* prefix_format = nullptr, ...);
}
{% endhighlight %}

{% highlight c++ linenos %}
//Trace.cpp
#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
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

void CommonUtils::TraceBytes(const unsigned char* buffer, unsigned long length, const char* prefix_format /*= nullptr*/, ...) {
	char prefix[512];
	if (prefix_format != nullptr) {
		va_list args;
		va_start(args, prefix_format);
		vsnprintf_s(prefix, _countof(prefix), _TRUNCATE, prefix_format, args);
		va_end(args);
	}

	const int cols = 32;
	char hex[cols * 3 + 1];
	char* cur = hex;
	for (unsigned long i = 0; i < length; i++) {
		sprintf_s(cur, 4, "%.2X ", buffer[i]);
		if ((((i + 1) % cols) == 0) || ((i + 1) == length)) {
			if (prefix_format != nullptr) {
				Trace("%s %s\n", prefix, hex);
			} else {
				Trace("%s\n", hex);
			}
			cur = hex;
		} else {
			cur += 3;
		}
	}
}

{% endhighlight %}
