# Sign Language Recognition Datasets
<!--- TODO
CUNY details -> its a mocap dataset, worth including?

LATER:
Websites for greek, german, polish 101?
write cooper for details on german/greek/british datasets
add http://research.microsoft.com/en-us/um/people/zliu/actionrecorsrc/ for 12 ASL kinect signs
add http://sun.aei.polsl.pl/~mkawulok/gestures/ db of handshapes

-->




## Sign language datasets
### Comparison
id  | Name                |Country   |Classes|Subjects| Samples| Data | Language level| Type                             | Annotations | Availability |
|:-:|:-------------------:|:--------:|:-----:|:------:|:------:|:----:|:----------:|:--------------------------------:|:----------:|:--------:|
1   | DGS Kinect 40       |Germany   |40    |15    |3000       |      |Word        |Videos, multiple angles           |            | Contact Author|
2   | RWTH-PHOENIX-Weather|Germany   |1200  |9     |45760      |  52gb   |Sentence    |Videos                            | Face, hand, end/start (unfinished)| Publicly Available|
3   | SIGNUM              |Germany   |450   |25    |33210      |920gb |Sentence    |Videos                            |            | Publicly Available, 1TB, contact author to obtain hard drive|
4   | GSL 20              |Greek     |20    | 6    |~840       |      |Word        |                                  |            | Contact Author|
5   | Boston ASL LVD      |USA       |3300+ |6     | 9800      |      |Word        |Videos, multiple angles           |hand,end/start| Publicly Available|
6   |PSL Kinect 30        |Poland    |30    |1     |30×10=300  |~1.2gb|Word        | Videos, depth from Kinect camera  | | Publicly Available|
7   |PSL ToF    84        |Poland    |84    |1     |84×20=1680 |~33gb |Word        |Videos, ToF camera                 | | Publicly Available|
8   |PSL 101              |Poland    |?     |?     |?          |?     |?|?  | | Contact Author |
9  | LSA64          |Argentina |64    |10    |3200       |20gb  |Word        |Videos   |  Hands and Head position | Publicly Available|

