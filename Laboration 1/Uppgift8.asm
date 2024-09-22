.data
	vec: .word 5,7,1,9,2,4,8,3,6
	print: .asciiz "Enter the number you are searching for: "
	itHittad: .asciiz "The number is missing "
	Hittad: .asciiz "The position of the number is: "
.text
	
#skriver ut print
li $v0, 4
la $a0, print
syscall

li $v0 5
syscall
move $t0,$v0 #t0 spelar som S i C-koden #scanf &S

li $t1,0 # i = 0
li $t2,0 #found = 0
li $t3,-1 #pos = -1

#gör foor loop
forLoop:
	#kollar om vi gått igenom lista, skickas för å kolla om vi hittat
	li $t4,9
	beq $t1,$t4,check #i==9
	
	#kollar nu vec[i]
	la $t5,vec
	#multiplikation med 4i pga storlek av ord
	sll $t6,$t1,2
	#lägger till offset i vec[] för att få vec[i]
	add $t5,$t5,$t6
	#laddar vec[i] i $t7
	lw $t7,0($t5)
	
	#om talet hittats
	beq $t0,$t7,found
	
	addi $t1,$t1,1 #lägger till 1 på i
	j forLoop
	
#kollar om talet hittades i arr eller ej	
check:
	#kollar om found = 0 fortf
	beq $t2,$zero,notFound 
	
	li $v0,4
	la $a0, Hittad
	syscall
	
	#skriver ut den nya positionen, där talet hittades
	li $v0, 1
	move $a0,$t3
	syscall
	
	j end

#om hittad	
found:
	li $t2,1 #sätter found = 1
	addi $t3,$t1,1 #sätter om pos = i + 1
	j check

#om inte hittad
notFound:
	li $v0,4
	la $a0,itHittad
	syscall
	
	li $v0, 10
	syscall
	
end:
	li $v0, 10
	syscall