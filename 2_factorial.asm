#t0 = 1
.data
User: .asciiz "Ingrese Valor \n"
.text
.globl main

main:

#imprimoms "Ingrese Valor \n"
li $v0, 4
la $a0, User
syscall

#leemos un int y movemos v0 a t0
li $v0, 5
syscall
move $t0, $v0

#le restamos 1 al numero
addi $a0, $t0, -1

loop:
beq $a0, $zero, exit
mul $t0, $t0, $a0     #multiplico y guardo en t0
addi $a0, $a0, -1     #le resto 1 al numero

j loop                #hacemos que itere el ciclo

exit:
li $v0, 1
move $a0, $t0         #muevo lo que esta en t0 a a0
syscall

#exit
li $v0, 10
syscall
