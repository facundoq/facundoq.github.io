---
layout: page
title: Projects
sidebar_link: true
---



{% for item in site.data.projects %}
<div class="item" >
<img class="item-image" src="/assets/projects/{{item.img}}">

<div class="item-text">
<h3>{{item.name}}</h3>
<p>{{item.desc}}</p>
</div>

<div>
{% for member in item.members %}
    <img class="item-collaborator" src="/assets/collaborators/{{member}}.png">
{% endfor %}  
</div>

</div>

{% endfor %}



