.data
heltal: .asciiz "Skriv ett heltal: "
n: .word 10
mellanslag: .asciiz " "
.text

#skriver ut print
li $v0,4
la $a0,heltal
syscall

#tar input f�r f�rsta tal
li $v0,5
syscall
move $t1,$v0 #l�gger in f�rsta talet i  st�rsta tal
move $t2,$v0 #l�gger in f�rsta talet i  minsta tal

#s�tter r�knare till 1 f�r vi har gjort v�rat f�rsta tal
li $t6,1

#tar input tills n uppn�ts men sparar � j�mf�r f�r st�rsta � minsta tal hela tiden
Loop:
	lw $t0,n
	beq $t6,$t0,end
	
	li $v0,5
	syscall
	move $t3,$v0

	bgt $t3,$t1,label1
	blt $t3,$t2,label2
	
	addi $t6,$t6,1
	j Loop
end:
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0, 4
	la $a0,mellanslag
	syscall
	
	li $v0,1
	move $a0,$t2
	syscall

	li $v0,10
	syscall

label1:
	#l�gger in i $t1
	move $t1,$t3
	j n�staSteg

label2:
	#l�gger in i $t2
	move $t2,$t3

#l�gger till 1 p� r�knare f�r att komma upp till 10 tillslut
n�staSteg:
	addi $t6,$t6,1
	j Loop