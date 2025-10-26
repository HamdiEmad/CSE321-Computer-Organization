.data
first_number:   .asciiz "Enter the first number: "
second_number:  .asciiz "Enter the second number: "
third_number:   .asciiz "Enter the third number: "
fourth_number:  .asciiz "Enter the fourth number: "
average_msg:    .asciiz "The average is: "

.text
main:
    # Prompt and read first number
    li      $v0,    4
    la      $a0,    first_number
    syscall
    li      $v0,    5
    syscall
    move    $t1,    $v0

    # Prompt and read second number
    li      $v0,    4
    la      $a0,    second_number
    syscall
    li      $v0,    5
    syscall
    move    $t2,    $v0

    # Prompt and read third number
    li      $v0,    4
    la      $a0,    third_number
    syscall
    li      $v0,    5
    syscall
    move    $t3,    $v0

    # Prompt and read fourth number
    li      $v0,    4
    la      $a0,    fourth_number
    syscall
    li      $v0,    5
    syscall
    move    $t4,    $v0

    # Calculate average
    add     $t5,    $t1,            $t2
    add     $t5,    $t5,            $t3
    add     $t5,    $t5,            $t4
    div     $t6,    $t5,            4

    # Print average
    li      $v0,    4
    la      $a0,    average_msg
    syscall
    move    $a0,    $t6
    li      $v0,    1
    syscall

exit:
    li      $v0,    10
    syscall