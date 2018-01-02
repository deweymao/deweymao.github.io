--- 
layout: post 
title: "Convertion between CImage and BYTE" 
date: 2017-11-29 17:01:03 
author: Dewey Mao 
categories: C/C++ 
--- 

We can get the BYTEs of the <a href="https://msdn.microsoft.com/en-us/library/bwea7by5.aspx" target="_blank">CImage</a> object by Image2Bytes API, and get the CImage object from the BYTEs by Bytes2Image API.

{% highlight c++ linenos %}
 bool Image2Bytes(const CImage& img, BYTE** bytes, size_t& byteSize){
	if(img.isNull()) return false;
	IStream* pStrImg = NULL;
	if(CreateStreamOnHGlobal(NULL, TRUE, &pStrImg) != S_OK) return false;
	img.Save(pStrImg, Gdiplus::ImageFormatBMP);
	HGLOBAL hGlobalImg = NULL;
	GetHGlobalFromStream(pStrImg, &hGlobalImg);
	BYTE* pBits = (BYTE*)GlobalLock(hGlobalImg);
	byteSize = GlobalSize(pBits);
	*bytes = new BYTE[byteSize];
	memcpy(*bytes, pBits, byteSize);
	GlobalUnlock(hGlobalImg);
	PstrImg->Release();
	GlobalFree(hGloabalImg);
	return true;
}
 
bool Bytes2Image(const BYTE* bytes, const size_t byteSize, CImage& img){
	if(bytes == NULL) return false;
	HGLOBAL hGlobalImg = GlobalAlloc(GMEM_MOVEABLE, byteSize);
	BYTE* pBits = (BYTE*)GlobalLock(hGlobalImg);
	memcpy(pBits, bytes, byteSize);
	GlobalUnlock(hGlobalImg);
	IStream* pStrImg = NULL;
	if(CreateStreamOnHGlobal(hGlobalImg, TRUE, &pStrImg) != S_OK){
		GlobalFree(hGloabalImg);
		return false;
	}
	if(!img.isNull()) img.Destroy();
	img.Load(pStrImg);
	pStrImg->Release();
	GlobalFree(hGloabalImg);
	return true;
}
{% endhighlight %} 