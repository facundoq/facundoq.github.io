# dibuje una linea verde entre 5,10 y 30,10


.data
dir_control: .word32 0x10000
dir_data: .word32 0x10008

color: .byte 0,255,0,0 # R G B A (rojo verde azul trans)
y: .byte 10
x: .byte 5


.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

#cargar el color en data
lwu $t0,color($0)
sw $t0,0($s1)# escribir el color en data todo junto 
lbu $t1,y($0)
lbu $t2,x($0)


daddi $t4,$0,31# limite de X 

loop: #cargando la direccion inicial
		sb $t1,4($s1) # dir del pixel Y = data+4
		sb $t2,5($s1) # dir del pixel X = data+5
	    daddi $t3,$0,5
        sd $t3,0($s0)# manda 5 a control para dibujar el pixel
		daddi $t2,$t2,1
		bne $t4,$t2,loop

halt