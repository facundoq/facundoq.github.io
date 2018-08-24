# lea dos numeros en punto flotante a y b
# calcule c = (a*b+a)/b
.data
a: .double   2
b: .double   3
c: .double 0.0

.code
l.d f1,a($0)
l.d f2,b($0)

mul.d f3,f1,f2
add.d f3,f3,f1
div.d f3,f3,f2

s.d f3,c($0)

halt
