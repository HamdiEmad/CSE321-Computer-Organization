.data 
hello: .asciiz "Hello, World!"

.text
main:
    # Print the hello message
    li $v0, 4
    la $a0, hello
    syscall

    # Exit program
    li $v0, 10
    syscall