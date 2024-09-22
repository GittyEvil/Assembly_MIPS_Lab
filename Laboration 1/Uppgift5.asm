.data
	heltal: .asciiz "Skriv ett heltal"

.text

#printar heltal
li $v0,4
la $a0,heltal
syscall


#tar input
li $v0,5
syscall
move $t0,$v0 #heltal (n)


#ska göra summa tills n uppnås

li $t1,0 #summa var
li $t2,0 #senast adderade tal(temp var)


Loop:
	addi $t2,$t2,1
	add $t1,$t1,$t2
	bgt $t1,$t0 end
	j Loop

end:
	move $a0,$t1
	li $v0, 1
	syscall
	
	move $a0,$t2
	li $v0, 1
	syscall
	
	
	li $v0,10
	syscall
