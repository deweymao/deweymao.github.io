--- 
layout: post 
title: "Microsoft Excel" 
date: 2018-02-02 17:07:56 
author: Dewey Mao 
categories: Tool 
--- 

### Import Excel TypeLibs
{% highlight c++ lineos %}
#import "MSO.DLL" rename("RGB", "MsoRGB") rename("DocumnetProperties", "MsoDocumnetProperties")
#import "VBE6EXT.OLB"
#import "EXCEL11.TLB" rename("RGB", "ExcelRGB") rename("DialogBox", "ExcelDialogBox") rename("ReplaceText", "ExcelReplaceText") rename("CopyFile", "ExcelCopyFile") no_auto_exclude
{% endhighlight %}
After Compiled, Output files:
- excel11.tlh
- excel11.tli
- mso.tlh
- mso.tli
- vbe6ext.tlh
- vbe6ext.tli

### Example
{% highlight c++ lineos %}
// testExcel.h
#ifndef TESTTOOLS_TESTEXCEL_H_
#define TESTTOOLS_TESTEXCEL_H_

#include "excel\excelTypeLibs.h"

namespace TEST_EXCEL {
	struct com_t { 
		com_t() { CoInitializeEx(NULL, COINIT_APARTMENTTHREADED); }
		~com_t() { CoUninitialize(); }
	};
	struct wait_cursor_t { 
		HCURSOR cursor; 
		wait_cursor_t() { cursor = SetCursor(LoadCursor(NULL, IDC_WAIT)); } 
		~wait_cursor_t() { SetCursor(cursor); } 
	};
	bool ExportExcel();
}

#endif //TESTTOOLS_TESTEXCEL_H_

// testExcel.cpp
#include "stdafx.h"
#include "testExcel.h"
#include <iostream>

bool TEST_EXCEL::ExportExcel() {
	TEST_EXCEL::com_t com;
	TEST_EXCEL::wait_cursor_t wait;
	try {
		Excel::_ApplicationPtr excel;
		HRESULT hr = excel.CreateInstance(__uuidof(Excel::Application));
		if (FAILED(hr)) throw _com_error(hr);

		auto workbook = excel->Workbooks->Add();
		Excel::SheetsPtr sheets = workbook->GetWorksheets();
		Excel::_WorksheetPtr sheet = sheets->GetItem((short)1);
		sheet->Name = L"testExcelSheet1";
		Excel::RangePtr range = sheet->Cells;

		Excel::RangePtr titleRange = range->GetRange(range->GetItem(1, 1), range->GetItem(1, 4));
		titleRange->Merge();
		titleRange->PutItem(1, 1, L"testExcel");
		titleRange->HorizontalAlignment = Excel::XlHAlign::xlHAlignCenter;
		titleRange->BorderAround(Excel::XlLineStyle::xlContinuous, Excel::XlBorderWeight::xlThin, Excel::XlColorIndex::xlColorIndexNone);
	
		sheet->Columns->AutoFit();
		excel->PutDisplayAlerts(0, variant_t(false));
		workbook->SaveAs(L"G:\\testExcel.xlsx", vtMissing, vtMissing, vtMissing, vtMissing, vtMissing, Excel::XlSaveAsAccessMode::xlNoChange, Excel::XlSaveConflictResolution::xlLocalSessionChanges);
		workbook->Close(true);
		excel->Quit();

		//open excel
		ShellExecute(NULL, L"open", L"G://testExcel.xlsx", NULL, NULL, SW_SHOW);

	}catch (_com_error& err) {
		std::cout << "EXCEL error code:" << err.ErrorMessage() << std::endl;
		return false;
	}
	std::cout << "EXCEL succeeded!" << std::endl;
	return true;
}

{% endhighlight %}

### Reference
- <a href="https://github.com/deweymao/Tools" target="_blank"> Demo: Tools </a>