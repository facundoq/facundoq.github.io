; Multiplicar dos numeros almacenados en la memoria y guardar el resultado en otra variable en la memoria. Utilizar una subrutina para la multiplicación. El pasaje de parametros es por valor y por registro, y el resultado se devuelve por referencia a través del registro dx.

org 1000h
num1 dw 5
num2 dw 3
res dw ?

; Recibe dos numeros en AX y CX, y
; devuelve el resultado en la direccion de DX
org 3500h
mul: mov bx,dx;preservo la dir del resultado en bx
	 mov dx,0
	 loop: add dx,ax
		   dec cx
		   jnz loop
	mov [bx],dx
	ret

org 2000h
mov ax, num1
mov cx, num2
mov dx, offset res
call mul

hlt
end

