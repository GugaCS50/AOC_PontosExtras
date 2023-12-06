.data
    v1:     .word 0
    v2:     .float 0.0
    fmt_in: .asciiz "%d %f"
    fmt_out: .asciiz "v1=%d, v2=%f\n"

.text
.globl main

main:
    li $v0, 8
    la $a0, fmt_in
    la $a1, v1
    la $a2, v2

    li $v0, 2
    lw $a0, v1

    li $v0, 2
    lwc1 $f12, v2

    li $v0, 4
    la $a0, fmt_out

    li $v0, 10
    syscall