---
layout: page
title: Sign Language Recognition
sidebar_link: true
---

Sign language recognition allows computers to recognize the sign of a specific sign language, and afterwards translate it to a written language. 

In 2015, with [Franco Ronchetti](http://weblidi.info.unlp.edu.ar/wp/en/recursos-humanos/auxiliares-becarios-y-tesistas/ronchetti-franco/) we recorded LSA16 and LSA64, the first sign language datasets for the Argentinian Sign Language ([Lengua de Señas Argentina, LSA](https://es.wikipedia.org/wiki/Lengua_de_se%C3%B1as_argentina)) focused on training Computer Vision models. Afterwards, we've also contributed new  recognition methods, analysis and tools.



{% for project in site.data.sign_language %}
  {%include  project.html %}
{% endfor %}




