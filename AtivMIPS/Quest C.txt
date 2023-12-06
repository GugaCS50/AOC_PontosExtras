.data
j_val:  .word 5             
s_val:  .word 1            
.text
.globl main
main:
    # Inicialização
    li $t0, 0             

    # Carrega os valores iniciais de j e s
    lw $t1, j_val          
    lw $t2, s_val          

loop:
    # Condição do loop: i < j
    bge $t0, $t1, end_loop  

    # Cálculo s = s + i
    add $t2, $t2, $t0       

    # Incremento de i
    addi $t0, $t0, 1        

    j loop                

end_loop:
    # Impressão de s
    move $a0, $t2           
    li $v0, 1               
    syscall                 

    # Fim do programa
    li $v0, 10              
    syscall               
