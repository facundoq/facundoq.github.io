llamar a la subrutina CALCULO pasando DATO1 y DATO2 por valor y RESULT como parametro por referencia a través de la pila

org 1000h
dato1 dw 100
dato2 dw 200
result dw ?

org 20000h
mov ax, dato1
mov bx,dato2
mov cx, offset result
push cx
push bx
push ax
call CALCULO
