org 1000h
; variables here
msj db ?

org 2000h

mov bx, offset msj
mov cx,5

leer:int 6
     inc bx
     dec cx
     jnz leer

mov bx, offset msj
mov al,5
int 7

hlt
end
