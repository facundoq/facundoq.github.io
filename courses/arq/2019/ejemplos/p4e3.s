; Sumar los elementos del vector a
; Almacenar el resultado en res
; No usar instrucciones de salto

.data
a: .word 2, 4, 6
res: .word 0

.code
daddi r3,r0,r0; suma
; suma el 2 (desp = 0)
dadd r2,r0,r0; desplazamiento
ld r1,a(r2)
dadd r3,r3,r1
; suma el 4 (desp= 8)
daddi r2,r2,8
ld r1,a(r2)
dadd r3,r3,r1
; suma el 6 (desp=16)
daddi r2,r2,8
ld r1,a(r2)
dadd r3,r3,r1

halt
