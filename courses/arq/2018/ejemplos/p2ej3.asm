Escribir un programa que imprima el string "z"

org 1000h
mensaje db "z"
fin db ?

org 2000h
mov bx, offset mensaje
mov al, offset fin - offset mensaje
int 7

int 0 
end