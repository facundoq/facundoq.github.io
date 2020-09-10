

## Handshape/hand posture datasets (not all are for sign language)
### Comparison

id  | Name                     |Country    |Classes|Subjects| Samples       | Data | Type              | Availability   |
|:-:|:------------------------:|:---------:|:-----:|:------:|:-------------:|:----:|:-----------------:|:--------------:|
1   | ASL Fingerspelling A     |USA        |   24  | 5      |131000         |2.1gb |images (depth+rgb) | Free download  |
2   | ASL Fingerspelling B     |USA        |   24  | 9      |               |317mb |images (depth)     | Free download  |
3   | LSA16 handshapes         |Argentina  |16     |10      |800            |7mb   |images (rgb)       | Free download  |
4   | PSL Fingerspelling ToF   |Poland     |16     |3       |960            |~290mb|3D point cloud     | Free download  |
5   | ISL   |Irish     | 23 static + 3 dynamic    |6       |58114 frames / 468 videos |170mb|segmented images     | Free download  |
6   |  RWTH-PHOENIX-Weather Handshapes | German | 60 | | 3359 labelled + 17gb unlabeled | + 17gb | Hand Images (rgb) | Free download
7 | Japanese Fingerspelling Dataset | Japan | 41 | 10 | 8055 | segmented images (rgb), 32x32 | 4.5mb | Free download
8 | NUS hand posture dataset I | Singapore | 10 | ? | 240 | images (rgb), 160x120 |3mb | Free download
9 | NUS hand posture dataset II| Singapore | 10 | 40 | 2000 | images (rgb)  160x120 | 73mb | Free download
10 | CIARP |  - | 10  | ? | 6000 | images (rgb) 38x38 | 11mb | Free download
11 | RTWH Fingerspelling dataset | Germany | | | | | | |
12 | Indian Kinect | India | 140 | 18 | 5041 | images (rgb+depth) 640x480| 2gb | Free download
13 | Arabic Alphabets Sign Language Dataset (ArASL) | Arabia | 32| ? |54,049 |images (rgb) | 64mb  | Free download



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
    1. [ Deep Hand: How to Train a CNN on 1 Million Hand Images When Your Data Is Continuous and Weakly Labelled ](https://www-i6.informatik.rwth-aachen.de/publications/download/1000/Koller-CVPR-2016.pdf) 2017, Koller et al.
7. [Japanese Sign Language Dataset](http://home.agh.edu.pl/~bkw/research/data/mva/jsl.zip)
    1. [Recognition of JSL Finger Spelling Using Convolutional Neural Networks](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7986796) 2017, Hosoe, Sako and Kwolek
    2. [Learning Siamese Features for Finger Spelling Recognition](https://link.springer.com/chapter/10.1007/978-3-319-70353-4_20) 2017, Sako and Kwolek
8. [NUS hand posture dataset I](https://www.ece.nus.edu.sg/stfpage/elepv/NUS-HandSet/)
    1. [Hand posture and face recognition using a Fuzzy-Rough Approach](http://vadakkepat.com/web/images/stories/pubs/ijhr-2010.pdf) 2010, Pramod Kumar P, Prahlad Vadakkepat, and Loh Ai Poh
    2. [Hand Posture Recognition Using Convolutional Neural Network](https://www.researchgate.net/publication/322915265_Hand_Posture_Recognition_Using_Convolutional_Neural_Network)
9. [NUS hand posture dataset II](https://www.ece.nus.edu.sg/stfpage/elepv/NUS-HandSet/)
    1.[Attention Based Detection and Recognition of Hand Postures Against Complex Backgrounds](http://link.springer.com/article/10.1007%2Fs11263-012-0560-5?LI=true) 2013, Pisharady et al

10. [CIARP 2017](http://home.agh.edu.pl/~bkw/code/ciarp2017/)
    1. [Hand Posture Recognition Using Convolutional Neural Network](https://link.springer.com/chapter/10.1007/978-3-319-75193-1_53)
11. [RTWH Fingerspelling dataset](http://www-i6.informatik.rwth-aachen.de/aslr/fingerspelling.php)
  1. [ Modeling Image Variability in Appearance-Based Gesture Recognition. In ECCV Workshop on Statistical Methods in Multi-Image and Video Processing](https://www-i6.informatik.rwth-aachen.de/publications/download/29/Dreuw-ECCV-SMVP-2006.pdf)
12. [Indian Kinect](https://www.ias.ac.in/article/fulltext/sadh/041/02/0161-0182) [github](https://github.com/zafar142007/Gesture-Recognition-for-Indian-Sign-Language-using-Kinect)
  1. [Nearest neighbour classification of Indian sign language gestures using kinect camera](https://www.ias.ac.in/article/fulltext/sadh/041/02/0161-0182) 2016, Ansari and Harit
13. [Arabic Alphabets Sign Language Dataset (ArASL)](https://data.mendeley.com/datasets/y7pckrw6z2/1) 
  1. [Arabic Alphabet and Numbers Sign Language Recognition](https://www.researchgate.net/publication/285755274_Arabic_Alphabet_and_Numbers_Sign_Language_Recognition)


