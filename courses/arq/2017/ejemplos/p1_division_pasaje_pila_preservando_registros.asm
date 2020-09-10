
;Programar una subrutina que reciba dos números por valor por la pila,
;y devuelva el resultado en una variable pasada por referencia también
;por la pila. Preservar los valores de los registros que la subrutina modifica.

;Escriba además el programa principal, con variables a,b,c,
; donde se llame a la subrutina para que c=a/b
 
org 1000h
a dw 17
b dw 5
c dw ?

org 3000h ; AX a, CX b, DX res
dividir: push ax; preservo los 4 registros
         push bx
		 push cx
		 push dx
		 
		 mov bx,sp
		 add bx,10; le agrego 10 a sp; 2 por la dirección de retorno, y 2 por cada registro preservado -> 2+2*4=10
		 
		 mov ax,[bx]
		 add bx,2
		 mov cx,[bx]
         add bx,2
		 mov bx,[bx]
		 
		 mov dx, 0
		 
	loop:cmp ax,cx
		 js fin
		 sub ax,cx
		 inc dx
		 jmp loop
	fin: mov [bx],dx
		
		 ; restauro el valor original de los registros
		 pop dx
		 pop cx
		 pop bx
		 pop ax
         ret


org 2000h
mov ax, offset c
push ax
mov ax, b
push ax
mov ax, a
push ax

call dividir

pop ax
pop ax
pop ax
hlt
end
