; Escriba un programa que imprima el texto "Hola" cada un segundo, para siempre.

; Paso 1:
; id de interrupcion es 8
; la dir en el vector es 8*4=32
COMP equ 10h
CONT equ 11h

EOI equ 20h
IMR equ 21h
INT1 equ 25h

; Paso 5 alternativo
; org 32 (sin el h)
; dw imp_msj

org 1000h
mensaje db "hola"
org 2000h 

;Paso 2: IMR = 1111 1101 
mov al, 11111101b;  FDh
out IMR, al

; Paso 4: INT1 = 8
mov al, 8
out INT1, al

; Paso 5
mov bx,32
mov [bx],imp_msj

; Paso 6
;COMP = 1
mov al, 1
out COMP,al

; CONT = 0
mov al, 0
out CONT,al

loopinf: jmp loopinf

hlt

; Paso 3
org 3000h
imp_msj: mov bx,offset mensaje
		 mov al,4
		 int 7
		 ; reseto el cont a 0
		 mov al,0
		 out CONT,al
		 ; mando 20h al EOI
		 mov al, 20h
		 out EOI,al
		 iret

end
