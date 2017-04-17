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
</div>

You can find the source code for this website at
{% include icon-github.html username="deweymao" %} /
[deweymao.github.io](https://github.com/deweymao/deweymao.github.io)
