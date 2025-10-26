.data
msg: .asciiz "Name:      Hamdi Emad\nID:        20812022100282\nCourse:    CSE321-Computer-Organization"

.text
main:
    # Print the message
    li $v0, 4
    la $a0, msg
    syscall

    # Exit program
    li $v0, 10
    syscall