; hacer un programa que ponga las luces prendidas como:
; 00011001
; 30H - PA => Llaves
; 31H - PB => Luces
; 32H - CA
; 33H - CB

PB equ 31h
CB equ 33h

org 2000h
mov al, 0FFh  ;0000 0000b
out CB,al

mov al, 19h ;00011001
out PB, al

hlt
end
