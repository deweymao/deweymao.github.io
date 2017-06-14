--- 
layout: post 
title: "How to abort CProgressCtrl right now while running" 
date: 2017-06-14 15:27:28 
author: Dewey Mao 
categories: C/C++ 
--- 

While the CProgressCtrl is running, I want to abort it right now by clicking a button.
Using PeekMessage function can solve it perfectly. As follows: 

## Example
{% highlight c++ lineons %}
//testProgressCtrlDlg.h
public:
	afx_msg void OnBnClickedStart();
	afx_msg void OnBnClickedAbort();
	void ProcessMessages();

	CProgressCtrl m_wndProgress;
	bool m_bAbort;
	
{% endhighlight %}

{% highlight c++ lineons %}
//testProgressCtrlDlg.cpp
GIN_MESSAGE_MAP(CtestProgressCtrlDlg, CDialogEx)
	//...
	ON_BN_CLICKED(IDC_BUTTON1, &CtestProgressCtrlDlg::OnBnClickedStart)
	ON_BN_CLICKED(IDC_BUTTON2, &CtestProgressCtrlDlg::OnBnClickedAbort)
END_MESSAGE_MAP()

void CtestProgressCtrlDlg::OnBnClickedStart() {
	m_bAbort = false;
	m_wndProgress.SetRange32(0, 100);
	m_wndProgress.SetPos(0);
	for (int i = 0; i < 100; ++i) {
		Sleep(100);
		m_wndProgress.SetPos(i + 1);
		ProcessMessages();
		if (m_bAbort) {
			break;
		}
	}
}

void CtestProgressCtrlDlg::OnBnClickedAbort() {
	m_bAbort = true;
}

void CtestProgressCtrlDlg::ProcessMessages() {
	MSG msg;
	if (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) {
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}
}

{% endhighlight %}

To sum up, the difference of PeekMessage function and GetMessage function is that PeekMessage function will return right now whether messages exist in the message queue while 
GetMessage function will not return if there is no message in the message queue.

## Reference
- <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms644943(v=vs.85).aspx" target="_blank">PeekMessage function</a> 
- <a href="https://msdn.microsoft.com/en-us/library/ms644936(v=vs.85).aspx" target="_blank">GetMessage function</a> 