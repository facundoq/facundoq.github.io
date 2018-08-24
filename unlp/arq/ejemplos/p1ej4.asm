;Escribir un programa para multiplicar dos números
;La multiplicacion se debe hacer en una subrutina
; Los valores a multiplicar se pasan por registro y por valor
; El valor a devolver se pasa registro y por  referencia

org 1000h
n1: dw 4
n2: dw 3
res: dw ?


org 2000h
mov dx, n1
mov cx, n2
mov bx, offset res
call  multiplicar
hlt


org 3000h
multiplicar:mov ax,0
			loop:dec cx; sub cx,1
				 add ax,dx
				 cmp cx, 0
				 jnz loop
			mov [bx],ax
			ret
end
