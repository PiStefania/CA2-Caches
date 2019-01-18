	.data
# array of numbers
array:	.byte	1,0,3,6,2,3

	.text
	.globl main
main:
		la $t0, array		# load array to temporary variable t0
		li $t1, 6			# load immediate into t1, n: number of elements in array
		lb $t5, 0($t0)		# load first element of array to t4
		li $t3, 0			# load index
loop:
		li $v0, 1			# load appropriate system call code into register $v0, code for int is 1
		move $a0, $t5		# move integer to be printed into $a0:  $a0 = $t4
		syscall				# call operating system to perform operation
		addi $t3, $t3, 1	# add next position of array to t3
		beq $t3, $t1, end	# go to end if index == n
		add $t4, $t3, $t0
		lb $t5, 0($t4)		# load value of array element
		j loop
end:
		li $v0, 10			# system call code for exit = 10
		syscall