 ; Escriba un programa que imprima el texto "Hola" a los 20 segundos de comenzado el programa, y luego termine.

; Paso 1:
; id de interrupcion del TIMER es 8
; la dir en el vector es 8*4=32

; id de interrupcion del F10 es 3
; la dir en el vector es 3*4=12

COMP equ 10h
CONT equ 11h

EOI equ 20h
IMR equ 21h
INT0 equ 24h
INT1 equ 25h

; Paso 5 alternativo
; org 32 (sin el h)
; dw imp_msj

; org 12 (sin el h)
; dw cancelar

org 1000h
mensaje db "hola"
imprimio db 0

org 2000h 

;Paso 2: IMR = 0011 1111 
mov al, 00111111b;  BFh
out IMR, al

; Paso 4: INT1 = 8
mov al, 8
out INT1, al
;INT0 = 3
mov al, 3
out INT0, al

; Paso 5
mov bx,32
mov [bx],imp_msj

mov bx,12
mov [bx],cancelar


; Paso 6
;COMP = 1
mov al, 20
out COMP,al

; CONT = 0
mov al, 0
out CONT,al

loopinf: cmp imprimio,0
		 jz loopinf

hlt

; Paso 3
org 3000h
imp_msj: mov bx,offset mensaje
		 mov al,4
		 int 7
		 ; cambio imprimio
		 mov imprimio,1
		 ; mando 20h al EOI
		 mov al, 20h
		 out EOI,al
		 iret

org 3500h
cancelar: mov imprimio,1
		; mando 20h al EOI
		 mov al, 20h
		 out EOI,al
		 iret
end
