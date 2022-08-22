; Calcular la suma y multiplicación de A y B 
; y guardar el resultado en las variables sum y mult

.data
a: .word 2
b: .word 3
sum: .word 0
mult: .word 0

.code

ld r1,a(r0)
ld r2,b(r0)
dadd r3,r1,r2
sd r3,sum(r0)
dmul r4,r1,r2
sd r4,mult(r0)

halt
