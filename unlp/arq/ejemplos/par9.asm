; Configurar el PIO para imprimir con la impresora
CA equ 32h
CB equ 33h
; Configurar CA: 0 = salida, 1 = entrada
mov al, 00000001 ; XXXXXXX01
out CA, al
; Configurar CB: 00000000 todos salida
mov al, 0
out CB, al


; Configurar el HAND para imprimir por consulta de estado
DATO equ 40h
ESTADO equ 41h

in al, ESTADO
and al, 01111111 ; cambio el bit 7 a 0
out ESTADO, al

; Configurar el HAND para imprimir por consulta de estado
DATO equ 40h
ESTADO equ 41h

in al, ESTADO
and al, 01111111b ; cambio el bit 7 a 0
out ESTADO, al

; Configurar el HAND para imprimir por interrupciones
DATO equ 40h
ESTADO equ 41h

in al, ESTADO
or al, 10000000 ; cambio el bit 7 a 1
out ESTADO, al


; Asumiendo que el CA/PA están bien configurados, poner el STROBE en 0, y luego en 1

in al,PA
and al,11111101b
out PA, al

in al,PA
or al,00000010b
out PA, al


;Asumiendo que el PA está bien configurado, escribir código para esperar que la impresora este libre (busy=0), usando el PIO

poll:in al, PA
	 and al, 00000001b
	 jnz poll

;Asumiendo que ESTADO está bien configurado, escribir código para esperar que la impresora este libre (busy=0) usando el HAND

poll:in al, ESTADO
	 and al, 00000001b
	 jnz poll

;mandar un caracter a través del PIO a la impresora. Asumir que está configurado PB/CB
org 1000h
char db "a"

mov al,char
out PB,al

; además debería poner strobe=1 y luego strobe=0

;mandar un caracter a través del HAND a la impresora. Asumir que está configurado ESTADO
org 1000h
char db "a"

mov al,char
out DATO,al
; NO tengo mandar el strobe 	 