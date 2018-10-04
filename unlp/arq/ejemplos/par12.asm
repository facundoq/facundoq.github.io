 ; Impresión con el handshake leyendo de teclado el mensaje
 
EOI EQU 20h
IMR EQU 21h
INT2 EQU 26h ; en int2 está conectado el HS

DATO EQU 40h
ESTADO EQU 41h

org 200
asd dw imprimir_char

org 1000h
mensaje db ?


; lee caracteres en "mensaje" hasta que se lea "z"
; devuelve en cl la cantidad de caracteres leidos
org 3800h
leer_mensaje:   mov bx,offset mensaje
				mov cl,0
				mov ch,90 ; 90 = codigo ascii Z
				
      leer_char:int 6
				inc cl
				cmp byte ptr [bx], ch
				jz fin
				inc bx
				jmp leer_char
				
			fin:ret

org 2000h
call leer_mensaje
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