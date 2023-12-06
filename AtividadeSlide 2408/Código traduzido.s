    .data
newline:     .asciiz "\n"
    .text
    .globl main

main:
    li $a0, 5
    jal fact

    move $a0, $v0
    li $v0, 10
    syscall

fact:
    sw $ra, 0($sp)
    sub $sp, $sp, 4

    bge $a0, 2, else

    li $v0, 1
    j end_fact

else:
    sub $a0, $a0, 1
    jal fact
    lw $ra, 0($sp)
    add $sp, $sp, 4

    mul $v0, $a0, $v0

end_fact:
    jr $ra