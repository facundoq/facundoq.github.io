; Generar el patr�n de luces 10101010

; Los leds est�n conectados al puerto PB

PB equ 31h
CB equ 33h

org 2000h

mov al,0000000b
out CB, al

mov al,10101010b
out PB,al

hlt
end