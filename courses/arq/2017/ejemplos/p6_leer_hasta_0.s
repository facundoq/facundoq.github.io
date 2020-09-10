# escriba un programa que lea un numero entero
# hasta que se lea el numero 0 e imprima su suma

.data

dir_control: .word32 0x10000
dir_data:  .word32 0x10008

.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

	  daddi $t2,$0,0 # inicializo la suma
	  daddi $t0,$0,8 # codigo para leer un entero
	  
loop: sd $t0,0($s0) # mando el codigo a CONTROL
	  ld $t1,0($s1) # recupero el numero leido
	  beqz $t1,fin
	  dadd $t2,$t2,$t1 # sumo si no fue un 0
      j loop 
fin:  sd $t2,0($s1) #cargo en data la suma
      daddi $t0,$0,1 # codigo de imprimir entero
      sd $t0,0($s0) # imprimo el entero
halt 

