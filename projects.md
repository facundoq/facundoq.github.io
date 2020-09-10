---
layout: page
title: Projects & Stuff
sidebar_link: true
---



{% for item in site.data.projects %}
<div class="item" >
<a href="{{item.url}}"><img class="item-image" src="/assets/projects/{{item.img}}"></a>

<div class="item-text">
<a href="{{item.url}}"> <h3>{{item.name}}</h3></a>
<p>{{item.desc}}</p>
</div>

<div>
{% for member in item.members %}
    <img class="item-collaborator" src="/assets/collaborators/{{member}}.png">
{% endfor %}  
</div>

</div>

{% endfor %}



