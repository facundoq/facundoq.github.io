---
layout: page
title: Transformational Measures
sidebar_link: true
---

Transformational measures allow to quantify the relationship between transformations of the inputs to neural networks and their outputs or intermediate representations. 

{% for project in site.data.transformational_measures %}
  {%include  project.html %}
{% endfor %}
