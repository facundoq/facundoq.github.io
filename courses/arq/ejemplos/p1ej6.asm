; Multiplicar dos numeros almacenados en la memoria y guardar el resultado en otra variable en la memoria. Utilizar una subrutina para la multiplicaciÃ³n. El pasaje es por valor y por registro, y el resultado se devuelve por referencia pasada a través de la pila.

org 1000h
num1 dw 5
num2 dw 3
res dw ?

; Recibe dos numeros en AX y CX, 
;y la direccion donde poner el resultado por la pila

org 3500h
mul:push dx 
	mov dx,0
	loop: add dx,ax
		   dec cx
		   jnz loop
	mov bx,sp
	add bx,2
	;mov bx,[bx] equivalente a las dos lineas siguientes
	mov ax,[bx]; AX = dir memoria 1004
	mov bx,ax; BX = dir memoria 1004
	mov [bx],dx; guardo el resultado en la dir pasada por la pila
	pop dx
	ret

org 2000h
mov ax, num1
mov cx, num2
mov dx,offset res
push dx
call mul
pop ax
hlt
end

