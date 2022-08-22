; Hacer un esquema de la memoria para las
; siguientes variables.
; Asumir que la variable a se encuentra en la dirección 10h
; 10H a 17h = a => 2
; 18H a 1Fh = b => 3
; 20H a 27h     => 6
; 28H a 2Fh     => 8
; 30H a 33h = c => 4
; 34H a 3Bh = d => 5
.data
a: .word 2 ; 10h
b: .word 3, 6, 8
c: .word32 4
d: .word 5

.code
halt

;
;10h hasta XXh => 2 
