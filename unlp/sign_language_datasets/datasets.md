# Sign Language Recognition Datasets
<!--- TODO
CUNY details
Papers for all methods
Websites for greek, german, polish and cuny Datasets
write cooper for details on german/greek/british datasets
add http://research.microsoft.com/en-us/um/people/zliu/actionrecorsrc/ for 12 ASL kinect signs
add http://sun.aei.polsl.pl/~mkawulok/gestures/ db of handshapes

-->


## Handshape datasets (for sign language)
### Comparison

id  | Name                |Classes|Subjects| Samples       | Data | Type                             | Annotations |
|:-:|:-------------------:|:-----:|:------:|:-------------:|:----:|:--------------------------------:|:----------:|
1   | Fingerspelling ASL A|  24   | 5      |131000         |      |Handshape images (depth+rgb) |   |
2   | Fingerspelling ASL B|  24   | 9      |               |      |Handshape images (depth)     |   |
3  | LSA16 handshapes    |16     |10      |800            |7mb   |Handshape images                  |            |

##Papers

1. [Fingerspelling ASL A](http://empslocal.ex.ac.uk/people/staff/np331/index.php?section=FingerSpellingDataset)
     * [Spelling It Out: Real-Time ASL Fingerspelling Recognition](http://personal.ee.surrey.ac.uk/Personal/N.Pugeault/publications/PugeaultBowden2011b.pdf) 2011, Pugeault et al.
1. [Fingerspelling ASL B](http://empslocal.ex.ac.uk/people/staff/np331/index.php?section=FingerSpellingDataset)
          * [Spelling It Out: Real-Time ASL Fingerspelling Recognition](http://personal.ee.surrey.ac.uk/Personal/N.Pugeault/publications/PugeaultBowden2011b.pdf) 2011, Pugeault et al.

## Sign language datasets
### Comparison
id  | Name                |Classes|Subjects| Samples       | Data | Language level| Type                             | Annotations |
|:-:|:-------------------:|:-----:|:------:|:-------------:|:----:|:----------:|:--------------------------------:|:----------:|
1   | LSA64 signs         |64     |10      |3200           |20gb  |Word        |Videos                            |            |
2   | Greek Sign Language |  20   | 6      |~840           |      |Word        |                                  |            |
3   | German Sign Language|  40   | 15     | 3000          |      |Word        |Videos, multiple angles           |            |
4   | Boston ASLLVD       |3300+  |6       | 9800          |      |Word        |Videos, multiple angles           |hand,end/start|
5   | Polish Sign Language|30     |1       |300            |      |Word        |                                  |            |
6   | RWTH-PHOENIX-Weather|1200   |9       |45760          |      |Sentence    |Videos                            | Face, hand, end/start (unfinished)|
7   | SIGNUM              |450    |25      |33210          |920gb |Sentence    |Videos                            |            |
8   | CUNY                |       |        |               |      |Word        |                                  |            |



###Papers
1. [LSA64](http://facundoq.github.io/unlp/lsa64/index.html)
2. [Greek Sign Language](?)
    * [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
3. [German Sign Language](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf)
    * [Sign Language Recognition using Sub-Units](http://jmlr.csail.mit.edu/papers/volume13/cooper12a/cooper12a.pdf), 2012, Cooper et al.
4. [Boston ASLLVD](http://www.bu.edu/av/asllrp/dai-asllvd.html)
    * [Exploiting Phonological Constraints for Handshape Inference in ASL Video](http://www.bu.edu/asllrp/1826-CVPR_2011.pdf) 2011, Thangali et al.
    * [A New Framework for Sign Language Recognition based on 3D Handshape Identification and Linguistic Modeling](http://www.lrec-conf.org/proceedings/lrec2014/pdf/1138_Paper.pdf) 2014 - Dilsizian - 84% accuracy
5. [Polish Sign Language](http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=6577826&url=http%3A%2F%2Fieeexplore.ieee.org%2Fxpls%2Fabs_all.jsp%3Farnumber%3D6577826)  
6. [RWTH-PHOENIX](http://www-i6.informatik.rwth-aachen.de/~forster/database-rwth-phoenix.php)  
7. [SIGNUM](http://www.phonetik.uni-muenchen.de/forschung/Bas/SIGNUM/)
    1. [Continuous sign language recognition: Towards large vocabulary statistical recognition systems handling multiple signers](http://www.sciencedirect.com/science/article/pii/S1077314215002088)
8. [CUNY](http://eniac.cs.qc.cuny.edu/matt/pubs/lu-huenerfauth-2012-lrec.pdf)
