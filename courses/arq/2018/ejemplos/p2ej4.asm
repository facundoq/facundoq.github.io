;Programa que lea un caracter y lo vuelva a imprimir


org 1000h
mensaje db ?

org 2000h
mov bx, offset mensaje
int 6

; no pongo en bx el offset de mensaje pq ya esta
mov al,1
int 7

int 0
end