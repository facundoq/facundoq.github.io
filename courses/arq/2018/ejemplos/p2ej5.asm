; Hacer un programa que lea un string terminado en x
; Luego debe imprimirlo

org 1000h
laequis db "x"
mensaje db ?

org 2000h
mov al,0 ;contador de cuantos chars leimos
mov cl, laequis
mov bx, offset mensaje
lazo: int 6; leo el caracter
	  cmp cl, [bx]
	  jz fin
	  inc al; lo cuento
	  inc bx 
	  jmp lazo

fin: mov bx, offset mensaje
	 ; en al ya está la cantidad de chars
     int 7      
      
	 int 0
	 end
