
# Traducir este código en pascal a assembler
# var 
#  a,b,c:real;
#  cond:boolean;
# begin
# a=15;
# b=12;
# c=a*b;
# if not cond then
#      c=a+b;
# end

.data
a: .double 15
b: .double 12
c: .double 0
cond: .word 0

.code
	 
	 l.d f1,a($0)
	 l.d f2,b($0)
	 ld $t0,cond($0)
	 
	 mul.d f3,f1,f2
	 bnez $t0,fin
	 add.d f3,f1,f2

fin: s.d f3,c($0)
	 halt
