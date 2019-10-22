# Ejemplo de programa con 2 subrutinas utilizando la convención

.code
daddi $sp,r0,0x400#inicio SP=r29
daddi $t1,r0,3
daddi $s1,r0,3
jal subrutina
# jal deja en r31 
#la direccion siguiente

halt
# como subrutina llama a subrutina2
# preservo r31
subrutina:  daddi $sp,$sp,-8
			sd $ra,0($sp)#push r31
			
			daddi $t1,r0,5# OK pq es t
			jal subrutina2
			
			ld $ra,0($sp)#pop r31
			daddi $sp,$sp,8
		    jr $ra # volver al halt
		   
		   
subrutina2: nop
            jr $ra
			 

