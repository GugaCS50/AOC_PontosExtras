.data
    a: .word 12
    d: .word 5
    t: .word 0
    fmt: .asciiz "t = %d\n"
	
.text
.globl main

main:
    lw $t0, a
    lw $t1, d
	lw $t2, t

    add $v0, $t0, $t0
	add $v1, $t0, $t1
    sub $t2, $v0, $v1
    sw $t2, t

    move $a0, $t2
    la $a1, fmt
	li $v2, 4
    syscall

    li $v3, 10
    syscall