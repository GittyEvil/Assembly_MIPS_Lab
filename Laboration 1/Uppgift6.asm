.data
	heltal: .asciiz "skriv ett heltal"
	
	
.text

#printar str
li $v0,4
la $a0,heltal
syscall
	
#summan
li $t0,0
		
#tar input tills input 0
InputnCalc:
	#input och sparar i t1
	li $v0,5
	syscall
	move $t1,$v0

	#kollar om 0
	beq $t1,$zero,end
	
	#gör beräkning och skriver ut
	add $t0,$t0,$t1
	move $a0,$t0
	li $v0, 1
	syscall
	
	j InputnCalc
	
	
end:
	li $v0 10
	syscall