---
layout: page
title: Sign Language Recognition
sidebar_link: true
---

Sign language recognition allows computers to recognize the sign of a specific sign language, and afterwards translate it to a written language. 

Alongside [Franco Ronchetti](http://weblidi.info.unlp.edu.ar/wp/en/recursos-humanos/auxiliares-becarios-y-tesistas/ronchetti-franco/), in 2015 we recorded the first sign language datasets for the Argentinian Sign Language (Lengua de Señas Argentina, LSA) focused on training Computer Vision models. Afterwards, we've continuosly working on this topic, also contributing new recognition methods and tools.


{% for item in site.data.sign_language %}
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



