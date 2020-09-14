---
title: Instalación de Python/Numpy/Tensorflow
---


# Python
-------------------------------------------
## Versiones de Python

Actualmente hay dos versiones de python, la 2.x (al momento de escribir esto, la última es la 2.7) y la 3.x (la última es la 3.8). 

Las versiones 3.x han introducido cambios que hacen que el código no sea compatible con las versiones 2.x. Las versiones 2.x ya casi no se utilizan, al menos en el área de Aprendizaje Automático/Visión por Computadoras/Minería de Datos.

## Instalación de Python

### Linux

En Linux también se puede utilizar Anaconda, pero seguramente es mejor utilizar el paquete python que te provea tu distribución.

Recomendamos utilizar un [entorno virtual](https://docs.python.org/es/3/tutorial/venv.html) para instalar las librerías.

En este caso, podés crear un entorno virtual e instalar las librerías con los siguientes comandos ([instrucciones completas](https://itnext.io/how-to-set-up-python-virtual-environment-on-ubuntu-20-04-a2c7a192938d)):

````
pip3 install virtualenvwrapper
mkvirtualenv aap2020
workon aap2020
pip install keras pandas
````

Nota: Si instalás Anaconda en Linux y ya tenías Python instalado, cuidado porque es posible que cuando ejecutes python estés haciendo referencia al python viejo y no al nuevo que trae Anaconda. También debés tener cuidado con no sobreescribir el path


### Windows

Si estás en Windows, te recomendamos instalar Anaconda, (la última versión) que viene con muchísimas librerías que vamos a usar instaladas.

Cuando instalás Anaconda, te dan la opción de agregar Anaconda a la variable PATH o no hacerlo. Si lo hacés, vas a poder usar el Python de Anaconda desde cualquier terminal. Si no lo hacés, solo podrás usarlo desde el "Anaconda Prompt" que se instala con Anaconda. La primera opción es más simple pero puede traer problemas si tenías otras versiones de Python instaladas.

Luego tenés que instalar Keras, para lo cual podrás seguir este [tutorial](https://towardsdatascience.com/https-medium-com-ekapope-v-install-tensorflow-and-keras-using-anaconda-navigator-without-command-line-b0bc41dbd038)


También podés instalar Python aparte e instalar las librerías a mano, pero en Windows es un poco más complicado.

## Verificar la instalación (windows o linux)

Podés verificar la instalacion y qué versión de Python tenés instalado ejecutando python --version en la consola. Si usás Windows, deberás abrir el programa "Anaconda Prompt" que te da una consola donde se ha agregado python al path.

Para verificar que los paquetes necesarios estén instalados, ejecuta python. Debería abrirse la consola de Python y aparecer un mensaje similar al siguiente:

````
Python 3.7.5 (default, Apr 19 2020, 20:18:17) 
[GCC 9.2.1 20191008] on linux
Type "help", "copyright", "credits" or "license" for more information.
````

Luego ejecuta, dentro de la consola de python, los comandos:

````
import numpy
import matplotlib
import keras
````

Si los tres funcionan (no generan error), quiere decir que han sido instalados correctamente. En el caso de `import keras`, deberías ver el mensaje `Using TensorFlow backend.`.

