# LSA16: A Handshape Dataset for the Argentinian Sign Language

This database contains images of 16 handshapes of the Argentinian Sign Language (LSA), each performed 5 times by 10 different subjects, for a total of 800 images. The subjects wore color hand gloves and dark clothes.


## Handshapes

The following table lists the id and name of each handshape, along with a sample.

ID | Name  | Sample | ID | Name  | Sample | ID | Name  | Sample | ID | Name  | Sample |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
01 | Five | ![](files/dataset/1_1_1.png) | 02 | Four | ![](files/dataset/2_1_1.png) | 03 | Horns | ![](files/dataset/3_1_1.png) | 04 | Curve | ![](files/dataset/4_1_1.png) |
05 | Fingers together | ![](files/dataset/5_1_1.png) | 06 | Double | ![](files/dataset/6_1_1.png) | 07 | Hook | ![](files/dataset/7_1_1.png) | 08 | Index | ![](files/dataset/8_1_1.png) |
09 | L | ![](files/dataset/9_1_1.png) | 10 | Flat Hand | ![](files/dataset/10_1_1.png) | 11 | Mitten | ![](files/dataset/11_1_1.png) | 12 | Beak | ![](files/dataset/12_1_1.png) |
13 | Thumb | ![](files/dataset/13_1_1.png) | 14 | Fist | ![](files/dataset/14_1_1.png) | 15 | Telephone | ![](files/dataset/15_1_1.png) | 16 | V | ![](files/dataset/16_1_1.png) |




## Recording

The dataset was recorded in an indoors environment, with artificial lightning.

Subjects wore dark clothes and performed the handshapes standing, with a white wall as a background. To simplify the problem of hand segmentation, subjects wore fluorescent-colored gloves. These substantially simplify the problem of recognizing the position of the hand and performing its segmentation, and remove all issues associated to skin color variations, while fully retaining the difficulty of recognizing the handshape. The subjects performed the same handshape with both hands.

Each handshape was executed imposing few constraints on the subjects to increase diversity and realism in the database. All subjects were non-signers and right-handed, were taught how to perform the handshape during the shooting session by showing them an image of the handshape as performed by one of the authors, and practiced each handshape a few times before recording.

We employed a generic webcam for the recording, with a resolution of 640 by 480.


## Raw version
The raw version of the dataset contains one image for each handshape instance in the dataset. Each image weights 0.33mb on average.

The filename of each image specifies its class, subject, and repetition, in the format CLASS_SUBJECT_REPETITION.png. For example, the image 3_2_4.png corresponds to the 4th repetition of handshape 3 (Horns), as performed by subject 2.

[Raw Version (267mb)](
https://mega.nz/#!hcgQUCAT!WtTSPTO6GuXIXs1BuRJDGburN4FRHBAs9EzRfbd2ra4
)


## Segmented version
We provide a segmented version of the dataset to reduce the overhead of performing experiments with the data. From each image we extracted the only the right hand and segmented it, replacing the background with black pixels. The filename format is the same as in the raw version. We provide only the segmented hand images. The details of how the images were segmented are described in [Handshape recognition for Argentinian Sign Language using ProbSom](http://sedici.unlp.edu.ar/bitstream/handle/10915/52376/Documento_completo.pdf-PDFA.pdf?sequence=1), but we basically used a simple color thresholding + opening + biggest connected component detection pipeline.

[Segmented version (7mb)](
https://mega.nz/#!FF523Qgb!JGkQ3FZZE14_8drPflKL9-9A2nUbaqU6wCUzMh5SOU0
)


## Citing

If you use the dataset in your research, we kindly ask you to cite the article [Handshape recognition for Argentinian Sign Language using ProbSom](http://sedici.unlp.edu.ar/bitstream/handle/10915/52376/Documento_completo.pdf-PDFA.pdf?sequence=1):

```
@Article{Ronchetti2016,
author="Ronchetti, Franco and Quiroga, Facundo and Lanzarini, Laura and Estrebou, Cesar",
title="Handshape Recognition for Argentinian Sign Language using ProbSom",
journal=" Journal of Computer Science and Technology ",
year="2016",
volume="16",
number="1",
pages="1--5",
issn="1666-6038"
}

```


## Samples

Sample images of the dataset.

|:-------------------:|:--------------------:|
| ![](samples/c1.png) | ![](samples/c2.png) |
| ![](samples/c3.png) | ![](samples/c4.png)  |
| ![](samples/c5.png) | ![](samples/c6.png)  |
| ![](samples/c7.png) | ![](samples/c8.png)  |
| ![](samples/c9.png) | ![](samples/c10.png)  |


## License ![Creative commons Attribution-NonCommercial-NoDerivatives 4.0 International License ](https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png)
This work is licensed under a [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License](http://creativecommons.org/licenses/by-nc-nd/4.0/). The dataset is made available strictly for academic purposes. No derivative works or commercial use are allowed. Please contact the authors if you are unsure about what constitutes fair use under this license, or need to use the dataset under a different license.


## Contact



 Facundo Manuel Quiroga
{fquiroga}-at-lidi.info.unlp.edu.ar

[III-LIDI](http://www.lidi.info.unlp.edu.ar/) Informatics Institute
[Informatics Faculty](http://info.unlp.edu.ar/)
[UNLP](http://unlp.edu.ar/)
