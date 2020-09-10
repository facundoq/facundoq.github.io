
# Machine Learning Resources


## Courses

These two are probably the best introductory courses out there right now:

 * [Machine Learning de Andrew Ng, Stanford](https://www.coursera.org/learn/machine-learning)
 Best introductory machine learning course? Maybe a bit dated. (lots of github repos with solutions)

* [Convolutional Neural Networks de Karpathy, Stanford](http://cs231n.github.io/)
 Best introductory machine learning course? It says convolutional but the first half deals with machine learning. It's really up to date wrt the state of the art in neural networks. (lots of github repos with solutions) [link to stanford version of the course](http://vision.stanford.edu/teaching/cs231n/index.html)


## Books


### Introductory books
* [Learning from Data, by Abu-Mostafa, 2012](https://www.amazon.com/Learning-From-Data-Yaser-Abu-Mostafa/dp/1600490069/ref=zg_bs_3887_15) Really short and to the point, a great intro to machine learning from the statistical learning theory perspective (specially good for svm), introducing basic concepts such as overfitting, testing/validation sets, cross validation, model selection, supervised vs non supervised, etc.

* [Information theory, inference and Learning, by McKay, 2003](http://www.inference.phy.cam.ac.uk/itprnn/book.html) Great book for self study, information theory chapters can be skipped, it is a bit general but great for understanding probabilitic and bayesian models, although requires a bit of math saaviness.

* [Neural Networks and Deep Learning, by Nielsen, 2015, (free online)](http://neuralnetworksanddeeplearning.com/).
Best introduction by far to Neural Networks (feedforward + convolutional). Easy, free and short.

* [Probabilistic Programming & Bayesian Methods for Hackers, various authors, 2015/2016, (free online, open source)](http://camdavidsonpilon.github.io/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/) Bayesian and probabilitic models for programmers (easy math!).

* [Deep Learning Book, by Goodfellow and Bengio, 2016, (free online)](http://www.deeplearningbook.org/) This is not really "introductory" in the sense of being easy to follow or having few prerequisites, but it is a great intro if you want to work on improving current neural network models.

### Classical reference books

These books are sort of traditional, and aren't designed for self study, I'd advise you to use them  as a reference. They are sorted from easy to difficult. Even though all books cover similar topics, they have different approaches:

* Pattern classification/recognition: more signal processing
* Statistical Learning/Inference/Probabilistic/Graphical Models: More bayesian/statistical models
* Machine Learning/Learning From data: a bit more agnostic, more "pure learning" algorithms


 * [Machine Learning, by Tom Mitchell](https://www.amazon.com/gp/product/0070428077/ref=pd_sim_14_9?ie=UTF8&psc=1&refRID=XENB6TPJHVN3FWVVX337) This is sort of THE classical textbook reference for machine learning stuff. I've read mixed opinions about self-study.

* [Pattern Recognition, by Theodoridis, 2008](http://store.elsevier.com/Pattern-Recognition/Sergios-Theodoridis/isbn-9781597492720/) Similar to Bishop's

* [Pattern Recognition and Machine Learning, by Bishop](https://www.amazon.com/gp/product/0387310738/ref=pd_sim_14_2?ie=UTF8&psc=1&-refRID=M6A1E6MTZ2SNK9DGY0CN) A sequel to Duda's book, a bit more updated and of similar difficulty.

* [Pattern Classification, by Duda and Hart, 2000](http://www.wiley.com/WileyCDA/WileyTitle/productCd-0471056693.html) The classic pattern classification book. A bit dated right now but great for reference.

* [Machine Learning: a Probabilistic Perspective, by Keving Murphy, 2014](https://www.cs.ubc.ca/~murphyk/MLbook/). Reputedly difficult and not for self-study, but updated.

* [Probabilistic graphical models, by Koller, 2009](http://pgm.stanford.edu/) Great book but a bit disorganized. Also difficult, not recommended for self-study.

* [The elements of statistical Learning, by Hastie, 2001](https://www.amazon.com/The-Elements-Statistical-Learning-Prediction/dp/0387848576/ref=zg_bs_3887_10) Famous for being terse and difficult, not recommended for self-study.


## Writing papers & stuff

* [English Communication for Scientists, Nature ](http://www.nature.com/scitable/ebooks/english-communication-for-scientists-14053993/contents)


## Talks/presentations

* [Giving a Talk, Peyton Jones]( https://www.microsoft.com/en-us/research/wp-content/uploads/2016/08/giving-a-talk.pdf)
* [Giving a Talk, Peyton Jones (video)](https://www.youtube.com/watch?v=sT_-owjKIbA)
* [The cognitive style of powerpoint, Edward Tufte](http://users.ha.uth.gr/tgd/pt0501/09/Tufte.pdf)

## Blogs & Forums
 * [Math & Programming, Jeremy Kun](https://jeremykun.com/2015/04/06/markov-chain-monte-carlo-without-all-the-bullshit/)
 * [Colah's blog](http://colah.github.io/)
 * [Cross Validated Q&A (stackoverflow for statistics)](http://stats.stackexchange.com/)


## Podcasts

  * [The talking machines](http://www.thetalkingmachines.com/)
  * [Linear Digressions](http://lineardigressions.com/)
  * [The Data Skeptic](http://dataskeptic.com/)
  * [Partially Derivative](http://partiallyderivative.com/)
  * [Learning Machines 101](http://www.learningmachines101.com/)

## Newsletters & Mailing Lists
 * [Connectionists](https://mailman.srv.cs.cmu.edu/mailman/listinfo/connectionists)
 * [Uncertainty in AI](http://web.engr.oregonstate.edu/~dambrobr/uai.html)



## Starting out
  If you are starting out in machine learning, focusing on neural networks  the recommended path to take would be:
  * General knowledge (this can easily take 6 months or more)
    * Suscribe to Connectionists and Uncertainty in AI
    * Start listening to some podcasts, they are mostly introductory and enable you to quickly get a superficial knowledge of various subjects and get to know some research groups in ml.
    * Take Andrew Ng and Karphaty's online courses (in that order). Do all the homework/quizzes.
    * While doing Andrew Ng's course, read Learning from Data, by Abu-Mostafa.
    * While doing Karpathy's course, read Neural Networks and Deep Learning, by Nielsen
  * Specific neural networks stuff
    * Read Bengios Book on deep learning
    * Learn how to use a deep learning framework such as Torch/Tensor Flow/Caffe/etc. It seems Keras (built on top of Tensor Flow) is a good choice.
    * Take a course/read a book on bayesian inference/probabilitic models
    * Take a problem with a few datasets (maybe from a kaggle competition) and a model a try to improve its performance.
    * Checkout papers from NIPS (one of the best ml/neural nets conferences)
