;Programar una subrutina que reciba dos números por valor por la pila,
;y devuelva el resultado por valor a través de la pila
;Escriba además el programa principal, con variables a,b,c,
; donde se llame a la subrutina para que c=a/b
 
org 1000h
a dw 17
b dw 5
c dw ?

org 3000h ; AX a, CX b, DX res
dividir: mov bx,sp 
		 add bx,2; le sumo 2 a bx para saltear la dirección de retorno que está en la pila
		         ; con lo cual apunto bx al valor del primer  operando (a)
		 mov ax,[bx]; ax = a
		 add bx,2 ; apunto bx al valor del segundo  operando (b)
		 mov cx,[bx]; cx = b
         add bx,2; apunto bx a la parte de la pila donde se escribirá el resultado
		 
		 mov dx, 0 ; divido, el resultado se almacena en dx
	loop:cmp ax,cx 
		 js fin
		 sub ax,cx
		 inc dx
		 jmp loop
	fin: mov [bx],dx; copio el resultado a la pila
         ret


org 2000h
mov ax, 0
push ax
mov ax, b
push ax
mov ax, a
push ax

call dividir

pop ax; limpia la pila
pop ax; limpia la pila

pop ax; obtiene el resultado
mov c,ax; se guarda en c

hlt
end
