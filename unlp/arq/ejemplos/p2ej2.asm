;int 7: escribe un string en pantalla
;Imprimir el string "Hola" 
;y luego el string "Chau" en pantalla

org 1000h
mensaje db "hola"; 1000h
fin db ? ; 1004h
mensaje2 db "chau"
fin2 db ?

org 2000h

mov bx, offset mensaje ; dir de comienzo del string en bx
mov al, offset fin - offset mensaje; # de chars en al
int 7; imprime en pantalla

mov bx, offset mensaje2
mov al, offset fin2 - offset mensaje2
int 7

int 0
end