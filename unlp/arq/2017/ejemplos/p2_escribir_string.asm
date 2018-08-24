;Escribir el string etiquetado como cadena en pantalla 
org 1000h
cadena db "hola como estas asmdaosdmaso" ; 1000h
fin_cadena db ?  ; 1004h
org 2000h

mov bx, offset cadena
mov al,offset fin_cadena - offset cadena
int 7

int 0 ;hlt
end
