---
layout: page
title: Interpretability for NNs
sidebar_link: true
---

Interpretability methods for neural networks are essential tools that help us understand and make sense of the complex decision-making processes within these black-box models. These techniques aim to provide insights into why a neural network makes specific predictions or classifications, shedding light on the inner workings of the model. By using various approaches, such as feature visualization, saliency maps, and attribution methods, interpretability methods help users grasp the relationships between input features and output predictions, making neural networks more transparent, accountable, and trustworthy. 

In particular, as part of my PhD thesis I developed Transformational Measures to quantify the relationship between transformations of the inputs to neural networks and their outputs or intermediate representations in terms of invariance and same-equivariance. 

<div class="projects">
{% for project in site.data.interpretability %}
  {%include  project.html %}
{% endfor %}
</div>