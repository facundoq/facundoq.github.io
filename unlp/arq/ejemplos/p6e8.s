# Escribir un programa que
# pinte de color amarillo
# la coordenada (x,y) = (50,30)

.data 
dircontrol: .word 0x10000
dirdata: .word 0x10008
color: .byte  127,127,0,0 # vector de 4 elementos
y: .byte 24
x: .byte 24

.code
ld $s0,dircontrol($0)
ld $s1,dirdata($0)

daddi	$t0, $zero, 7					; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd		$t0, 0($s0)						; CONTROL recibe 7 y limpia la pantalla gráfica

lbu $t1,y($0)# cargo el valor de y
sb $t1, 4($s1)# lo guardo en dirdata+4

lbu $t1,x($0)# cargo el valor de x
sb $t1, 5($s1)# lo guardo en dirdata+5

lwu $t1,color($0) # traigo los 4 bytes del color a t1
sw $t1, 0($s1) # guardo los 4 bytes en DATA

daddi $t1,$0,5
sd $t1,0($s0) # mando el 5 a control (cod imprimir)
halt