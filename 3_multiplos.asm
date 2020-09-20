.data
space: .asciiz "\n"

.text
.globl main
#s0 -> i
#s1 -> 101
#s2 -> resultado de i % 3
main:

li $s0, 1              # i = 1
li $s1, 101            # s1 = 101

loop:
beq $s0, $s1, exit

#Nos fijamos que el numero sea divisible por 3
rem $s2, $s0, 3         # resto = i % 3
beq $s2, $zero, start   # if (i % 3 == 0)

#Nos fijamos que el numero sea divisible por 5
rem $s2, $s0, 5         # resto = i % 5
beq $s2, $zero, start   # if (i % 5 == 0)
j end

start:
#imprimimos $s0
li $v0, 1
move $a0, $s0
syscall

#imprimimos \n
li $v0, 4
la $a0, space
syscall

end:
addi $s0, $s0, 1        #sumamos 1 al contador (i++)
j loop                  #hacemos que itere el ciclo


#exit
exit:
li $v0, 10
syscall
