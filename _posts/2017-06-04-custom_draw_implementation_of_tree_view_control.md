---
layout: post
title:  "Custom draw: Implementation of tree-view control"
date:   2017-06-05 06:00:00
author: Dewey Mao
categories: C/C++
---

Custom draw is mot a common control; it is a service that many common controls provide. The custom draw service allows an application greater flexibility in customizing a control's appearance.
Your application can harness custom draw notification to easily change the font used to display items or manually draw an item without having to do a full owner draw.
The following is an example for tree-view control.

## Example
```
// .h
afx_msg void OnNMCustomdraw(NMHDR* pNMHDR, LRESULT* pResult);
```

```
// .cpp
ON_NOTIFY_REFLECT(NM_CUSTOMDRAW, &OnNMCustomdraw)

void OnNMCustomdraw(NMHDR* pNMHDR, LRESULT* pResult){
	LPNMTVCUSTOMDRAW pCustomDraw = (LPNMTVCUSTOMDRAW)pNMHDR;
	switch(pCustomDraw->nmcd.dwDrawStage)
	{
	case CDDS_PREPAINT:
		// Need to process this case and set pResult to CDRF_NOTIFYITEMDRAW,
		// otherwise parent will never receive CDDS_ITEMPREPAINT notification.
		*pResult = CDRF_NOTIFYITEMDRAW;
		return;
	case CDDS_ITEMPREPAINT:
		if(pCustomDraw->nmcd.uItemState & CDIS_SELECTED){
			// Change selected item text color and text backgroud color
			pCustomDraw->clrText = RGB(255,255,255);// White
			pCustomDraw->clrTextBk = RGB(0,0,255);// Blue
			*pResult = CDRF_NEWFONT;

			// Drawing the item yourself
			// CDC* pDc = CDC::FromHandle(pCustomDraw->nmcd.hdc);
			// *pResult = CDRF_SKIPDEFAULT;
		}
		break;
	default:
		break;
	}
}
```

## reference
- <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ff919569(v=vs.85).aspx" target="_blank">About Custom Draw</a>   
- <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ff919573(v=vs.85).aspx" target="_blank">Using Custom Draw</a>



