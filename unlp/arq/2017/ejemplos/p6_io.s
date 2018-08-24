.data

dir_control: .word32 0x10000

.code

daddi $t0,$0,1

#daddi $s0,$0,0xFFFF # 0x10000 es la direccion de control
#daddi $s0,$s0,1
lwu $s0,dir_control($0)

sd $t0,0($s0)
#sd $t0,dir_control($0) # MAL


halt