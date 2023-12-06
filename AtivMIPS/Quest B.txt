.data
j_val:  .word 12         
i_val:  .word 0            

.text
.globl main
main:
    # Inicialização
    la $t0, j_val         
    li $t1, 12              
    sw $t1, ($t0)          

    # Leitura de i
    li $v0, 5              
    syscall                
    move $t2, $v0           

    # Comparação i < j
    lw $t0, ($t0)           
    blt $t2, $t0, if_branch  

else_branch:
    # Cálculo j = i * 8 + j * 6 + 12
    addi $t2, $t2, 8        # i * 8
    mul $t3, $t0, 6         # j * 6
    add $t3, $t2, $t3       # i * 8 + j * 6
    addi $t3, $t3, 12       # i * 8 + j * 6 + 12
    j print_j

if_branch:
    # Cálculo j = 2 * i + 8
    sll $t2, $t2, 1         # 2 * i
    addi $t2, $t2, 8        # 2 * i + 8

print_j:
    # Impressão de j
    move $a0, $t3          
    li $v0, 1              
    syscall               

    # Fim do programa
    li $v0, 10              
    syscall               
