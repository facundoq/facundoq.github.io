; imprimir un carácter en la impresora a través del HAND por interrupciones
DATO equ 40h
ESTADO equ 41h

EOI equ 20h
IMR equ 21h
INT2 equ 26h


org 1000h
c db "b"
imprimio db 0

org 3000h
; mandar el carácter
imprimir:mov al, c
		out DATO,al
		mov imprimio,1
		mov al,20h
		out EOI, al
		iret

org 40
dw imprimir


org 2000h
; configuro el hand en modo interrupciones
in al, ESTADO
or al,10000000b
out ESTADO,al

cli
; desenmascaro las interrupciones de la linea INT2
mov al,11111011b
out IMR, al
;setear el id de interrupcion para la linea INT2
mov al,10
out INT2,al
sti

loop:cmp imprimio,1 
     jnz loop

in al, ESTADO
and al,01111111b
out ESTADO,al

hlt
end