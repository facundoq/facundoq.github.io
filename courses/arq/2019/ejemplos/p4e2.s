; Calcular (a+4)*3
; Almacenar el resultado en res

.data
a: .word 2
res: .word 0

.code
ld r1,a(r0)
daddi r1,r1,4; r1=r1+4
daddi r2,r0,3; r2=3
dmul r1,r1,r2; r1 = r1 *r2= r1 * 3

halt
