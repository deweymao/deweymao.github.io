---
layout: post
title:  "Kindle RSS for You: GAE + KindleEar"
date:   2017-05-11 06:00:00
author: Dewey Mao
categories: Solution
---

## What is <a href="https://github.com/cdhigh/kindleear" target="_blank">KindleEar</a>?
KindleEar is an open source program of Python, which is hosted on Github. KindleEar can run on Google APP Engine for free, and send the blogs subscribed to your kindle automatically.

## How to Build Kindle RSS Serve?
1. <a href="https://accounts.google.com/SignUp" target="_blank">Sign up for a Google account</a>
2. <a href="https://myaccount.google.com/security#connectedapps" target="_blank"> Google Sign in & security</a>: Allow less secure apps ON
3. <a href="https://console.developers.google.com/cloud-resource-manager?hl=zh-cn&pli=1" target="_blank"> Create a Google Cloud Project</a>: [http://AppID.appspot.com] To visit your KindleEar
4. <a href="https://console.cloud.google.com/home/dashboard" target="_blank"> Google Cloud Platform Shell to upload code</a>

{% highlight bash linenos %}
rm -f uploader.sh* && \
wget https://raw.githubusercontent.com/kindlefere/KindleEar-Uploader/master/uploader.sh && \
chmod +x uploader.sh && \
./uploader.sh
{% endhighlight %}

## Tips
1. Add your Gmail to your Amazon kindle approved senders mailing list
2. KindleEar default account: admin, default password: admin
3. wrong SRC_EMAIL: Google Cloud Platform >> App Engine >> Settings >> Add Email API authorized senders: your Gmail

## Try My Kindle RSS Serve
- <a href="https://deweymao-kindleear.appspot.com/" target="_blank"> Try My Kindle RSS Serve</a> test account: test，password: 123456
- <a href="https://kindlefere.com/post/19.html" target="_blank">Reference</a>
- <a href="https://github.com/getlantern/lantern" target="_blank"> Get Lantern </a> to access unlimited internet.

