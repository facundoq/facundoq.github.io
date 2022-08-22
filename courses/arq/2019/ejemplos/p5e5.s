# Convertir el string mensaje 
# a mayuscula
# Usar una subrutina para
# convertir un caracter en mayuscula
# usar otra subrutina (que use la anterior)
# para convertir el string

# Versión con forma alternativa de guardar las cosas en la pila

.data
mensaje: .asciiz "hola"

.code
#inicializo la pila
daddi $sp,$0,0x400 #400h
#cargo el parametro
# mov $a0, offset mensaje
daddi $a0, $0, mensaje 
jal mayusString
halt

#recibe en a0 la direccion del string
mayusString:	  daddi $sp,$sp,-16
				  sd $ra,0($sp)
				  sd $s0,8($sp)
				  
				  dadd $s0,$0,$a0
			loop: lb   $a1,0($s0)
				  beqz $a1,fin
				  jal mayusCar
			      # en v0 mayus(car)
				  sb $v0,0($s0)
				  daddi $s0,$s0,1
				  j loop
				  
			fin:  ld $s0,8($sp)
				  ld $ra,0($sp)
				  daddi $sp,$sp,16
				  jr $ra
# recibe en a1 el caracter			
# devolver el caracter en mayus en v0
mayusCar: daddi $v0,$a1,-32
		  jr $ra
