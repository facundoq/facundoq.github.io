#convertir los valores enteros a pf, dividiendolos también por 2
.data
enteros: .word 1,2,3,4,5,6
flotantes: .double 0,0,0,0,0,0
divisor: .double 2.0

.code
daddi $t0,$0,6
daddi $t2,$0,0
l.d   f2, divisor($0)

loop: ld $t1,enteros($t2)

      # paso el valor de $t1 a $f1
	  mtc1 $t1,f1 # $f1 tiene el valor de t1 en BSS
	  cvt.d.l f1,f1 # $f1 tiene el valor de t1 en PF
	  div.d f1,f1,f2
	  s.d f1, flotantes($t2)

	  daddi $t2,$t2,8
	  daddi $t0,$t0,-1
	  bnez $t0,loop

halt