# escriba un programa que pase a mayusculas un string
.data
cadena: .asciiz 'ho01la'



.code 
daddi $s1,$0,0

loop: lbu $a2,cadena($s1)
	  beqz $a2,fin
	  jal toUpper
	  sb $v1,cadena($s1)
	  daddi $s1,$s1,1
	  j loop
fin: halt

#recibe el caracter en $a2
# devuelve el resultado en $v1
toUpper: 	daddi $t0,$0,96# t0 = codigo de '`', anterior a la 'a'
			daddi $t1,$0,123 # t0 = codigo de  '{', posterior a la 'z'
        
			slt $t2,$a2,$t1 # t2 := letra<='z'
			slt $t3,$t0,$a2 # t3 := 'a'<=letra
			and $t4,$t2,$t3 # t4 := t2 and t3
			beqz $t4, no_cambiar
			daddi $v1,$a2,-32
			j finToUpper
no_cambiar: dadd $v1,$0,$a2
finToUpper: jr $ra
