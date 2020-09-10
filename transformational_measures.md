---
layout: page
title: Transformational Measures
sidebar_link: true
---

Transformational measures allow to quantify the relationship between transformations of the inputs to neural networks and their outputs or intermediate representations. 

In particular


{% for item in site.data.transformational_measures %}
<div class="item" >

<div class="item-image-container">
<a href="{{item.url}}"><img class="item-image" src="/assets/projects/{{item.img}}"></a>
</div>

<div class="item-text">
<a href="{{item.url}}"> <h3>{{item.name}}</h3></a>
<p>{{item.desc}}</p>
</div>

<div class="item-collaborators">
{% for member in item.members %}
    <img class="item-collaborator" src="/assets/collaborators/{{member}}.png">
{% endfor %}  
</div>

</div>

{% endfor %}



