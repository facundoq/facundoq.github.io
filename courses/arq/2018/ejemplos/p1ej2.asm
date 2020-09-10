;Escribir un programa para multiplicar dos números
;La multiplicacion se debe hacer en una subrutina
; Los valores se pasan por registro y por valor

org 1000h
n1 dw 4
n2 dw 3
res dw ?


org 2000h
mov dx,n1
mov cx,n2
call  multiplicar
mov res,ax
hlt

; Multiplicar recibe los numeros en CX y DX,
;y devuelve el res en AX
org 3000h
multiplicar:mov ax,0

			loop:dec cx; sub cx,1
				 add ax,dx
				 cmp cx, 0
				 jnz loop
			ret


end
