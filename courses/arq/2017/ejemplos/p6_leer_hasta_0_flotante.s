# escriba un programa que lea un numero entero
# hasta que se lea el numero 0 e imprima su suma

.data

dir_control: .word32 0x10000
dir_data:  .word32 0x10008

cero: .double 0
.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)
	  l.d f3,cero($0)
	  l.d f2,cero($0)
	  
	  daddi $t0,$0,8 # codigo para leer un entero
	  
loop: sd $t0,0($s0) # mando el codigo a CONTROL
	  l.d f1,0($s1) # recupero el numero leido
	  
	  c.eq.d f1,f3 # comparo f1 con 0
	  bc1t fin # salto si la comparacion fue verdadera
	  add.d f2,f2,f1 #sumo el nro leido
      j loop 
fin:  s.d f2,0($s1) #cargo en data la suma
      daddi $t0,$0,3 # codigo de imprimir entero
      sd $t0,0($s0) # imprimo el entero
halt 

