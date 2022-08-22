; generar el arreglo res tal que
res = (a+b*b)/c
.data
a: .double 1.3,5.3,8.2
b: .double 3.5,3.3,7.3
c: .double  4.0, 8.2, 9.5
res: .double 0,0,0

.code
daddi $t0,$0,3 # cant de elementos de a,b,c, y res
daddi $t1,$0,0 # desplazamiento para a,b,c y res
loop:   l.d f1, a($t1)
		l.d f2, b($t1)
		l.d f3, c($t1)
		mul.d f4,f2,f2 #f4=f2*f2
		add.d f4,f4,f1 #f4=f4+f1
		div.d f4,f4,f3 #f4=f4/f3
		s.d f4, res($t1)
		daddi $t1,$t1,8
		daddi $t0,$t0,-1
		bnez $t0,loop
		halt
		
