# lea dos numeros en punto flotante a y b
# calcule c = a*b+12
# guarde solo la parte entera del resultado
.data
a: .double   2.5
b: .double   3.5
c: .word 0.0

.code
l.d f1,a($0)
l.d f2,b($0)

daddi $t0,$0,12
mtc1 $t0,f4 # copio el 12 al registro f4, pero codificado en bss
cvt.d.l f4,f4 # convierto de BSS a IEEE

mul.d f3,f1,f2
add.d f3,f3,f4

cvt.l.d f3,f3 # convierto de IEEE a BSS
mfc1 $t1,f3 # copia el valor tal cual de f3 a $t1

sd $t1,c($0)

halt
