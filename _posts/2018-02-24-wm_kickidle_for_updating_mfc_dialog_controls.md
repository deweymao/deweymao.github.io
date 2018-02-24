--- 
layout: post 
title: "WM_KICKIDLE for Updating MFC Dialog Controls" 
date: 2018-02-24 11:09:18 
author: Dewey Mao 
categories: C/C++ 
--- 

For using ON_UPDATE_COMMAND_UI() macros to enable and disable buttons in a dialog box, I found the key: the undocumented MFC message WM_KICKIDLE.
Then, call CWnd::UpdateDialogControls() function to update the state of buttons through the ON_UPDATE_COMMAND_UI() callback mechanism.

### WM_KICKIDLE
To catch WM_KICKIDLE, add an ON_MESSAGE(WM_KICKIDLE, OnKickIdle) macro invocation to the message map of your dialog, and supply an OnKickIdle() member function. 
At some point, a WM_KICKIDLE message gets sent to that dialog and your OnKickIdle() member function gets called. 
Your function should return TRUE to signal the caller to emit another WM_KICKIDLE message, or FALSE to signal the caller to enter the idle state. 
In the latter case, no more WM_KICKIDLE messages will be sent until a new message arrives.

{% highlight c++ lineos %}
LRESULT CIdleDlg::OnKickIdle(WPARAM wParam, LPARAM lParam){
    UpdateDialogControls(this, TRUE);
    return FALSE;
}
{% endhighlight %}

### <a href="https://docs.microsoft.com/en-us/cpp/mfc/reference/cwnd-class#updatedialogcontrols" target="_blank"> CWnd::CWnd::UpdateDialogControls </a>
Call this member function to update the state of dialog buttons and other controls in a dialog box or window that uses the ON_UPDATE_COMMAND_UI callback mechanism.
Calling UpdateDialogControls(this, TRUE) enables and disables the buttons in the dialog, 
depending on the implementation of the corresponding ON_UPDATE_COMMAND_UI() handlers in the message map. 
The second parameter is set to TRUE to disable any buttons that do not have a corresponding ON_COMMAND() macro. 
Changing this parameter to FALSE is harmless; buttons without ON_COMMAND() handlers would be enabled instead of disabled.

### Example
{% highlight c++ lineos %}
// dialog.h
afx_msg LRESULT OnKickIdle(WPARAM wParam, LPARAM lParam);
afx_msg void OnUpdateButtonIdok(CCmdUI* pCmdUI);

// dialog.cpp
BEGIN_MESSAGE_MAP(CtestBCGControlBarDlg, CBCGPDialog)
	...
	ON_MESSAGE(WM_KICKIDLE, OnKickIdle)
	ON_UPDATE_COMMAND_UI(IDOK, OnUpdateButtonIdok)
END_MESSAGE_MAP()

LRESULT CtestBCGControlBarDlg::OnKickIdle(WPARAM wParam, LPARAM lParam) {
	CWnd::UpdateDialogControls(this, TRUE);
	return FALSE;
}

void CtestBCGControlBarDlg::OnUpdateButtonIdok(CCmdUI* pCmdUI) {
	GetDlgItem(IDOK)->EnableWindow(FALSE);
}

{% endhighlight %}

### Reference
- <a href="http://www.drdobbs.com/wmkickidle-for-updating-mfc-dialog-contr/184416462?pgno=1" target="_blank"> WM_KICKIDLE for Updating MFC Dialog Controls</a>
- <a href="https://docs.microsoft.com/en-us/cpp/mfc/reference/cwnd-class#updatedialogcontrols" target="_blank"> CWnd::CWnd::UpdateDialogControls </a>
