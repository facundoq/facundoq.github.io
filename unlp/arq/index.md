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
    * Auto-evaluaciones
        * [Repaso general](https://kahoot.it/challenge/0849538)
    * Ejercicios de parcial del 2018
      * [ej1](ejemplos/1pej1.asm)
      * [ej2](ejemplos/1pej2.asm)
      * [ej3](ejemplos/1pej3.asm)
      * [ej4](ejemplos/1pej4.asm)
      * [ej7 - Completar el código ](ejemplos/1pej7.asm)
      * [ej9 - Implementación del juego "Cofre del Tesoro"](ejemplos/1pej9.asm)




### WinMIPS

*   P4
    *   [P4 Programación básica \- pipeline (parte 1)](clases/clase4-1.ppt)
    *   [P4 Programación básica \- pipeline (parte 2)](clases/clase4-2.ppt)
    *   [P4 Programación básica \- (alternativa)](clases/clase4alternativa.ppt)     

    * Ejemplos
        * [Direcciones de memoria y variables](ejemplos/p4e0.s)
        * [Sumar y multiplicar dos valores](ejemplos/p4e1.s)
        * [Calcular (a+4)*3](ejemplos/p4e2.s)
        * [Sumar elementos de un vector sin saltos ](ejemplos/p4e3.s)
        * [Sumar elementos de un vector con saltos ](ejemplos/p4e4.s)
        * [Máximo entre dos variables ](ejemplos/p4e5.s)
        * [ Generar un vector de 5 elementos ](ejemplos/p4e6.s)
        * [Multiplicar por dos los elementos del un vector ](ejemplos/p4e7.s)
        * [Generar un nuevo vector a partir de uno existente ](ejemplos/p4e8.s)
        * [Modificar los elementos de un vector mayores a 10 ](ejemplos/p4e9.s)
        * [Calcular la suma de los valores de un vector utilizando un registro como puntero](ejemplos/p4e10.s)
*   P5
    *   [P5 Punto Flotante](clases/clase5-1.ppt)
    *   [P5 Convención de código y pila](clases/clase5-2.ppt)
    * Ejemplos
        * [Intercambiar valores de registros con la pila](ejemplos/p5e1.s)
        * [Programa con dos subrutinas](ejemplos/p5e2.s)
        * [Programa con dos subrutinas y convención](ejemplos/p5e3.s)
        * [Pasar a mayúsculas un string con 2 subrutinas](ejemplos/p5e4.s)
        * [Pasar a mayúsculas un string con 2 subrutinas con manejo alternativo de la pila](ejemplos/p5e5.s)
        * [Atasco WAR](ejemplos/p5e6.s)
        * [Atasco WAW](ejemplos/p5e8.s)
        * [Convertir un vector de números enteros a PF](ejemplos/p5e7.s)
        * [Comparar dos números de punto flotante e imprimir en base al resultado](ejemplos/p5e9.s)
*   P6
    * [P6 Entrada/salida](clases/clase6.ppt)
    * Ejemplos
        * [Imprimir un entero sin signo en la pantalla (codigo 1)](ejemplos/p6e1.s)
        * [Imprimir un entero con signo en la pantalla (codigo 2)](ejemplos/p6e2.s)
        * [Imprimir un flotante en la pantalla (codigo 3)](ejemplos/p6e3.s)
        * [Imprimir un string en la pantalla (codigo 4)](ejemplos/p6e4.s)
        * [Leer un número desde teclado (codigo 8)](ejemplos/p6e5.s)
        * [Leer un string desde teclado (leyendo varios caracteres) (codigo 9)](ejemplos/p6e6.s)
        * [Pintar un pixel en la pantalla gráfica](ejemplos/p6e8.s)
* Autoevaluaciones
    * [P4 - Instrucciones WinMIPS](https://kahoot.it/challenge/0668157)
    * [P4 - Acceso a memoria y saltos](https://kahoot.it/challenge/0981011)
    * [P4 - Pipeline y Atascos](https://kahoot.it/challenge/0252924)
    * [P5 -PF y notación](https://kahoot.it/challenge/0487430)
    * [P6 -Entrada salida](https://kahoot.it/challenge/0802848)
    *
* Repaso
    * [Offset en WinMIPS ](ejemplos/offset.s)
    * [Ejercicio tipo parcial - Leer números y crear vector](ejemplos/parcial2e1.s)
    * [Ejercicio tipo parcial - Calculos en PF con vectores](ejemplos/parcial2e2.s)
    * [Calcular el valor con y sin delay slot](ejemplos/parcial2e3.s)
    * [Calcular CPI en un código chico](ejemplos/parcial2e4.s)
    * [Ejemplo de atascos estructurales con punto flotante.](ejemplos/parcial2e5.s)



# Otros enlaces de interés
------------------------

*   [Material del año 2017](2017/index.html)
*   [Material del año 2018](2018/index.html)
*   [Página de Arquitectura de Computadoras UNLP](http://weblidi.info.unlp.edu.ar/catedras/arquitecturaP2003/)
*   [Cronograma 2019](http://weblidi.info.unlp.edu.ar/catedras/arquitecturap2003/cronograma%20ARQ%202019.pdf)
