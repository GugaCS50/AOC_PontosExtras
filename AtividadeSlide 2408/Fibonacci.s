.data
    newline:    .asciiz "\n"

.text
    main:
        li $t0, 0
        li $t1, 1
        li $t2, 10

        loop:
            move $a0, $t0
            li $v0, 1
            syscall

            li $v0, 4
            la $a0, newline
            syscall

            add $t3, $t0, $t1
            move $t0, $t1
            move $t1, $t3

            subi $t2, $t2, 1

            bnez $t2, loop

        li $v0, 10
        syscall