;escriba un programa que imprima el string "hola"
;a traves de la impresora utilizando el PIO


;
PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

org 1000h
dato db "hola"
fin db ?

org 2000h

; configurar PIO

mov al,1; 0000 0001
out ca,al
mov al,0 ; PB como de salida
out cb,al
; inicializo el strobe en 0
in al, PA
and al,11111101b
out PA, al


; imprimir

mov bx, offset dato
;imprimo [bx]

; espero que la impresora tenga busy=0
poll:in al, PA
	 and al,1
	 jnz poll
	 ; mando a imprimir el char
	 mov al, [bx]
	 out PB, al
	 ; mando señal strobe
	 ;S=1
	 in al, PA
	 or al,00000010b
	 out PA, al
	 ;S=0
	 in al, PA
  	 and al,11111101b
	 out PA, al
	 ; paso al sig caracter
	 inc bx
	 cmp bx,offset fin
	 jnz poll
	 
int 0
end






