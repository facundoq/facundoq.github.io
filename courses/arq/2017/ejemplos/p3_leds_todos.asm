; Generar todos los patrones de luz posibles


PB equ 31h
CB equ 33h

org 2000h

mov al,0000000b
out CB, al

mov al,0

loop: out PB,al
	  inc al
	  jnz loop


hlt
end