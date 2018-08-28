;Escribir un programa para multiplicar dos números
;La multiplicacion se debe hacer en una subrutina
;Los valores a multiplicar se pasan por la pila y por valor
;El valor a devolver se pasa registro y por  valor

org 1000h
n1 dw 4
n2 dw 3
res dw ?


org 2000h
; Ponemos el primer operando en la pila
mov cx, n1
push cx
; Ponemos el segundo operando en la pila
mov dx,n2
push dx
call  multiplicar
mov res,ax
; quitamos los operandos de la pila
pop bx
pop bx
hlt


org 3000h
multiplicar:mov bx,sp ; copiamos a bx la dirección del tope de la pila
						; obtenemos el segundo operando de la pila
						add bx,2
						mov dx,[bx]
						; obtenemos el primer operando de la pila
						add bx,2
						mov cx,[bx]
						; realizamos la multiplicación como las veces anteriores
						mov ax,0
						loop:dec cx; sub cx,1
								 add ax,dx
								 cmp cx, 0
								 jnz loop

						ret
end
