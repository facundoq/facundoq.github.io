## Sign language recognition datasets

### Comparison

id  | Name | Country | Classes | Subjects | Samples | Data | Language level | Type | Annotations | Availability |
|:-:|:-------------------:|:--------:|:-----:|:------:|:------:|:----:|:----------:|:--------------------------------:|:----------:|:--------:|
1| DGS Kinect 40 |Germany |40 |15 |3000 | |Word|Videos, multiple angles|| Contact Author|
2   | RWTH-PHOENIX-Weather|Germany   |1200  |9     |45760      |  52gb   |Sentence    |Videos                            | Face, hand, end/start (unfinished)| Publicly Available|
3   | SIGNUM              |Germany   |450   |25    |33210      |920gb |Sentence    |Videos                            |            | Publicly Available, 1TB, contact author to obtain hard drive|
4   | GSL 20              |Greek     |20    | 6    |~840       |      |Word        |                                  |            | Contact Author|
5   | Boston ASL LVD      |USA       |3300+ |6     | 9800      |      |Word        |Videos, multiple angles           |hand,end/start| Publicly Available|
6   |PSL Kinect 30        |Poland    |30    |1     |30×10=300  |~1.2gb|Word        | Videos, depth from Kinect camera  | | Publicly Available|
7   |PSL ToF    84        |Poland    |84    |1     |84×20=1680 |~33gb |Word        |Videos, ToF camera                 | | Publicly Available|
8   |PSL 101              |Poland    |?     |?     |?          |?     |?|?  | | Contact Author |
9  | LSA64          |Argentina |64    |10    |3200       |20gb  |Word        |Videos(rgb)   |  Hands and Head position | Publicly Available|
10 |BosphorusSign |Turkey |     |    |       |  |        |   |   | Non available | 
11 | MSR Gesture 3D | USA |12    |10    |336       |28mb  |Word        |Videos (depth)   |   | Publicly Available|
12 | DEVISIGN-G | China | 36 (letters/numbers) | 8 | 432 | ? | Word | videos (rgb)| | Contact author
13 | DEVISIGN-D | China | 500 | 8 | 6000 | ? | Word | videos (rgb) | | Contact author
14 | DEVISIGN-L | China | 2000 | 8 | 24000 | ? | Word | videos (rgb) | | Contact author
15 | IIITA -ROBITA | India | 23 | ? | |284mb | Word | videos (rgb) 320x240 | |Contact author
16 | Purdue ASL  | USA | ?| 14 (only 5 available)| ? | ? | Word/sentence  | Videos, RGB | | Request DVDs/HD
17 | CUNY ASL | USA | ? | 8 | ~33000 glosses,  | ? | Sentence| videos (rgb), mocap data | Signstream| Unknown
18 | SignsWorld Atlas | Arabia | multiple types | 10|  ? | ? | Handshape, Words, Sentences | Images, Videos, RGB | ? | Unknown 
{: .tablelines}




### Dataset information and related papers

