;Escribir un programa para multiplicar dos números
;La multiplicacion se debe hacer en una subrutina
; Los valores a multiplicar se pasan por registro y por ref
; El valor a devolver se pasa por valor
org 1000h
n1: dw 4
n2: dw 3
res: dw ?


org 2000h
mov dx, offset n1
mov cx, offset n2
call  multiplicar
mov res, ax
hlt

org 3000h
multiplicar: mov bx,cx
             mov cx, [bx] ; ahora cx vale 3
			 mov bx, dx
             mov dx, [bx]; ahora dx vale 4
			 ; multiplico como antes
			 mov ax,0
			loop:dec cx; sub cx,1
				 add ax,dx
				 cmp cx, 0
				 jnz loop
			ret
end
