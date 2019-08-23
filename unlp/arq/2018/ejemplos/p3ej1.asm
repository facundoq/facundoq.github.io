; Prender los primeros 4 leds, apagar el resto

CB equ 33h
PB equ 31h

org 2000h
;Configuramos el PIO
; Configurar C  como todo de salida (00000000)
mov al,0
out CB,al

mov al,F0h; 11110000b
out PB,al

int 0
end