# escriba un programa que lea un caracter y lo imprima de nuevo

.data
dir_control: .word32 0x10000
dir_data: .word32 0x10008
cadena: .ascii 'z'

.code
lwu $s0,dir_control($0)
lwu $s1,dir_data($0)

daddi $t0,$0,9
sd $t0,0($s0)# mando el codigo 9 a control para leer un char

ld $t1,0($s1)# traigo desde data a $t1 el caracter leido

sb $t1,cadena($0) # armo un string de 1 char ($t1)
daddi $t2,$0,1
sb $0,cadena($t2)

#mandar la direccion de cadena a DATA
daddi $t4,$0,cadena
sd $t4,0($s1)
# mandar el codigo 4 (imprimir string) a control
daddi $t3,$0,4
sd $t3,0($s0)

halt