--- 
layout: post 
title: "Memo C++ Interfaces" 
date: 2017-11-06 16:02:18 
author: Dewey Mao 
categories: Memo 
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

### API-4 <a href="https://docs.microsoft.com/en-us/cpp/mfc/reference/ccombobox-class#setitemdata" target="_blank">CComboBox::GetItemData/SetItemData</a>
Sets the 32-bit value associated with the specified item in a combo box.(also in a CListCtrl, Grid...)
{% highlight c++ linenos %}
int index=combobox.AddString("DisplayField");
combobox.SetItemData(index,databaseIndex);
int databaseIndex=combobox.GetItemData(index);
{% endhighlight %}

### API-5 <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/bb759844(v=vs.85).aspx" target="_blank">Shell Lightweight Utility Functions</a>
This section describes the Windows Shell lightweight utility functions. The programming elements explained in this documentation are exported by Shlwapi.dll and defined in Shlwapi.h and Shlwapi.lib.
- String Functions
- Path Functions
- Registry Functions
- Color Palette Functions
- Miscellaneous
{% highlight c++ linenos %}
wchar_t path[_MAX_PATH];
GetModuleFileNameW(NULL, path, _MAX_PATH);
PathRenameExtensionW(path, L".ini");
{% endhighlight %}

### API-6 <a href="https://docs.microsoft.com/en-us/cpp/cpp/variant-t-class" target="_blank"> _variant_t </a>
{% highlight c++ lineos %}
_variant_t val;
if(val.vt != VT_EMPTY){
	try{
	val.ChargeType(VT_BSTR);
	}catch(_com_error e){};
	char* cs = _com_util::ConvertBSTRToString(val.bstrVal);
	delete[] cs;
}
{% endhighlight %}
TRY can improve stability of the program, for example:
- double(1.23) -> string(1.23) yes
- string(1.23) -> double(1.23) yes
- string(abcd) -> double(????) error 

### API-7 <a href="https://docs.microsoft.com/en-us/cpp/standard-library/algorithm-functions#unique" target="_blank"> std::unique </a>
Removes duplicate elements that are adjacent to each other in a specified range.
{% highlight c++ lineos %}
std::vector v;
std::sort(v.begin(), v.end());
v.erase(std::unique(v.begin(), v.end()), v.end());
{% endhighlight %}

### API-8 struct
Use struct only when there is data, and all others use class.

### API-9 explicit constructors
use explicit for single argument constructors
{% highlight c++ lineos %}
class Demo{
	explicit Demo(int n);
	...
}
Demo d(1);
Demo d1 = 1;//error: Implicit conversion is not allowed
{% endhighlight %}

### API-10 copy constructors
Use copy constructors only when you need to copy a object.
{% highlight c++ lineos %}
#define DISALLOW_COPY_AND_ASSIGN(TypeName)\
TypeName(const TypeName&);\
void operator = (const TypeName&)

class Demo{
	...
private:
	DISALLOW_COPY_AND_ASSIGN(Demo);//defined in private
}
{% endhighlight %}

### API-11 TODO comments
Use TODO to comment the code that is NOT perfect, Temporary and to be done in the future.

### API-12 Multiple inclusion
#define: C++ standard support
#pragma once: Compiler support
{% highlight c++ lineos %}
#ifndef PROJECT_FILE_H_
#define PROJECT_FILE_H_
...
#endif //PROJECT_FILE_H_
{% endhighlight %}

### API-13 <a href="https://docs.microsoft.com/en-us/windows/win32/api/shlwapi/nf-shlwapi-urlescapea" target="_blank"> UrlEscapeA </a>
Converts characters or surrogate pairs in a URL that might be altered during transport across the Internet ("unsafe" characters) into their corresponding escape sequences. 
