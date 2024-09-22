#uppgift 1

.data
var: .asciiz "skriv ut en bokstav mellan b och y"
error: .asciiz "bokstav inte innanf�r intervall (b-y), avslutar program"
space: .asciiz " " 
str : .asciiz "" 


.text 

#skriver ut var
li $v0,4
la $a0,var
syscall

#ber anv�ndare om input
li $v0,12
syscall
move $t0,$v0   #sparar bokstav i t0

#kollar om bokstav vi fick �r 'godk�nd'
li $t1,98 #98 ascii = B
li $t2,121 #121 ascii = Y

#kollar s� att bokstav �r innanf�r intervall b-y
blt $t0,$t1,Error #mindre �n 0 < 2
bgt $t0,$t2,Error #st�rre �n 0 > 2

#�r innanf�r(ber�kning)
add $t3,$t0,1    #(h)
sub $t4, $t0,1    #(f)

#skriver ut bokstav framf�r och efter
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

#inte innan f�r intervall b-y(avsluta program)
Error:
	li $v0,4
	la $a0,error
	syscall
	li $v0,10
	syscall

