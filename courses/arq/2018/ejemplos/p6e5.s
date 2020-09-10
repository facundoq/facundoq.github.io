# pintar el pixel (x=25,y=40) de color azul


.data

control: .word 0x10000
data:    .word 0x10008

.code

ld $s0,control($0)
ld $s1,data($0)

#configurar data
daddi $t0,$0,0
sb $t0,0($s1) # r = 0 

daddi $t0,$0,255
sb $t0,1($s1) # g = 0 

daddi $t0,$0,255
sb $t0,2($s1) # b = 255

# ignoramos el a

daddi $t0,$0,0
sb $t0,3($s1) # alpha = 0

daddi $t0,$0,10
sb $t0,4($s1) # y = 40

daddi $t0,$0,30
sb $t0,5($s1) # x = 25


#mandar el codigo 5 a control
daddi $t0,$0,5
sd $t0,0($s0)


halt

