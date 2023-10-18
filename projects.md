---
layout: page
title: Projects & Stuff
sidebar_link: true
---

A collection side projects and stuff:

{% for project in site.data.projects %}
  {%include  project.html %}
{% endfor %}

