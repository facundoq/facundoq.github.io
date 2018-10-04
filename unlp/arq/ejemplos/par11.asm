 ; Impresión con el handshake 
 
EOI EQU 20h
IMR EQU 21h
INT2 EQU 26h ; en int2 está conectado el HS

DATO EQU 40h
ESTADO EQU 41h

org 200
asd dw imprimir_char

org 1000h
mensaje db "hola"
fin db ?

org 2000h
mov bx, offset mensaje
; configurar el HAND
in al, ESTADO
or al, 10000000b
out ESTADO, al

; configurar el PIC
cli
;imr
mov al,11111011
out imr,al
; INT2
mov al, 50 ; indice del vector de int en INT2
out int2,al

sti
; esperar a que se imprima todo
mov cl,offset fin-offset mensaje
loop:cmp cl,0
     jnz loop
		

int 0

org 3000h
imprimir_char: mov al,[bx]
			   out  DATO,al
			   inc bx
			   dec cl
              mov al, 20
			  out EOI,al
			  iret
			  
end