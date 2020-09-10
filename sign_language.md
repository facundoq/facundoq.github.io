---
layout: page
title: Sign Language Recognition
sidebar_link: true
---

Sign language recognition allows computers to recognize the sign of a specific sign language, and afterwards translate it to a written language. 

In 2015, with [Franco Ronchetti](http://weblidi.info.unlp.edu.ar/wp/en/recursos-humanos/auxiliares-becarios-y-tesistas/ronchetti-franco/) we recorded LSA16 and LSA64, the first sign language datasets for the Argentinian Sign Language (Lengua de Señas Argentina, LSA) focused on training Computer Vision models. Afterwards, we've also contributed new  recognition methods, analysis and tools.


{% for item in site.data.sign_language %}
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



