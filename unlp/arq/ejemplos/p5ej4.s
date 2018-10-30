.data
	cadena: .asciiz "Caza"
.text
	; La pila comienza en el tope de la memoria de datos
	DADDI $sp, $0, 0x400
	; Guarda como primer argumento para upcaseStr
	DADDI $a0, $0, cadena 
	JAL mayusStr
	halt


mayusStr: daddi $sp,$sp,-16
         sd $s0,0($sp) ; push $s0
         sd $ra,8($sp) ; push $ra
		 
         daddi $s0,$a0,0 ; $s0=$a0
	loop: lbu $a1,0($s0); cargar el char load byte unsigned
	     beqz $a1, fin
		 jal mayusCar
		 ; en v0 el car en mayuscula
		 sb $v0,0($s0)
		 daddi $s0,$s0,1 ; sumo 1 pq cada char ocupa 1byte
	     j loop		 
		 
     fin: ld $s0,0($sp)
		 ld $ra,8($sp)
	     daddi $sp,$sp,16 ; pop $s0
	     jr $ra
		 
; recibe un caracter ascii en $a1
; retorna el mismo char en mayuscula en $v0	 
mayusCar: daddi $v0,$a1,0
		  slti $t0,$a1,97
		  bnez $t0,fin2; if $a1<97 then: ir al fin
		  
		  daddi $t1,$0,122
		  slt $t0,$t1,$a1; $t0 = 122 < $a1
		  bnez $t0,fin2; if 122<$a1 then: ir al fin
		  
	      daddi $v0,$a1,-32 ; convierto de min a may
		  
     fin2: jr $ra