; imprimir un car�cter en la impresora a trav�s del HAND
DATO equ 40h
ESTADO equ 41h

org 1000h
c db "b"

org 2000h

; configuro el hand en modo consulta de estado
in al, ESTADO
and al,01111111b
out ESTADO,al

; esperar a busy == 0

poll: in al,ESTADO
      and al,00000001b
	  jnz poll

; mandar el car�cter
mov al, c
out DATO,al



hlt
end