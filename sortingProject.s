	.data
# array of numbers
array:	.byte	1, 0

	.text
main:
		la $t0, array		# t0 = array, load array to temporary variable t0
		li $t1, 2			# t1 = n, load immediate into t1, n: number of elements in array
		li $t3, 0			# t3 = index, load index
gnomeLoop:
		beq $t3, $t1, end	# go to end if index == n
		beqz $t3, firstElemFound
continue:
		addi $t6, $t3, -1	# t6 = index - 1
		add $t4, $t3, $t0	# t4 = array + index
		add $t8, $t6, $t0	# t8 = array + index-1
		lb $t5, 0($t4)		# t5 = array[index]
		lb $t2, 0($t8)		# t2 = array[index-1]
		slt $t7, $t2, $t5	# t7 = result of array[index-1] > array[index] 
		beqz $t7, swap		# if !t7, swap elements
		addi $t3, $t3, 1	# add next position of array to t3
		j gnomeLoop

firstElemFound:				# index++
		addi $t3, $t3, 1
		j continue

swap:
	#t7 = t5, t5 = t2, t2 = t7
	add $t7, $zero, $t5
	sb $t2, 0($t4)
	sb $t7, 0($t8)
	addi $t3, $t3, -1
	j gnomeLoop

end:
		li $v0, 10			# system call code for exit = 10
		syscall

#print:
#		li $v0, 1			# load appropriate system call code into register $v0, code for int is 1
#		move $a0, $t5		# move integer to be printed into $a0:  $a0 = $t5
#		syscall				# call operating system to perform operation
