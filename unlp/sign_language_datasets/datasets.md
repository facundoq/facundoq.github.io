# Sign Language Recognition Datasets

## Comparison

id  | Name                |Classes|Subjects| Samples       | Data | Type                             | Annotations |
|:-:|:-------------------:|:-----:|:------:|:-------------:|:----:|:--------------------------------:|:----------:|
1   | Fingerspelling ASL A|  24   | 5      |131000         |      |Handshape images (depth+rgb) |   |
1   | Fingerspelling ASL B|  24   | 9      |               |      |Handshape images (depth)     |   |
1   | Fingerspelling PSL |  16   | 3       |960            |~288mb|Handshape images (depth)     |   |
2   | Greek Sign Language |  20   | 6      |~840           |      |                                  |            |
3   | DGS Kinect 40       |  40   | 15     | 3000          |      |Videos, multiple angles           |            |
4   | Boston ASLLVD       |3300+  |1/6     | 9800          |      |Videos, multiple angles           |hand,end/start|
5   |PSL A                |30    |1        |30*10=300      |~1.2gb|Videos, Kinect camera             |Word level  |
5   |PSL C                |84    |1        |84*20=1680     |~33gb |Videos, ToF camera                |Word level  |

6   | RWTH-PHOENIX-Weather|1200   |9       |45760          |      |Videos, one per sentence          | Face, hand, end/start (unfinished)|
7   | SIGNUM              |450    |25      |33210          |920gb |Videos, one per sentence          |            |
8   | CUNY                |       |        |               |      |                                  |            |
9   | LSA64 signs         |64     |10      |3200           |20gb  |Videos, one per sign              |            |
10  | LSA16 handshapes    |16     |10      |800            |7mb   |Handshape images                  |            |

##Papers
1. [Fingerspelling ASL](http://empslocal.ex.ac.uk/people/staff/np331/index.php?section=FingerSpellingDataset)
     1. [Spelling It Out: Real-Time ASL Fingerspelling Recognition](http://personal.ee.surrey.ac.uk/Personal/N.Pugeault/publications/PugeaultBowden2011b.pdf) 2011, Pugeault et al.
     2. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
1. [Fingerspelling PSL](http://vision.kia.prz.edu.pl/statictof.php)
    1.[Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
2. [Greek Sign Language](?)
    1. [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
    2. [Sign Language Recognition using Sequential Pattern Trees](https://pdfs.semanticscholar.org/e8a1/84e76d6476ecc27857b1c1b280af5628d0ae.pdf) 2012, Ong et al.
    3. [Sign Spotting using Hierarchical Sequential Patterns with Temporal Intervals](http://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Ong_Sign_Spotting_using_2014_CVPR_paper.pdf) 2014, Ong et al.
3. [DGS Kinect 40](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf)
    1. [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
    2. [Sign Language Recognition using Sequential Pattern Trees](https://pdfs.semanticscholar.org/e8a1/84e76d6476ecc27857b1c1b280af5628d0ae.pdf) 2012, Ong et al.
    3. [Sign Spotting using Hierarchical Sequential Patterns with Temporal Intervals](http://www.cv-foundation.org/openaccess/content_cvpr_2014/papers/Ong_Sign_Spotting_using_2014_CVPR_paper.pdf) 2014, Ong et al.
4. [Boston ASLLVD](http://www.bu.edu/av/asllrp/dai-asllvd.html)
    * [Exploiting Phonological Constraints for Handshape Inference in ASL Video](http://www.bu.edu/asllrp/1826-CVPR_2011.pdf) 2011, Thangali et al.
    * [A New Framework for Sign Language Recognition based on 3D Handshape Identification and Linguistic Modeling](http://www.lrec-conf.org/proceedings/lrec2014/pdf/1138_Paper.pdf) 2014 - Dilsizian - 84% accuracy
5. [PSL 101](?)  
    1. [Modelling and Recognition of Signed Expressions Using Subunits Obtained by Data–Driven Approach](http://link.springer.com/chapter/10.1007%2F978-3-642-33185-5_35#page-2) 2012, Oszust et al.  
5. [PSL Kinect 30](http://vision.kia.prz.edu.pl/dynamickinect.php)  
    1. [Polish sign language words recognition with Kinect ](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6577826&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6577826) 2013, Oszust et al.
    2. [Some Approaches to Recognition of Sign Language Dynamic Expressions with Kinect ](http://link.springer.com/chapter/10.1007%2F978-3-319-08491-6_7) 2014, Oszust et al.
    3. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
5. [PSL ToF 84](http://vision.kia.prz.edu.pl/dynamictof.php)  
    1. [Polish sign language words recognition with Kinect](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6577826&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6577826)  2013, Oszust et al.
    2. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf) 2015, Kapuscinski et al.
6. [RWTH-PHOENIX](http://www-i6.informatik.rwth-aachen.de/~forster/database-rwth-phoenix.php)
    1. [Dataset paper](http://www-i6.informatik.rwth-aachen.de/publications/download/773/forster-lrec-2012.pdf) 2012, Forster et al.
    2. [Dataset extensions paper](http://www.lrec-conf.org/proceedings/lrec2014/pdf/585_Paper.pdf) 2014, Forster et al
    3. [Continuous sign language recognition: Towards large vocabulary statistical recognition systems handling multiple signers](http://www.sciencedirect.com/science/article/pii/S1077314215002088) 2015, Koller et al.
    4.[May the force be with you: Force-aligned signwriting for automatic subunit annotation of corpora](http://www-i6.informatik.rwth-aachen.de/publications/download/852/Koller-FG-2013.pdf) 2013, Koller et al.
7. [SIGNUM](http://www.phonetik.uni-muenchen.de/forschung/Bas/SIGNUM/)
    1. [Continuous sign language recognition: Towards large vocabulary statistical recognition systems handling multiple signers](http://www.sciencedirect.com/science/article/pii/S1077314215002088) 2015, Koller et al.
8. [CUNY](http://eniac.cs.qc.cuny.edu/matt/pubs/lu-huenerfauth-2012-lrec.pdf)
9. [LSA64](http://facundoq.github.io/unlp/lsa64/index.html)
10. [LSA16](http://facundoq.github.io/unlp/lsa16/index.html)
