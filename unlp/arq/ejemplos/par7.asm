

1) IMR = 1111 1010
Permitidas las interrupciones de INT0 e INT2 (f10 y HANDSHAKE)
2) ISR = 0000 0010
Se está ejecutando la subrutina de atención del TIMER
3) IRR = 0000 0110
Están en cola las interrupciones del TIMER y el HAND
4) IMR = 1111 1110
Permitidas las interrupciones de INT0 (f10)

4) ESTADO del hand = 00101010
a) int deshabilitadas (bit 7 = 0)
b) strobe = 1 (bit 1 = 1)
c) busy =0 (bit 0 = 0)

5) PA del PIO conec impresora = 11110001
a) strobe = 0 
b) busy = 1