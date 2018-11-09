# pintar el pixel (x=25,y=40) de color azul


.data
color: .byte 0,255,255,0 
x: .byte 25
y: .byte 40

control: .word 0x10000
data:    .word 0x10008

.code

ld $s0,control($0)
ld $s1,data($0)

#configurar data
lwu $t0,color($0)
sw $t0,0($s1) # rgba  = color

lbu $t0,y($0)
sb $t0,4($s1) # y = 40

lbu $t0,x($0)
sb $t0,5($s1) # x = 25


#mandar el codigo 5 a control
daddi $t0,$0,5
sd $t0,0($s0)


halt

