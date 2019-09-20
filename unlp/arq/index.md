---
title: Arquitectura de Computadoras 2019
header: Arquitectura de Computadoras 2019
---

# Link al simulador VonSim. Solo para práctica 1 y ejercicios con interrupciones por software de la práctica 2.
[VonSim (beta)](https://vonsim.github.io/)

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
    * [Subrutina de Multiplicación. Parámetros de entrada por valor y registros. Parámetros de salida por referencia y pila.](ejemplos/p1ej6.asm)
    * [Subrutina para rotar a la derecha.](ejemplos/p1ej7.asm)
*   P2: Interrupciones
    * Apuntes
        *   [P2 Entrada salida y e interrupciones](clases/clase2.ppt)
        *   [P2 interrupciones por hardware](clases/clase2.pdf)
        *   [P2 Apunte Completo sobre interrupciones en MSX88](apuntes/interrupciones.pdf)
        *   [P2 Entrada salida y e interrupciones (alternativa)](clases/clase2alternativa.ppt)
    * Ejemplos
        * [Leer un string de 5 caracteres y imprimirlo (int 6 e int 7)](ejemplos/p2ej1.asm)
        * [Imprimir los dígitos de 0 al 9 (int 6 e int 7)](ejemplos/p2ej2.asm)
        * [Juego "Adivina la letra". (int 6 e int 7)](ejemplos/p2ej3.asm)
        * [Contar la cantidad de veces que se presiona F10](ejemplos/p2ej4.asm)
        * [Contar la cantidad de veces que se presiona F10 y terminar a las 10](ejemplos/p2ej5.asm)
        * [Imprimir el texto "Hola" cada un segundo, para siempre.](ejemplos/p2ej6.asm)
        * [Imprimir el texto "Hola" a los 20 segundos de comenzado el programa, y luego terminar.](ejemplos/p2ej7.asm)
* P3
    * Apuntes
        *   [P3 Dispositivos (parte 1)](clases/clase3-1.ppt)
        *   [P3 Dispositivos (parte 2)](clases/clase3-2.ppt)
        *   [USART](apuntes/usart.pdf)
    * Ejemplos
      * [Setear los leds a una configuración](ejemplos/p3ej1.asm)
      * [Mostrar todos los patrones de led posibles](ejemplos/p3ej2.asm)
      * [Leer el valor de las llaves como una contraseña hasta que el usuario la adivine](ejemplos/p3ej3.asm)
      * [Imprimir el string "hola" en la impresora a través del PIO](ejemplos/p3ej4.asm)
      * [Imprimir un string en la impresora a través del handshake en modo consulta  de estado o polling](ejemplos/p3ej5.asm)
      * [Imprimir un string en la impresora a través del handshake en modo interrupciones](ejemplos/p3ej6.asm)
      * [Bits y valores del IRR e ISR](ejemplos/p3_irr_isr.asm)
      * [Imprimir el string "Hola" en la impresora utilizando el USART en modo DTR](ejemplos/p3_usart_dtr.asm)
      * [Imprimir el string "hola" en la impresora utilizando el USART en modo XON/XOFF](ejemplos/p3_usart_xon.asm)
* Repaso



### WinMIPS

*   P4
    *   [P4 Programación básica \- pipeline (parte 1)](clases/clase4-1.ppt)
    *   [P4 Programación básica \- pipeline (parte 2)](clases/clase4-2.ppt)
    *   [P4 Programación básica \- (alternativa)](clases/clase4alternativa.ppt)
    * Ejemplos
*   P5
    *   [P5 Punto flotante (parte 1)](clases/clase5-1.ppt)
    *   [P5 Punto flotante (parte 2)](clases/clase5-2.ppt)
    * Ejemplos
*   P6
    * [P6 Entrada/salida](clases/clase6.ppt)
    * Ejemplos
* Repaso




Otros enlaces de interés
------------------------

*   [Material del año 2017](2017/index.html)
*   [Material del año 2018](2018/index.html)
*   [Página de Arquitectura de Computadoras UNLP](http://weblidi.info.unlp.edu.ar/catedras/arquitecturaP2003/)
*   [Cronograma 2019](http://weblidi.info.unlp.edu.ar/catedras/arquitecturap2003/cronograma%20ARQ%202019.pdf)
