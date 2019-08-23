; Multiplicar dos numeros almacenados en la memoria y guardar el resultado en otra variable en la memoria. Utilizar una subrutina para la multiplicación. El pasaje es por valor y por registro, y el resultado se devuelve en el registro DX.

org 1000h
num1 dw 5
num2 dw 3
res dw ?

; Recibe dos numeros en AX y CX, y
; devuelve el resultado en DX
org 3500h
mul: mov dx,0
	 loop: add dx,ax
		   dec cx
		   jnz loop
	ret

org 2000h
mov ax, num1
mov cx, num2
call mul
mov res,dx
hlt
end

