;escriba un programa que imprima el string "hola"
;a traves de la impresora utilizando el HANDSHAKE
; utilizando consulta de estado
;
DATO   EQU 40h
ESTADO EQU 41h

EOI EQU 20h
IMR EQU 21h
INT2 EQU 26h
id EQU 4

org 1000h
dato db "hola"
fin db ?

org 16
dir_imprimir dw imprimir

org 2000h
; configuro en IMR
cli
mov al,11111011b
out IMR, al
; configuro INT2
mov al,id;4
out INT2, al
; configurar el bit INT del HAND en 1
in al,ESTADO
or al, 10000000b
out ESTADO,al
; bx apunta al primer caracter
mov bx, offset dato
sti

esperar: cmp bx,offset fin
		 jnz esperar

int 0

org 3000h
imprimir:; mando a imprimir el char
		 mov al, [bx]
		 out DATO, al
		 ; paso al sig caracter
		 inc bx
		 mov al,20h
		 out EOI,al
		 iret
end






