# ponga el pixel 5,10 en azul


.data
dir_control: .word32 0x10000
dir_data: .word32 0x10008

color: .byte 0,0,255,0 # R G B A 
y: .byte 10
x: .byte 5


.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

lwu $t0,color($0)
sw $t0,0($s1)# escribir el color en data todo junto 
lbu $t1,y($0)
lbu $t2,x($0)
sb $t1,4($s1) # dir del pixel Y = data+4
sb $t2,5($s1) # dir del pixel X = data+5

daddi $t3,$0,5
sd $t3,0($s0)

halt