; Imprimir el mensaje "Hola" en la impresora a través del USART en modo DTR
; En este modo, la impresora le indica al usart si su buffer está lleno mediante el bit 7 de ESTADO, llamado DSR.

; Recordamos el formato del registro CONTROL/ESTADO (62h) del USART:

; Para configurar (CONTROL):
;bit:  7 6 5 4 3 2 1 0
;reg: |0|1|0|D|0|0|V|0|
; E: Limpiar los flags de error (siempre hacerlo al principio)
; D: Protocolo de operación: 1 para DTR, 0 para XON/XOFF 
; V: Velocidad: 0 para 6 bits por segundo, 1 para 18 bits por segundo
; Los bits que están en 0 o 1 no son relevantes y vamos a dejarlos siempre en ese valor

; Para ver el estado (ESTADO):
;bit:  7 6 5 4 3 2 1 0
;reg: |D| | | | | |R|T|
; D: DSR, estado del buffer (solo para modo DTR): 1 si el buffer de la impresora tiene espacio, 0 si no lo tiene
; R: RxReady, o estado del bit de recepción: 1 si está listo para recibir un dato (hacer un "in al,60h", 0 de lo contrario).
; T: TxReady, o estado del bit de transmisión: 1 si está listo para enviar un dato (hacer un "out 61h,al", 0 de lo contrario).

; Registros del USART
DATOIN equ 60h
DATOOUT equ 61h
ESTADO equ 62h

XON EQU 11h

; definición de datos
org 1000h
mensaje db "Hola"

; Subrutina que espera a que el USART esté listo para enviar más datos
; hasta la impresora 
; Como la comunicación es serie, puede que todavía este enviando los bits
; de un dato anterior
org 3000h
pollenviar: in al,ESTADO ; obtener el valor de ESTADO
            ; aislar TxReady, el bit 0 de ESTADO            
            ; and XXXX XXXT 0000 0001 = 0000 000T (donde D=DSR y T=TxReady)
            and al, 01h
            jz pollenviar; si al=0, entonces TxReady=0 => seguir haciendo polling
            ret


; Subrutina que espera a que el buffer de la impresora no esté lleno.
; b) Como el buffer de la impresora es finito, puede que se llene.
org 3000h
polldsr: in al,ESTADO ; obtener el valor de ESTADO
            ; aislar DSR, el bit 7 de ESTADO
            ; and DXXX XXXX 1000 0000 = D000 0000 (donde D=DSR )
            and al, 80h
            jz pollenviar; si vale 0, seguir haciendo polling
            ret
            

; PROGRAMA PRINCIPAL
org 2000h
; preparo el string a imprimir
mov bx,offset tabla
mov cl,4 ; cant de caracteres

; Configuro al usart en modo DTR mediante consulta de estado
;   =  0101 0001
mov al,51h
out ESTADO,al

; Envío a imprimir
loop: call pollenviar
      call polldsr
      ; usart e impresora listos para enviar datos
      ; envio el caracter
      mov al,[bx]
      out DATOOUT,al
      ; avanzo al siguiente caracter
      inc bx 
      dec cl 
      jnz loop
hlt
end
