#t0 -> a
#t1 -> b
#t2 -> c
#t3 -> i (contador)
.data
space: .asciiz "\n"


.text
.globl main

main:

li $t0, 0              #t0 = 0
li $t1, 1              #t1 = 1

#imprimimos t0
li $v0, 1
move $a0, $t0
syscall

#imprimimos \n para que no nos queden los numero pegados.
li $v0, 4
la $a0, space
syscall

#imprimimos t1
li $v0, 1
move $a0, $t1
syscall

#imprimimos \n
li $v0, 4
la $a0, space
syscall

#i = 18
li $t3, 18

loop:
beq $t3, $zero, exit

#loop
add $t2, $t0, $t1      #c = a + b

#imprimimos t2
li $v0, 1
move $a0, $t2
syscall

move $t0, $t1          #  a = b
move $t1, $t2          # b = c

#imprimimos el  \n
li $v0, 4
la $a0, space
syscall

addi $t3, $t3, -1     #restamos 1 al contador

j loop                #itera el ciclo

#exit
exit:
li $v0, 10
syscall
