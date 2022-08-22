org 1000h
; Juego Adivina el caracter
car_adivinar db "h"
car db ?
msjfallo db "oops! adivina de nuevo"
nl2 db 13
msjfin db "Ganaste!"
msjinicio db "Adivina el caracter"
nl1 db 13
nada db ?
org 2000h

mov ah,car_adivinar

mov bx, offset msjinicio
mov al, offset nada - offset msjinicio
int 7

loop: mov bx,offset car
      int 6
      cmp ah,car
      jz fin
      mov al, offset msjfin-offset msjfallo
      mov bx, offset msjfallo
      int 7
      jmp loop
      
      
fin: mov bx, offset msjfin
     mov al,offset msjinicio-offset msjfin
     int 7
     ;preguntar el char
     ;comparar con car
     ;si es igual salir
     ;sino volver



hlt
end
