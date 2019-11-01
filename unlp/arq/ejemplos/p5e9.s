# imprima grande si a>10 y chico de lo contrario

# Es decir, imita el siguiente programa de Pascal

# if a < valor then
#    write("Chico")
# else
#    write("Grande")
# end


# Recordamos: 
# c.lt.d f1, f2 => f1<f2
# c.le.d f1, f2 => f1<=f2
# c.eq.d f1, f2 => f1==f2
# El resultado va al flag FP 

# Para saltar en base a FP tengo 2 instruccion
# bc1f ETIQUETA => salta a ETIQUETA si el flag FP = 0
# bc1t ETIQUETA => salta a ETIQUETA si el flag FP = 1

.data
a: .double 55.0
valor: .double 10

chico: .asciiz "Chico"
grande: .asciiz "Grande"

dircontrol: .word 0x10000
dirdata: .word 0x10008

.code

ld $t2,dircontrol($0)
ld $t3,dirdata($0)

daddi $t0,$0,4 # codigo para imprimir strings

ld f1, a($0)
ld f2, valor($0)

c.lt.d f1,f2 # compara y guarda el resultado en el flag FP
# FP = 1 si f1<f2 y 0 de lo contrario

bc1f imprimir_grande
# imprimir "chico"
daddi $t1,$0,chico # pongo en t1 la dirección de chico
j fin
imprimir_grande: daddi $t1,$0,grande# pongo en t1 la dirección de grande

fin:sd $t1,0($t3) # guardo la direccion del mensaje en DATA
    sd $t0,0($t2) # mando el codigo 4 a CONTROL 
    halt