<!--6   | CUNY                |USA       |      |      |           |      |Word        |                                  |            ||-->

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
10. [LSA64 Argentinian Sign Language](http://facundoq.github.io/unlp/lsa64/index.html)
    1. [LSA64: an Argentinian Sign Language Dataset](http://sedici.unlp.edu.ar/handle/10915/56764)
    2. [Sign Languague Recognition Without Frame-Sequencing Constraints: A Proof of Concept on the Argentinian Sign Language](https://link.springer.com/chapter/10.1007/978-3-319-47955-2_28)
    3. [Dynamic Gesture Recognition and its Application to Sign Language](http://sedici.unlp.edu.ar/handle/10915/62945) 2017, Ronchetti
    4. [SIGN LANGUAGE RECOGNITION BASED ON HAND AND BODY SKELETAL DATA](https://www.researchgate.net/profile/Kosmas_Dimitropoulos/publication/325011717_Sign_Language_Recognition_based_on_Hand_and_Body_Skeletal_Data/links/5af160e3a6fdcc24364b1024/Sign-Language-Recognition-based-on-Hand-and-Body-Skeletal-Data.pdf) 2017, Konstantinidis et al.
    5. [Real-Time Sign Language Gesture (Word) Recognition from Video Sequences Using CNN and RNN](https://link.springer.com/chapter/10.1007/978-981-10-7566-7_63) 2018, Masood et al.
11. [Turkish sign language dataset](https://www.cmpe.boun.edu.tr/pilab/BosphorusSign/home_en.html)

<!--9. [CUNY](http://eniac.cs.qc.cuny.edu/matt/pubs/lu-huenerfauth-2012-lrec.pdf)-->

## Handshape datasets (for sign language)
### Comparison

id  | Name                     |Country    |Classes|Subjects| Samples       | Data | Type              | Availability   |
|:-:|:------------------------:|:---------:|:-----:|:------:|:-------------:|:----:|:-----------------:|:--------------:|
1   | ASL Fingerspelling A     |USA        |   24  | 5      |131000         |      |images (depth+rgb) | Free download  |
2   | ASL Fingerspelling B     |USA        |   24  | 9      |               |      |images (depth)     | Free download  |
3   | LSA16 handshapes         |Argentina  |16     |10      |800            |7mb   |images (rgb)       | Free download  |
4   | PSL Fingerspelling ToF   |Poland     |16     |3       |960            |~290mb|3D point cloud     | Free download  |
5   | ISL   |Irish     | 23 static + 3 dynamic    |6       |58114 frames / 468 videos |170mb|segmented images     | Free download  |
6   |  RWTH-PHOENIX-Weather Handshapes | German | 60 | | 3359 labelled + 17gb unlabeled | + 17gb | Hand Images (rgb) | Free download
### Dataset information and related papers

1. [ASL Fingerspelling A](http://empslocal.ex.ac.uk/people/staff/np331/index.php?section=FingerSpellingDataset)
     1. [Spelling It Out: Real-Time ASL Fingerspelling Recognition](http://personal.ee.surrey.ac.uk/Personal/N.Pugeault/publications/PugeaultBowden2011b.pdf). 2011, Pugeault et al.
2. [ASL Fingerspelling B](http://empslocal.ex.ac.uk/people/staff/np331/index.php?section=FingerSpellingDataset)
      1. [Spelling It Out: Real-Time ASL Fingerspelling Recognition](http://personal.ee.surrey.ac.uk/Personal/N.Pugeault/publications/PugeaultBowden2011b.pdf). 2011, Pugeault et al.
      2. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf). 2015, Kapuscinski et al.
3. [PSL Fingerspelling ToF](http://vision.kia.prz.edu.pl/statictof.php)
    1. [Recognition of Hand Gestures Observed by Depth Cameras](http://cdn.intechopen.com/pdfs-wm/48352.pdf). 2015, Kapuscinski et al.
4. [LSA16 handshapes](http://facundoq.github.io/unlp/lsa16/index.html)
    1. [Handshape recognition for Argentinian Sign Language using ProbSom](http://journal.info.unlp.edu.ar/wp-content/uploads/2015/10/JCST-42-Paper-1.pdf). 2016, Ronchetti et al.
    2. [A Study of Convolutional Architectures for Handshape Recognition applied to Sign Language](http://sedici.unlp.edu.ar/handle/10915/63481) 2017, Quiroga et al.
5. [ISL Irish Sign Language Letters](https://github.com/marlondcu/ISL).
    1. [A Dataset for Irish Sign Language Recognition](http://doras.dcu.ie/21882/1/IMVIP_short_cr.pdf) 2017, Oliveira et al.
    2. [A comparison between end-to-end approaches and feature extraction based approaches for Sign Language recognition](http://doras.dcu.ie/22132/1/Houssem_-_IVCNZ_2017.pdf) 2017, Oliveira et al.
6. [RWTH-PHOENIX-Weather 2014 MS Handshapes](https://www-i6.informatik.rwth-aachen.de/~koller/1miohands-data/)
    1. [ Deep Hand: How to Train a CNN on 1 Million Hand Images When Your Data Is Continuous and Weakly Labelled ](https://www-i6.informatik.rwth-aachen.de/publications/download/1000/Koller-CVPR-2016.pdf)

## Other info
Kevin Murphy mantains a similar list for [Action Recognition Datasets](http://www.cs.ubc.ca/~murphyk/videodata.html).

Other similar websites with sign language dataset compilations are:
[Chalearn dataset list](http://ww1.chalearn.org/resou/databases)
[RWTH datasets list](https://www-i6.informatik.rwth-aachen.de/web/Software/Databases/Signlanguage/?db=rwth-boston-104)
