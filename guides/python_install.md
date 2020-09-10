---
title: Instalación de Python/Numpy/Tensorflow
---


# Python
-------------------------------------------
## Versiones de Python

Actualmente hay dos versiones de python, la 2.x (al momento de escribir esto, la última es la 2.7) y la 3.x (la última es la 3.6).

Las versiones 3.x han introducido cambios que hacen que el código no sea compatible con las versiones 2.x.

Para este curso, todo el código utilizará la versión de python 2.7.

## Instalación de Python
### Windows

Si estás en Windows, te recomendamos instalar Anaconda, (la versión con Python 3.7+) que ya tiene todas las librerías que vamos a usar instalados.

Cuando instalás Anaconda, te dan la opción de agregar Anaconda a la variable PATH o no hacerlo. Si lo hacés, vas a poder usar el Python de Anaconda desde cualquier terminal. Si no lo hacés, solo podrás usarlo desde el "Anaconda Prompt" que se instala con Anaconda. La primera opción es más simple pero puede traer problemas si tenías otras versiones de Python instaladas

También podés instalar Python aparte e instalar las librerías a mano, pero en Windows es un poco más complicado.

### Linux

En Linux también se puede utilizar Anaconda. Si instalás Anaconda y ya tenías Python instalado, cuidado porque es posible que cuando ejecutes python estés haciendo referencia al python viejo y no al nuevo que trae Anaconda.

Pero seguramente es mejor utilizar el paquete python que te provea tu distribución.

En el caso de distribuciones basadas en Debian o Ubuntu, podés instalar Python 3 con:

sudo apt-get install python python-pip ipython
pip install --upgrade pip

Luego, podés usar pip para instalar los paquetes necesarios con el comando:

pip3 install jupyter matplotlib numpy

Es posible que tengas que agregar al PATH la ruta de jupyter, con el comando

export PATH=$PATH:~/.local/bin/

(podés agregar esa línea al archivo .bashrc para que se haga automáticamente cuando iniciás tu sistema)


## Verificar la instalación (windows o linux)

Podés verificar la instalacion y qué versión de Python tenés instalado ejecutando python --version en la consola. Si usás Windows, deberás abrir el programa "Anaconda Prompt" que te da una consola donde se ha agregado python al path.

Para verificar que los paquetes necesarios estén instalados, ejecuta python. Debería abrirse la consola de Python y aparecer un mensaje similar al siguiente:

````
Python 2.7.3 (default, Nov 17 2016, 01:08:31)
[GCC 4.8.4] on linux
Type "help", "copyright", "credits" or "license" for more information.
````

Luego ejecuta, dentro de la consola de python, los comandos:

````
>>>import numpy
>>>import matplotlib
````
Si ambos funcionan (no generan error), quiere decir que han sido instalados correctamente.

