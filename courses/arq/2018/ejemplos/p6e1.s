#escriba un programa que imprima un numero positivo, un número negativo y uno flotante en la pantalla

.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
num:     .double -10.5

.code
ld $s0,CONTROL($0) # cargo en s0 la dir de control
ld $s1,DATA($0) # cargo en s1 la dir de DATA

#IMPRIMO EL 20
daddi $t0,$0,20 # inicializo el numero a imprimir
sd $t0,0($s1)# pongo DATA=20

daddi $t1,$0,1 # cargo en t1 el código 1
sd $t1,0($s0)# mando el codigo 1 a CONTROL


#IMPRIMO EL -10
daddi $t0,$0,-10 # inicializo el numero a imprimir
sd $t0,0($s1)# pongo DATA=-10

daddi $t1,$0,2 # cargo en t1 el código 2
sd $t1,0($s0)# mando el codigo 2 a CONTROL

#IMPRIMO EL -10.5
l.d f0,num($0) # f0=-10.5
s.d f0,0($s1)# pongo DATA=-10

daddi $t1,$0,3 # cargo en t1 el código 3
sd $t1,0($s0)# mando el codigo 3 a CONTROL

halt