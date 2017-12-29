--- 
layout: post 
title: "First show dialog Then load data" 
date: 2017-12-29 13:26:31 
author: Dewey Mao 
categories: C/C++ 
--- 

It is more user-friendly to show dialog first before loading data from remote database.

{% highlight c++ lineons %}
//demoDlg.h
...
Virtual BOOL OnInitDialog();
afx_msg void OnInitData();
void ProcessMessages();
void LoadData();
{% endhighlight %}

{% highlight c++ lineons %}
//demoDlg.cpp
...
const UINT WM_INIT_DATA = WM_APP + 1;
BEGIN_MESSAGE_MAP(...)
...
ON_MESSAGE_VOID(WM_INIT_DATA, OnInitData)
END_MESSAGE_MAP()
 BOOL OnInitDialog(){
	...
	PostMessage(WM_INIT_DATA);
	return TRUE;
 }

 void OnInitData(){
	ShowWindow(SW_SHOW);
	ProcessMessages();
	LoadData();
 }

 void ProcessMessage(){
	MSG msg;
	while(PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)){
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
 }

 void LoadData(){
	CWaitCursor wait;
	//load data from database
	//show data in dialog
	UpdateData(FALSE);
 }

{% endhighlight %}