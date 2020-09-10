# imprimir el numero 5 en pantalla como numero con signo
.data
dircontrol: .word 0x10000
dirdata: .word 0x10008

string: .space 10
.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

daddi $t6, $0, 0 # desplazamiento en STRING
daddi $t5, $0, 10 # contador de caracter
daddi $t1,$0,9
loop: sd $t1,0($t2) # mando la orden de leer un char (codigo 9)
	#lbu => load byte unsigned => cargar byte sin signo
	lbu $t4,0($t3) # cargo el numero (8 bytes) desde DATA
	sb $t4, string($t6) # guardo con sb (save byte) el char
	daddi $t6,$t6,1 # incremento 1 por que son bytes
	daddi $t5,$t5,-1
	bnez $t5,loop
halt
