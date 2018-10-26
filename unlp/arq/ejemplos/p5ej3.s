# convertir el valor de B en punto flotante a entero y guardarlo en la variable A

.data
a: .word 0
b: .double 25

.code
l.d f1,b(r0) # en f1 el 25 en IEE754
cvt.l.d f2,f1 # # en f2 el 25 en CA2
mfc1 r1,f2
sd r1,a(r0)

halt


