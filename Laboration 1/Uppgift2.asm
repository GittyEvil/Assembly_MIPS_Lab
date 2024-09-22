

.data
	var: .asciiz "skriv ut ett heltal"
	heltal: .word 0
	jämna: .asciiz "jämnt"
	udda: .asciiz "udda"


.text	
#skriv ut fråga
li $v0,4
la $a0,var
syscall

#input å spara variabel
li $v0, 5
syscall
move $t0,$v0

#kolla om jämn eller ej
andi $t1,$t0,1
#kollar ifall den är udda(0:a i slutet)
beqz $t1,udda
#annars
li $v0,4
la $a0,jämna
syscall

j exit


udda:

	li $v0,4
	la $a0,udda
	syscall
	j exit

exit:
li $v0, 10
syscall
	

