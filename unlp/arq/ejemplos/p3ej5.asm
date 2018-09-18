; Escriba un programa que pida una contraseña a través de las llaves
; La contraseña es 00110010
; Cuando el usuario ingresa esta contraseña se muestra el mensaje "Acceso permitido"

PA EQU 30h
CA EQU 32h

org 1000h
contra db 00110010b
mensaje db "Acceso permitido"
fin db ?

org 2000h
; configrar el PIO
; Configuro PA
mov al,11111111b
out CA,al

loop: in al, PA
	  cmp al, contra
	  jnz loop

mov bx,offset mensaje
mov al, offset fin - offset mensaje
int 7	  

int 0
end