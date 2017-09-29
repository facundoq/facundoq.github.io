#Escriba un programa que lea dos numeros de la memoria, los sume y los guarde
# en otra variable

.data
numero: .word 15
numero2: .word 2
res: .word 0

.code

ld r1,numero(r0)
ld r2,numero2(r0)

dadd r3,r1,r2
sd r3,res(r0)
halt