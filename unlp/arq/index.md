---
title: Arquitectura de Computadoras 2018
header: Arquitectura de Computadoras 2018
---

# Diapositivas y ejemplos de las explicaciones prácticas
-------------------------------------------

IMPORTANTE: El siguiente material sólo sirve como una guía para repasar lo dado en las clases prácticas y puede contener errores u omisiones. NO es [material OFICIAL de la cátedra](http://weblidi.info.unlp.edu.ar/catedras/arquitecturaP2003/) y no reemplaza la explicación que se realiza en las clases.

### MSX88

*   [P1 Pasaje de parámetros](clases/clase1.ppt)
    * [Multiplicación](ejemplos/p1ej1.asm)
    * [Subrutina de Multiplicación. Pasaje por registros y por valor.](ejemplos/p1ej2.asm)
    * [Subrutina de Multiplicación. Pasaje por registros. Parámetros de entrada por referencia, de salida por valor.](ejemplos/p1ej3.asm)
    * [Subrutina de Multiplicación. Pasaje por registros. Parámetros de entrada por valor, de salida por referencia.](ejemplos/p1ej4.asm)
    * [Subrutina de Multiplicación. Parámetros de entrada por valor y pila, de salida por valor y registro.](ejemplos/p1ej5.asm)
    * [Subrutina de Multiplicación. Parámetros de entrada por valor y pila, de salida por registro y pila.](ejemplos/p1ej6.asm)
*   P2: Interrupciones
    * Apuntes
        *   [P2 Entrada salida y e interrupciones](clases/clase2.ppt)
        *   [P2 interrupciones por hardware](clases/clase2.pdf)
        *   [P2 Apunte Completo sobre interrupciones en MSX88](apuntes/interrupciones.pdf)
        *   [P2 Entrada salida y e interrupciones (alternativa)](clases/clase2alternativa.ppt)
    * Ejemplos
        * [Impresión de un string por pantalla (int 7)](ejemplos/p2ej1.asm)
        * [Impresión de dos strings por pantalla (int 7)](ejemplos/p2ej2.asm)
        * [Impresión de dos strings por pantalla (versión alternativa) (int 7)](ejemplos/p2ej2alternativa.asm)
        * [Impresión de un caracter (string de longitud 1) por pantalla (int 7)](ejemplos/p2ej3.asm)
        * [Lectura de un caracter (e impresión en pantalla) (int 6, int 7)](ejemplos/p2ej4.asm)
        * [Lectura de un string terminado en 'x' (e impresión en pantalla) (int 6, int 7)](ejemplos/p2ej5.asm)
        * [Imprimir el string "hola" luego de 30 segundos](ejemplos/p2ej6.asm)
        * [Imprimir el string "hola" _cada_ 30 segundos](ejemplos/p2ej7.asm)
        * [Parte de la solución del ejercicio 11 de la práctica 2.](ejemplos/p2_ej11.asm)
* P3
    * Apuntes
        *   [P3 Dispositivos (parte 1)](clases/clase3-1.ppt)
        *   [P3 Dispositivos (parte 2)](clases/clase3-2.ppt)
    * Ejemplos
      * [Configuración de una vez de las Luces](ejemplos/p3ej1.asm)
      * [Contador con Luces](ejemplos/p3ej2.asm)
      * [Control de las Luces con las Llaves ](ejemplos/p3ej3.asm)
      * [Control de las Luces con las Llaves. Termina si se prenden todas las luces ](ejemplos/p3ej4.asm)
      * [Control de ingreso con una contraseña tipo valija mediante las Llaves. ](ejemplos/p3ej5.asm)
      * [Impresión de un string en la impresora a través del PIO](ejemplos/p3ej6.asm)
      * [Impresión de un string en la impresora a través del HAND en modo consulta de estado ](ejemplos/p3ej7.asm)
      * [Impresión de un string en la impresora a través del HAND en modo interrupciones ](ejemplos/p3ej8.asm)
      * [Impresión de un string en la impresora a través del USART con DTR y consulta de estado ](ejemplos/p3ej9.asm)
* Repaso
    * [Impresión de un string en pantalla, cada un segundo durante 30 segundos. El f10 se pausa/reanuda.](ejemplos/p3ej10.asm)
    * Ejercicios de parcial:
        * [1](ejemplos/par1.asm)
        * [2](ejemplos/par2.asm)
        * [3](ejemplos/par3.asm)
        * [4](ejemplos/par4.asm)
        * [5](ejemplos/par5.asm)
        * [6](ejemplos/par6.asm)
        * [7](ejemplos/par7.asm)
        * [8](ejemplos/par8.asm)
        * [9](ejemplos/par9.asm)
        * [10](ejemplos/par10.asm)
        * [11](ejemplos/par11.asm)
        * [12](ejemplos/par12.asm)


### WinMIPS

*   P4
    *   [P4 Programación básica \- pipeline (parte 1)](clases/clase4-1.ppt)
    *   [P4 Programación básica \- pipeline (parte 2)](clases/clase4-2.ppt)
    *   [P4 Programación básica \- (alternativa)](clases/clase4alternativa.ppt)
*   P5
    *   [P5 Punto flotante (parte 1)](clases/clase5-1.ppt)
    *   [P5 Punto flotante (parte 2)](clases/clase5-2.ppt)
    * Ejemplos
		* [Conversión de entero a flotante](ejemplos/p5ej2.s)
		* [Conversión de flotante a entero](ejemplos/p5ej3.s)
    * [Atasco WAW](ejemplos/p5waw.s)
    * [Atasco WAR](ejemplos/p5war.s)
    * [Conversión de un string a mayúscula (subrutinas/convencion/pila)](ejemplos/p5ej4.s)
*   P6
    *   [P6 Entrada/salida](clases/clase6.ppt)
    *   [Imprimir un numero positivo, un número negativo y uno flotante en la pantalla](ejemplos/p6e1.s)
    * [Imprima "Hola" en pantalla](ejemplos/p6e2.s)
    * [Leer dos numeros enteros de teclado e imprimir la suma](ejemplos/p6e3.s)
    * [Leer un string de 10 caracteres y después imprimirlo](ejemplos/p6e4.s)
    * [Pintar el pixel (x=25,y=40) de color azul (sólo con registros)](ejemplos/p6e5.s)
    * [Pintar el pixel (x=25,y=40) de color azul (con variables)](ejemplos/p6e6.s)
  * Ejercicios de parcial
    * [Posible solución del Tema 1 de la primera fecha del segundo parcial](ejemplos/p2f1_tema1.s)



Otros enlaces de interés
------------------------

*   [Material del año 2017](2017/index.html)
*   [Página de Arquitectura de Computadoras UNLP](http://weblidi.info.unlp.edu.ar/catedras/arquitecturaP2003/)
*   [Cronograma 2018](http://weblidi.info.unlp.edu.ar/catedras/arquitecturap2003)
