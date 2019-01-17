	.data
# array of numbers
array:	.byte	1,0,3,6,2,3

	.text
	.globl main
main:
		la $t0, array		# load array to temporary variable t0
		lb $t1, 2($t0)		# get first element of array, t1 = array[0]
		li	$v0, 1			# load appropriate system call code into register $v0, code for int is 1
		move	$a0, $t1	# move integer to be printed into $a0:  $a0 = $t1
		syscall				# call operating system to perform operation
		li	$v0, 10			# system call code for exit = 10
		syscall