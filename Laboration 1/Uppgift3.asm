.data

	heltal: .asciiz "Skriv ett Heltal: "
	threshold: .word 204000
	low: .word 30
	high: .word 50
	
	
.text

#skriver ut ett heltal
li $v0,4
la $a0, heltal
syscall

#input för heltal, sparar i $t0
li $v0,5
syscall
move $t0,$v0 #bruttoinkomst = $t0

#laddar upp konstanter
lw $t1, threshold
lw $t2, low
lw $t3,high

#beräknar ut nettoinkomst(netto)
ble $t0,$t1,less_threshold
j over_threshold


less_threshold:
	mult  $t0,$t2
	mflo $t4
	div $t4,$t4,100
	sub $t5, $t0, $t4 #$t5 = resultat(netto)
	j exit
	
over_threshold:
	sub $t0,$t0,$t1
	mult $t0,$t3
	mflo $t4
	div $t4,$t4,100
	
	mult $t1,$t2
	mflo $t5
	div $t5,$t5,100
	
	add $t7,$t5,$t6
	sub $t7,$t0,$t7
	j exit
exit:
li $v0,10
syscall