1. DGS Kinect 40 - German Sign Language (no website)
    1. [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
    2. [Sign Language Recognition using Sequential Pattern Trees](https://pdfs.semanticscholar.org/e8a1/84e76d6476ecc27857b1c1b280af5628d0ae.pdf) 2012, Ong et al.
    3. [Sign Spotting using Hierarchical Sequential Patterns with Temporal Intervals](http://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Ong_Sign_Spotting_using_2014_CVPR_paper.pdf) 2014, Ong et al.
2. [RWTH-PHOENIX v1 - German Sign Language](http://www-i6.informatik.rwth-aachen.de/~forster/database-rwth-phoenix.php) [RWTH-PHOENIX v2](https://www-i6.informatik.rwth-aachen.de/~koller/RWTH-PHOENIX/)
    1. [Dataset paper](http://www-i6.informatik.rwth-aachen.de/publications/download/773/forster-lrec-2012.pdf) 2012, Forster et al.
    2. [Dataset extensions paper](http://www.lrec-conf.org/proceedings/lrec2014/pdf/585_Paper.pdf) 2014, Forster et al
    3. [Continuous sign language recognition: Towards large vocabulary statistical recognition systems handling multiple signers](http://www.sciencedirect.com/science/article/pii/S1077314215002088) 2015, Koller et al.
    4.[May the force be with you: Force-aligned signwriting for automatic subunit annotation of corpora](http://www-i6.informatik.rwth-aachen.de/publications/download/852/Koller-FG-2013.pdf) 2013, Koller et al.
    5. [Deep Sign: Hybrid CNN-HMM for Continuous Sign Language Recognition](http://epubs.surrey.ac.uk/812319/)
    6.
3. [SIGNUM - German Sign Language](http://www.phonetik.uni-muenchen.de/forschung/Bas/SIGNUM/)
    1. [Continuous sign language recognition: Towards large vocabulary statistical recognition systems handling multiple signers](http://www.sciencedirect.com/science/article/pii/S1077314215002088) 2015, Koller et al.
4. Greek Sign Language (no website)
    1. [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
    2. [Sign Language Recognition using Sequential Pattern Trees](https://pdfs.semanticscholar.org/e8a1/84e76d6476ecc27857b1c1b280af5628d0ae.pdf) 2012, Ong et al.
    3. [Sign Spotting using Hierarchical Sequential Patterns with Temporal Intervals](http://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Ong_Sign_Spotting_using_2014_CVPR_paper.pdf) 2014, Ong et al.
5. [Boston ASLLVD - American Sign Language](http://www.bu.edu/av/asllrp/dai-asllvd.html)
    * [Exploiting Phonological Constraints for Handshape Inference in ASL Video](http://www.bu.edu/asllrp/1826-CVPR_2011.pdf) 2011, Thangali et al.
    * [A New Framework for Sign Language Recognition based on 3D Handshape Identification and Linguistic Modeling](http://www.lrec-conf.org/proceedings/lrec2014/pdf/1138_Paper.pdf) 2014 - Dilsizian - 84% accuracy
6. [PSL Kinect 30 - Polish Sign Language](http://vision.kia.prz.edu.pl/dynamickinect.php)
    1. [Polish sign language words recognition with Kinect ](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6577826&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6577826) 2013, Oszust et al.
    2. [Some Approaches to Recognition of Sign Language Dynamic Expressions with Kinect ](http://link.springer.com/chapter/10.1007%2F978-3-319-08491-6_7) 2014, Oszust et al.
    3. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
7. [PSL ToF 84 - Polish Sign Language](http://vision.kia.prz.edu.pl/dynamictof.php)
    1. [Polish sign language words recognition with Kinect](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6577826&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6577826)  2013, Oszust et al.
    2. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
8. PSL 101 - Polish Sign Language (no website)
    1. [Modelling and Recognition of Signed Expressions Using Subunits Obtained by Data–Driven Approach](http://link.springer.com/chapter/10.1007%2F978-3-642-33185-5_35#page-2) 2012, Oszust et al.
9. [LSA64 Argentinian Sign Language](http://facundoq.github.io/unlp/lsa64/index.html)
    1. [LSA64: an Argentinian Sign Language Dataset](http://sedici.unlp.edu.ar/handle/10915/56764)
    2. [Sign Languague Recognition Without Frame-Sequencing Constraints: A Proof of Concept on the Argentinian Sign Language](https://link.springer.com/chapter/10.1007/978-3-319-47955-2_28)
    3. [Dynamic Gesture Recognition and its Application to Sign Language](http://sedici.unlp.edu.ar/handle/10915/62945) 2017, Ronchetti
    4. [SIGN LANGUAGE RECOGNITION BASED ON HAND AND BODY SKELETAL DATA](https://www.researchgate.net/profile/Kosmas_Dimitropoulos/publication/325011717_Sign_Language_Recognition_based_on_Hand_and_Body_Skeletal_Data/links/5af160e3a6fdcc24364b1024/Sign-Language-Recognition-based-on-Hand-and-Body-Skeletal-Data.pdf) 2017, Konstantinidis et al.
    5. [Real-Time Sign Language Gesture (Word) Recognition from Video Sequences Using CNN and RNN](https://link.springer.com/chapter/10.1007/978-981-10-7566-7_63) 2018, Masood et al.
10. [Turkish sign language dataset](https://www.cmpe.boun.edu.tr/pilab/BosphorusSign/home_en.html)
11. [MSR Gesture 3D - ASL ](https://www.microsoft.com/en-us/research/people/zliu/?from=http%3A%2F%2Fresearch.microsoft.com%2Fen-us%2Fum%2Fpeople%2Fzliu%2Factionrecorsrc%2F) [Download site](https://www.uow.edu.au/~wanqing/#Datasets)
    1. [Action Recognition from Depth Sequences Using Weighted Fusion of 2D and 3D Auto-Correlation of Gradients Features](https://link.springer.com/article/10.1007/s11042-016-3284-7) 2016, Chen et al
12. [DEVISIGN G](http://vipl.ict.ac.cn/homepage/ksl/data.html#page3)
13. [DEVISIGN D](http://vipl.ict.ac.cn/homepage/ksl/data.html#page3)
14. [DEVISIGN L](http://vipl.ict.ac.cn/homepage/ksl/data.html#page3)
15. [IIITA -ROBITA Indian Sign Language Gesture Database](https://robita.iiita.ac.in/dataset.php)
    1. [Recognizing & Interpreting Indian Sign Language Gesture for Human Robot Interaction](https://ieeexplore.ieee.org/document/5640434/) 2010, Nandy et al.
    2. [ Recognition of Isolated Indian Sign Language gesture in Real Time ](https://pdfs.semanticscholar.org/fa4d/a909eeebc9a923e29502e3eb2dd6c40ca083.pdf) 2010, Nandy et al.
<!--9. [CUNY](http://eniac.cs.qc.cuny.edu/matt/pubs/lu-huenerfauth-2012-lrec.pdf)-->
16. [Purdue ASL Dataset](http://www2.ece.ohio-state.edu/~aleix/ASLdatabase.htm)
17. [CUNY ASL Dataset for Animation](latlab.cs.qc.cuny.edu/corpus) 
    1. [Collecting and evaluating the CUNY ASL corpus for research on American Sign Language animation](https://www.sciencedirect.com/science/article/pii/S0885230813000879)
18. [SignsWorld Atlas; a benchmark Arabic Sign Language database](https://www.sciencedirect.com/science/article/pii/S1319157814000548)