    ; Escribir un programa que cuente la cantidad de veces que se presiona la tecla F10

;1) Configurar el PIC para asociar la tecla F10 a una subrutina
; 1.0) Elegir un id o indice de interrupcion para el f10
; 1.1) Configurar el registro IMR del PIC
; 1.2) Configurar el registro INT0 (F10) del PIC
; 1.3) Poner la dir de la subrutina en vector de interrupciones

;2) Escribir la subrutina que cuente 1 cada vez que se ejecuta

ID EQU 4
IMR EQU 21h
EOI EQU 20h
INT0 EQU 24h

org 1000h
cantidad dw 0

org 2000h
;1.1 IMR = 1111 1111 todo deshabilitado
mov al, 1111 1110b
out IMR,al

;1.2
mov al,ID; id de interrupcion
out INT0,al

;1.3
mov bx,16
mov [bx], atenderf10

loop: jmp loop

hlt
end

org 3000h
atenderf10:inc cantidad
		   mov al,20h
		   out EOI,al
		   iret
