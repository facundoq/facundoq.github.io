; Escribir un programa que imprima el string "hola" cada 30.

imr equ 21h
idtimer equ 4
int1 equ 25h
eoi equ 20h

comp equ 11h
cont equ 10h

org 1500h
mensaje db "Hola"


; configurar el vector de interrupciones
org 16
dirprint30 dw print30

org 2000h
cli
;configurar el PIC 

;configuro el IMR
mov al, 11111101b ;FDh
out imr, al

;Configurando en int1
mov al,idtimer
out int1, al

; configuro el timer
mov al,0
out cont, al

mov al,30
out comp,al

sti

loop: jmp loop

int 0; hlt


org 3000h
print30: mov bx, offset mensaje
		mov al,4
		int 7
		; reseteo el CONT a 0
		mov al,0
		out cont,al
		
         ; pasar el valor 20h al reg EOI
		 mov al,20h
		 out eoi,al
         iret
		 
end
