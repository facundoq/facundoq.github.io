---
layout: page
title: Projects & Stuff
sidebar_link: true
---

A collection side projects and stuff:


<div class="projects">
{% for project in site.data.projects %}
  {%include  project.html %}
{% endfor %}
</div>