--- 
layout: post 
title: "Load plugins automatically" 
date: 2017-07-10 18:02:02 
author: Dewey Mao 
categories: C/C++ 
--- 
Sometimes, we need load libraries that are existing automatically without modifying any code of the program.

## Load Adaptors
{% highlight c++ linenos %}
//Adaptor.h
#pragma once;
#include <memory>
#include <iostream>

struct Adaptor {
public:
	Adaptor() {}
	virtual ~Adaptor() {}
	std::wstring type;
};
typedef std::shared_ptr<Adaptor>(GetAdaptorsFunc)();
{% endhighlight %}


{% highlight c++ linenos %}
//AdaptorManager.h
#pragma once;
#include <memory>

#pragma  comment(lib,"LoadAdaptors.lib")

struct AdaptorManager {
public:
	static AdaptorManager& GetInstance();
	size_t LoadAdaptors();

private:
	struct Impl;
	std::unique_ptr<Impl> impl;
	AdaptorManager();
};
{% endhighlight %}


{% highlight c++ linenos %}
//AdaptorManager.cpp
#include "stdafx.h"
#include "AdaptorManager.h"
#include "Adaptor.h"
#include <unordered_set>
#include <unordered_map>
#include <Shlwapi.h>

using namespace std;

static const char* GetAdaptorsFuncName = "GetAdaptors";

struct AdaptorManager::Impl {
	unordered_set<HMODULE> loadedLibs;
	unordered_map<wstring, shared_ptr<Adaptor>> adaptors;

	int LoadAdaptor(const wchar_t* path) {
		if (auto lib = LoadLibraryW(path)) {
			if (loadedLibs.find(lib) == loadedLibs.end()) {
				if (auto proc = (GetAdaptorsFunc*)GetProcAddress(lib, GetAdaptorsFuncName)) {
					if (auto adaptor = proc()) {
						wstring _type = adaptor->type;
						adaptors[_type] = adaptor;
					}
				}
				loadedLibs.emplace(lib);
				return 1;
			} else {
				FreeLibrary(lib);
				return -1;
			}
		} else { return 0; }
	}
};

AdaptorManager::AdaptorManager() : impl(new Impl()) {}

AdaptorManager& AdaptorManager::GetInstance() {
	static AdaptorManager manager;
	return manager;
}

size_t AdaptorManager::LoadAdaptors() {
	wchar_t path[MAX_PATH] = {};
	GetModuleFileNameW(NULL, path, _countof(path));
	PathRemoveFileSpecW(path);
	PathAppendW(path, L"Adaptor.*.dll");

	WIN32_FIND_DATA fd = {};
	HANDLE find = FindFirstFile(path, &fd);
	size_t count = 0;
	if (find != INVALID_HANDLE_VALUE) {
		do {
			PathRemoveFileSpecW(path);
			PathAppendW(path, fd.cFileName);
			auto res = impl->LoadAdaptor(path);
			if (res == 1) count++;
		} while (FindNextFile(find, &fd) != FALSE);
		FindClose(find);
	}
	return count;
}
{% endhighlight %}


## Generate an Adaptor.Demo.dll
{% highlight c++ linenos %}
//AdaptorDemo.cpp
#include "stdafx.h"
#include "../LoadAdaptors/Adaptor.h"

using namespace std;

__declspec(dllexport) std::shared_ptr<Adaptor> GetAdaptors() {
	struct DemoAdaptor : Adaptor {
		DemoAdaptor() {
			type = L"demo";
		}
	};
	return std::make_shared<DemoAdaptor>();
}
{% endhighlight %}


## Test entrance:
{% highlight c++ linenos %}
//testLoadAdaptors.cpp
#include "stdafx.h"
#include "LoadAdaptors/AdaptorManager.h"

int _tmain(int argc, _TCHAR* argv[])
{
	auto& manager = AdaptorManager::GetInstance();
	size_t count = manager.LoadAdaptors();
	printf("Adaptors count : %d\n", count);
	getchar();
	return 0;
}
{% endhighlight %}