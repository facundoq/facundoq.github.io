 
 
 # msx 
 org 1000h
 VAR .db 3
 
 org 2000h
 mov ax, offset VAR ; ax = 1000h
 
 # winmips
.data
VAR: .word 5
.code

daddi $t0,$0,VAR # $t0 = DIR(VAR) ( no sabemos cual es)
ld $t0,VAR($0) # $t0 = 5
 
