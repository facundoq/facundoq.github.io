# Escriba un programa que lea un string y luego lo imprima,
#junto con la cantidad de caracteres que tiene

# para leer el string, leer caracteres hasta que se ingrese
#el simbolo '.'.

.data
dir_control: .word32 0x10000
dir_data: .word32 0x10008
char_fin: .ascii '.'
cadena: .ascii ''


.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

ld $s2,char_fin($0) # s2 tiene el codigo ascii del .

daddi $t2,$0,0 # contador/indice de chars

#LEER UN CARACTER Y LO PONE EN t1
	 daddi $t0,$0,9
loop: sd $t0,0($s0)# mando el codigo 9 a control para leer un char
	ld $t1,0($s1)# traigo desde data a $t1 el caracter leido
	beq $t1,$s2,fin # voy a fin si es un .
	sb $t1,cadena($t2) # guardo el char en la memoria p armar un string
	daddi $t2,$t2,1 #incremento el contador/indice
	j loop

	# poner un 0 al string
fin: sb $0,cadena($t2)
	# imprimir el string
	daddi $t5,$0,cadena
	sd $t5,0($s1)# paso la direccion de comienzo de la cadena a data
	daddi $t6,$0,4
	sd $t6,0($s0) # mando el codigo 4 a control
	# imprimir la cant de chars del string
	sd $t2,0($s1)#mando el numero a imprimir a data
	daddi $t7,$0,1
	sd $t7,0($s0)# mando el codigo 1 a control

halt 
