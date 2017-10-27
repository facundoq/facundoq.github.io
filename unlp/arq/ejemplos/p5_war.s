# Calcular c=a*b*b y d=a+b
#         
.data
a: .double 15
b: .double 12
c: .double 0
d: .double 0

.code	 
l.d f1,a($0)
l.d f2,b($0)
mul.d f3,f1,f2
mul.d f4,f3,f2
add.d f3,f1,f2
s.d f3,c($0)	 
s.d f4,d($0)
halt
