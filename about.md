---
layout: page
title: About
permalink: /about/
---
### Nice to Have You Here!
{% if site.github_username %}
<p>{% include icon-github.html username=site.github_username %}</p>
{% endif %}
{% if site.email %}
<p><a href="mailto:{{ site.email }}">{{ site.email }}</a></p>
{% endif %}
<p class="rss-subscribe">Subscribe <a href="{{"/feed.xml" | relative_url }}"> via RSS</a></p>

You can find the source code for this website at
{% include icon-github.html username="deweymao" %} /
[deweymao.github.io](https://github.com/deweymao/deweymao.github.io)

<!--
### <img src="{{ site.url }}/assets/pics/reward.png" alt="Reward me"/> Thanks for Your Reward!
If this site is helpful to you, and you are willing to support me to do better, please let your money become more valuable. thank you!

<div style="float:left">
<table>
 <tr>
  <td align="center"><img src="{{ site.url }}/assets/pics/alipay.png" alt="AliPay"/><p>Reward by Alipay</p></td>
 </tr>
</table>
</div>

<div style="float:right">
<table>
  <tr>
  <td align="center"><img src="{{ site.url }}/assets/pics/wxpay.png" alt="WeChatPay"/><p>Reward by WeChatpay</p></td>
 </tr>
</table>
</div>
-->