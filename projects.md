---
layout: page
title: Projects & Stuff
sidebar_link: true
---

A collection side projects from my research and studies:

{% for project in site.data.projects %}
  {%include  project.html %}
{% endfor %}

