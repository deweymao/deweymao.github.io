---
layout: page
title: About
permalink: /about/
---

<div>
{% if site.github_username %}
<p>{% include icon-github.html username=site.github_username %}</p>
{% endif %}
{% if site.email %}
<p><a href="mailto:{{ site.email }}">{{ site.email }}</a></p>
{% endif %}
<p class="rss-subscribe">Subscribe <a href="{{"/feed.xml" | relative_url }}"> via RSS</a></p>
</div>

You can find the source code for this website at
{% include icon-github.html username="deweymao" %} /
[deweymao.github.io](https://github.com/deweymao/deweymao.github.io)
