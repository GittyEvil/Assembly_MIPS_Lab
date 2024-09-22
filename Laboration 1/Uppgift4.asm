.data
årtal: .asciiz "Skriv ett årtal"
ja: .asciiz "Yes"
nej: .asciiz "No"


.text

#skriver ut print
li $v0,4
la $a0,årtal
syscall

#tar input och sparar i $t0
li $v0,5
syscall
move $t0,$v0



#skottår blir det om /400 jämnt eller /4 men inte 100
li $t1, 400
div $t0, $t1
mfhi $t2
beq $t2,$zero,Yes

li $t1, 100
div $t0, $t1
mfhi $t2
beq $t2,$zero,No

li $t1, 4
div $t0, $t1
mfhi $t2
beq $t2,$zero,Yes



j No

Yes:

	li $v0,4
	la $a0,ja
	syscall

	li $v0,10
	syscall
No:
	li $v0,4
	la $a0,nej
	syscall

	li $v0,10
	syscall
