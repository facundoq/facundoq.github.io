;Escriba una subrutina que multiplique
; dos números.
; Recibe los parametros por registro en r1 y r2
;y devuelve el resultado en r3

.data
a: .word 5
b: .word 3
r: .word 0

.code
# inicializa sp en la dir 0x400
daddi $sp,$0,0x400
ld $a0,a(r0)
ld $a1,b($0)
jal multiplicar
sd $v0,r($zero)
halt

# multiplicar recibe en r1 y r2 los
# operandos y devuelve en r3 el res
multiplicar: #Hacer push $s0
            daddi $sp,$sp,-8
			sd    $s0,0($sp)
			
            daddi $s0,r0,0

	  loop: dadd  $s0,$s0,$a0
            daddi $a1,$a1,-1
			bnez  $a1,loop
			
			dadd $v0,$0,$t0
			# Hacer pop $s0
			ld $s0,0($sp)
			daddi $sp,$sp,8
			jr $ra
			
			
