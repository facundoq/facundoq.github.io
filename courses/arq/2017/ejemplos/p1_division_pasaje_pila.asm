;Programar una subrutina que reciba dos números por valor por la pila,
;y devuelva el resultado en una variable pasada por referencia también
;por la pila. 
;Escriba además el programa principal, con variables a,b,c,
; donde se llame a la subrutina para que c=a/b
 
org 1000h
a dw 17
b dw 5
c dw ?

org 3000h ; AX a, CX b, DX res
dividir: mov bx,sp; bx apunta al tope de la pila
		 add bx,2; le sumo 2 a bx para saltear la dirección de retorno que está en la pila
		         ; con lo cual apunto bx al valor del primer parámetro (a)
		 mov ax,[bx]; ax = a
		 add bx,2; apunto bx al valor del segundo parámetro (b)
		 mov cx,[bx]; cx = b
         add bx,2; apunto bx valor del tercer parámetro, que a su vez es la dirección de memoria de c
		 mov bx,[bx]; bx = offset c
		 
		 mov dx, 0 ; divido, el resultado se almacena en dx
	loop:cmp ax,cx
		 js fin
		 sub ax,cx
		 inc dx
		 jmp loop
	fin: mov [bx],dx; copio el resultado a c
         ret


org 2000h
; apilo los parámetros
mov ax, offset c
push ax
mov ax, b
push ax
mov ax, a
push ax

call dividir

; limpio la pila de los parámetros que ya se usaron
pop ax
pop ax
pop ax

hlt
end
