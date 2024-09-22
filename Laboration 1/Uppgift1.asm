#uppgift 1

.data
var: .asciiz "skriv ut en bokstav mellan b och y"
error: .asciiz "bokstav inte innanför intervall (b-y), avslutar program"
space: .asciiz " " 
str : .asciiz "" 


.text 

#skriver ut var
li $v0,4
la $a0,var
syscall

#ber användare om input
li $v0,12
syscall
move $t0,$v0   #sparar bokstav i t0

#kollar om bokstav vi fick är 'godkänd'
li $t1,98 #98 ascii = B
li $t2,121 #121 ascii = Y

#kollar så att bokstav är innanför intervall b-y
blt $t0,$t1,Error #mindre än 0 < 2
bgt $t0,$t2,Error #större än 0 > 2

#är innanför(beräkning)
add $t3,$t0,1    #(h)
sub $t4, $t0,1    #(f)

#skriver ut bokstav framför och efter
li $v0,11
move $a0,$t4
syscall

li $v0,4
la $a0,space
syscall

li $v0,11
move $a0,$t3
syscall

li $v0,10
syscall

#inte innan för intervall b-y(avsluta program)
Error:
	li $v0,4
	la $a0,error
	syscall
	li $v0,10
	syscall

