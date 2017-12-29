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

### API-4 <a href="https://docs.microsoft.com/en-us/cpp/mfc/reference/ccombobox-class#setitemdata" target="_blank">CComboBox::GetItemData/SetItemData</a>
Sets the 32-bit value associated with the specified item in a combo box.(also in a CListCtrl, Grid...)
{% highlight c++ linenos %}
int index=combobox.AddString("DisplayField");
combobox.SetItemData(index,databaseIndex);
int databaseIndex=combobox.GetItemData(index);
{% endhighlight%}

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
{% endhighlight%}