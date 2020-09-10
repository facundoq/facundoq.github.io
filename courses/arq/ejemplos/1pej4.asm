1) ¿Qué se transfiere al IP (y desde donde) cuando se
 ejecuta la instrucción RET?
 Se transfiere desde la pila la dirección de retorno
 
 2) ¿Qué se transfiere a la pila cuando se
 ejecuta la instrucción CALL?
 Se transfiere la dirección de retorno (la dir de la siguiente instrucción)
 
 3) Si el registro SP =20 y ejecuto
 
 push ax; -2 => 18
 push ax; -2 => 16
 pop cx;  +2 => 18
 
 ¿Cual es el valor de SP ahora?
 
 4) Si el registro SP =30 y ejecuto
 
 push ax; -2 => 18
 push ax; -2 => 16
 call subrutina; -2+2 => 16
 pop cx
 
 5) Cuando ocurre una interrupción por hardware, se llama a la subrutina de la interrupción: en este caso ¿qué datos se guardan en la pila?
 a) LA dirección de retorno (de donde sea que fue interrumpido el programa)
 b) Los flags
 
5a) Si SP = 30 antes de la interrupción, cuando comienza a ejecutarse la subrutina de interrupción SP vale?
Rta = 26 

6) Cuando termina una interrupción, se debe ejecutar iret y no ret ¿por qué es eso?
Para restaurar la dirección de retorno y también los flags (al Sp se le suma 4 con iret)


