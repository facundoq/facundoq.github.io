; Multiplicar dos numeros almacenados en la memoria y guardar el resultado en otra variable en la memoria. Utilizar una subrutina para la multiplicación. El pasaje de parametros es por referencia y por registro, y el resultado se devuelve en el registro DX.

org 1000h
num1 dw 5
num2 dw 3
res dw ?

; Recibe dos numeros en AX y CX, y
; devuelve el resultado en DX
org 3500h
mul: mov dx,0
	 ; pongo en ax el valor de num1 en lugar de su direccion
	 mov bx,ax
	 mov ax,[bx]
	 ; pongo en ax el valor de num1 en lugar de su direccion
	 mov bx,cx
	 mov cx,[bx]
	 ; multiplicacion
	 loop: add dx,ax
		   dec cx
		   jnz loop
	ret

org 2000h
mov ax, offset num1
mov cx, offset num2
call mul
mov res,dx
hlt
end

