;escribir un programa que muestre en pantalla
; un mensaje cada 2 segundos. El programa nunca termina.
org 1000h
mensaje db "hola"
fin db ?


org 3500h
imprimir: mov bx, offset mensaje
          mov al, offset fin - offset mensaje; 4
          int 7

		  mov al, 20h
		  out EOI, al
		  
		  iret
		  
org 32; 8*4
dir_imprimir dw imprimir

EOI equ 20h
IMR equ 21h
INT1 equ 25h
COMP equ 10h
CONT equ 11h		  

org 2000h
cli
; configuro el PIC
mov al,11111101b
out IMR,al
mov al,8
out INT1,al
; configuro el timer
mov al, 0
out CONT, al
mov al,30
out COMP,al
sti

; while imprimio == false
loop: jmp loop

end