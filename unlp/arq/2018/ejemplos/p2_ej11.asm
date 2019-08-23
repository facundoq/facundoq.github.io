; Solución de parte del ej 11 de la practica 2
; Falta la interrupción del F10


org 1000h
letra db 'a'
cod_a db 'a'
cod_z db 'z'
termino db 0

org 2000h

; configurar la interrupcion del f10

; pongo en cl el código ascii de la letra 'z'
mov cl, cod_z
mov ch, cod_a
loop:    inc letra ; cambio de letra
	     cmp letra,cl ; si llegue a una 'z'
	     jnz no_es_z
	     mov letra,ch ; pongo una 'a'
no_es_z: cmp termino,0; si termino
		 jz loop
	  
; Imprimo la letra
mov bx,offset letra
mov al,1
int 7
	  
