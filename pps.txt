---
title: Propuestas de PPS para Estudiantes de Ingeniería en Computación
---

# Propuestas de PPS para Estudiantes de Ingeniería en Computación

Contacto: 
Lic. Facundo Quiroga
facundoq@gmail.com


##  Tema 1: VonSim (http://facundoq.github.io/unlp/vonsim/assets/)

VonSim es un simulador similar al MSX88 pero con una interfaz más moderna y amigable. El objetivo de VonSim es proveer una alternativa al simulador MSX88 utilizado en varias cátedras de la Facultad de Informática. Soporta el mismo conjunto de instrucciones del MSX88, con la misma semántica.

La versión actual de VonSim soporta todas las instrucciones del viejo MSX88 salvo por INT, IN y OUT. El objetivo de la PPS consiste principalmente en agregar dicha funcionalidad.

###################

Más detalles:

VonSim está escrito en Scala. Scala es un lenguaje híbrido que soporta programación orientada a objetos y funcional, en una mezcla interesante. VonSim utiliza el proyecto ScalaJS para compilar a Javascript. Por ende, es posible ejecutar VonSim en un navegador, sin necesidad de una máquina virtual de Scala. Además, la aplicación está diseñada para funcionar sin un servidor.

VonSim está compuesto de tres partes principales:
1) Un compilador, que válida y convierte el código del programa a un formato ejecutable.
2) Un simulador, que toma el formato ejecutable del programa y simula su ejecución.
3) Una interfaz web, que permite escribir, compilar y ejecutar un programa, visualizando su ejecución.

A diferencia del MSX88, que es un emulador, VonSim no ejecuta realmente código de máquina, sino que _simula_ su ejecución. No obstante, se genera el código de máquina correspondiente al programa para que pueda ser inspeccionado.

Las tareas a realizar en la PPS consisten en agregar las instrucciones y los dispositivos de entrada-salida (INT, IN, OUT, impresora, leds, llaves, etc), así como dar soporte a las interrupciones. También se deberán realizar algunas mejoras de la interfaz para que 1) se puedan visualizar los dipositivos 2) resulte más simple de usar.

VonSim es software libre, su código se encuentra en https://github.com/facundoq/vonsim.
Estructura del proyecto: https://github.com/facundoq/vonsim/blob/master/doc/index.md
Instrucciones para contribuir: https://github.com/facundoq/vonsim/blob/master/CONTRIBUTING.md

En este proyecto tendrás la posibildad de contribuir a una aplicación pedagógica de utilidad para futuros alumnos de las carreras de computación, informática y sistemas. Asimismo, podrás 

----------------------


## Tema 2: Librería para facilitar la investigación en Reconocimiento de Lengua de Señas

Un 5% de la población mundial es sorda o tiene dificultades auditivas. Las lenguas de señas son utilizadas por sordos en todo el mundo para comunicarse entre sí y con oyentes que las conozcan. No existe una lengua de señas universal, sino que cada país tiene su propia lengua. Los elementos principales para realizar una seña son: a) la forma o configuración en que se ponen las manos b) la posición y el movimiento de las mismas c) las expresiones faciales y otros rasgos no manuales. 

El Reconocimiento de Lengua de Señas es un área que utiliza métodos de Visión por Computadora y Procesamiento de Lenguaje Natural para traducir de la lengua de señas a una lengua escrita como el español. Los avances en esta tecnología tienen dos aplicaciones principales: por un lado, proveer traductores automáticos, y por el otro, facilitar el aprendizaje de las lenguas de señas. 

El objetivo de la PPS es diseñar e implementar una librería para manipular bases de datos de lengua de señas, de modo de facilitar la experimentación con nuevos métodos.

Más detalles:

Para implementar un sistema de Reconocimiento de Lengua de Señas es necesario contar con bases de datos con ejemplos de las señas del lenguaje a reconocer, en forma de videos y/o imágenes. Uno de los principales problemas del área es que hay escasos recursos de este tipo para entrenar modelos de reconocimiento automático.  Dichos recursos son escasos, por un lado, porque las bases de datos suelen tener pocos ejemplos o de mala calidad. Por otro lado, la multiplicidad de lenguajes, sumada a un bajo índice de estandarización de las señas. Por último, al existir diversas lenguas de señas, hay múltiples bases de datos, cada una de una lengua distinta. 

Para evaluar un sistema/método de Reconocimiento de Lengua de Señas, idealmente se debería probar en todas las bases de datos disponibles. Debido a la regionalización de las lenguas, en general cada investigador prueba solamente en una base de datos propia/local y a lo sumo en otra externa. En vista de esta situación, sería de utilidad contar con una librería para facilitar la experimentación con dichas bases de datos, de modo de evaluar los métodos más conocidos y efectivos de reconocimiento con todas las bases. En nuestro grupo de investigación hemos recopilado la información de las bases de datos conocidas (http://facundoq.github.io/unlp/sign_language_datasets/). También grabamos las primeras bases de datos de lengua de señas argentina orientadas a la investigación (http://facundoq.github.io/unlp/lsa16/index.html, http://facundoq.github.io/unlp/lsa64/index.html)

El objetivo de esta PPS es:
1) _Diseñar_ e _implementar_ una librería que facilite el proceso de descargar, preprocesar, visualizar y experimentar con las bases de datos conocidas del área. En particular, se hara énfasis en las bases de datos de formas o configuraciones de manos.
2) Evaluar los métodos más conocidos del estado del arte en el reconocimiento o clasificación de formas de manos, utilizando todas las bases de datos.



