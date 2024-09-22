.data
heltal: .asciiz "Skriv ett heltal: "
n: .word 10
mellanslag: .asciiz " "
.text

#skriver ut print
li $v0,4
la $a0,heltal
syscall

#tar input för första tal
li $v0,5
syscall
move $t1,$v0 #lägger in första talet i  största tal
move $t2,$v0 #lägger in första talet i  minsta tal

#sätter räknare till 1 för vi har gjort vårat första tal
li $t6,1

#tar input tills n uppnåts men sparar å jämför för största å minsta tal hela tiden
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
	#lägger in i $t1
	move $t1,$t3
	j nästaSteg

label2:
	#lägger in i $t2
	move $t2,$t3

#lägger till 1 på räknare för att komma upp till 10 tillslut
nästaSteg:
	addi $t6,$t6,1
	j Loop