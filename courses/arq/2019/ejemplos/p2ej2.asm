org 1000h
; imprimir "0" "1" ... "9"
msj db "0"

org 2000h

mov bx, offset msj
mov al,1
mov cx,10

loop: int 7
	inc msj
	dec cx
	jnz loop


hlt
end
