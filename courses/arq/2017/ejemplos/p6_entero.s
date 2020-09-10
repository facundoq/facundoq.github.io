# escriba un programa que imprima a y b en la pantalla 
#alfanumerica


.data
a: .word 5
b: .word 0xF413

dir_control: .word32 0x10000
dir_data: .word32 0x10008

.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

daddi $t0,$0,1 # t0 tiene el codigo de imprimir un entero

ld $t1,a($0) #cargo en un registro el valor a imprimir

sd $t1,0($s1)# cargo en data el valor a imprimir
sd $t0,0($s0) # mando el codigo 1 a CONTROL para que se haga la impresion

ld $t1,b($0) 
sd $t1,0($s1)# cargo en data el valor a imprimir
sd $t0,0($s0) # mando el codigo 1 a CONTROL para que se haga la impresion

halt