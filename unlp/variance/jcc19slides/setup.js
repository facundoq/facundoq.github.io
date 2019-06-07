var slideshow = remark.create({ratio: "16:9"});

// Setup MathJax
MathJax.Hub.Config({
  tex2jax: {
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre'],
    inlineMath: [ ['$','$'],],

  }
});


MathJax.Hub.Configured();
