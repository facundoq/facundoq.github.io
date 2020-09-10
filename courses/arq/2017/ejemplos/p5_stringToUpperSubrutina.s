# escriba un programa que pase a mayusculas un string

.data
cadena: .asciiz 'hHaAzZ1#_'



.code 
daddi $sp,$0,0x400
daddi $a0,$0,cadena
jal stringToUpper

halt


stringToUpper:   #push s1 y ra
                 daddi $sp,$sp,-16
				 sd $s1,8($sp)
				 sd $ra,0($sp)
				 
                 # s1 apunta al string
				 dadd $s1,$0,$a0
				 
           loop: lbu $a2, 0($s1) # usamos lbu en lugar de ld porque cada caracter ocupa 1 byte
				 beqz $a2, fin
				 jal toUpper
				 sb $v1,0($s1) # usamos sb en lugar de sd porque cada caracter ocupa 1 byte
				 daddi $s1,$s1,1 # sumamos 1 en lugar de 8 porque cada caracter ocupa 1 byte
				 j loop
				 #pop ra y s1
			fin: ld $s1,8($sp)
				 ld $ra,0($sp)
				 daddi $sp,$sp,16
				 jr $ra
             
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
