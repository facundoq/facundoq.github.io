# convertir el valor de A a punto flotante y guardarlo en la variable b

.data
a: .word 5
b: .double 0

.code

ld r1,a(r0) # cargo el 5 codificado en CA2
mtc1 r1,f2 # copio a f2 el 5 en CA2
cvt.d.l f3,f2 # convierto el 5  	de CA2 a IEEE754
s.d f3,b(r0) # guardo el 5 codificado en IEEE754 en b

halt