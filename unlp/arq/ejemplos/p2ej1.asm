;int 7: escribe un string en pantalla
;Imprimir el string "Hola a todos" en pantalla

org 1000h
mensaje db "hola a todos"; 1000h
fin db ? ; 1004h

org 2000h

mov bx, offset mensaje+50 ; dir de comienzo del string en bx
mov al, 7; # de chars en al
int 7; imprime en pantalla

int 0
end