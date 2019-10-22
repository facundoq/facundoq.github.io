# Ejemplo de programa con 2 subrutinas

.code
daddi r29,r0,0x400#inicio SP=r29
jal subrutina
# jal deja la direccion siguiente (la de daddi r2,r2,3) en r31 
daddi r2,r2,3 #ejemplo (irreal) de un calculo
halt
# como subrutina llama a subrutina2
# preservo r31
subrutina: daddi r29,r29,-8
			sd r31,0(r29)#push r31
			
			
			daddi r1,r1,1 #ejemplo (irreal) de un calculo
			jal subrutina2
			
			ld r31,0(r29)#pop r31
			daddi r29,r29,8
		    jr r31 # volver al  daddi r2,r2,3
		   
		   
subrutina2: nop #ejemplo (irreal) de un cálculo
            jr r31
			 

