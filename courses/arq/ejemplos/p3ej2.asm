; hacer un programa que ponga las luces en
; 00000000
; 00000001
; 00000010
; 00000011
..
; 11111110
; 11111111

; 00011001
; 30H - PA => Llaves
; 31H - PB => Luces
; 32H - CA
; 33H - CB

PB equ 31h
CB equ 33h

org 2000h
mov al, 0  ;0000 0000b
out CB,al

mov al, 0
loop:out PB, al
	 inc al
	 cmp al,0
	 jnz loop

hlt
end
