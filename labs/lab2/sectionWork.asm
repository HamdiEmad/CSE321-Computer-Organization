.data
    # data section for Main_1
    # first_num:  .asciiz "Enter first number: "
    # second_num: .asciiz "Enter second number: "
    # result:     .asciiz "result: "

    # data section for Main_2
    # input:      .asciiz "Enter a number: "
    # is_pos:     .asciiz "The number is positive.\n"
    # is_neg:     .asciiz "The number is negative.\n"
    # is_zero:    .asciiz "The number is zero.\n"

    # data section for Main_3
    #newline:    .asciiz "\n"

    # data section for Main_4
    # result: .asciiz "The sum is: "
    # prompt: .asciiz "Enter a number (0 to end): "

prompt:     .asciiz "Enter a number: "
sum_msg:    .asciiz "The sum is: "
new_line:   .asciiz "\n"

.text
main:

    # Main_1: add two numbers and print the result
    #     # Prompt for first number
    #     li      $v0,    4
    #     la      $a0,    first_num
    #     syscall
    #     li      $v0,    5
    #     syscall
    #     move    $t0,    $v0

    #     # Prompt for second number
    #     li      $v0,    4
    #     la      $a0,    second_num
    #     syscall
    #     li      $v0,    5
    #     syscall
    #     move    $t1,    $v0

    #     # Print result
    #     li      $v0,    4
    #     la      $a0,    result
    #     syscall
    #     add     $a0,    $t0,        $t1
    #     li      $v0,    1
    #     syscall



    # Main_2: check if a number is positive, negative, or zero
    #     li      $v0,    4
    #     la      $a0,    input
    #     syscall
    #     li      $v0,    5
    #     syscall
    #     move    $t0,    $v0

    # if:
    #     bne     $t0,    $zero,      else_if
    #     la      $a0,    is_zero
    #     j       end_if

    # else_if:
    #     blez    $t0,    else
    #     la      $a0,    is_pos
    #     j       end_if

    # else:
    #     la      $a0,    is_neg

    # end_if:
    #     li      $v0,    4
    #     syscall



    # Main_3: print numbers from 1 to 10 using while loop
    #     li      $t0,    1
    #     li      $t1,    11
    # while:
    #     beq     $t0,    $t1,        exit
    #     move    $a0,    $t0
    #     li      $v0,    1
    #     syscall
    #     li      $v0,    4
    #     la      $a0,    newline
    #     syscall
    #     add     $t0,    $t0,        1
    #     j       while



    #   # Main_4: sum numbers until user enters 0
    #    li      $t0,    0          # Initialize sum to 0
    # input:
    #     li      $v0,    4
    #     la      $a0,    prompt
    #     syscall
    #     li      $v0,    5
    #     syscall
    #     beq     $v0,    $zero,  disp_sum
    #     add     $t0,    $t0,    $v0
    #     j       input

    # disp_sum:       li      $v0,    4
    #     la      $a0,    result
    #     syscall
    #     move    $a0,    $t0
    #     li      $v0,    1
    #     syscall
    #     j       exit



    #Main_5: sum numbers from 0 to n-1
    li      $v0,    4
    la      $a0,    prompt
    syscall
    li      $v0,    5
    syscall

    move    $t1,    $v0
    li      $t0,    0                       # loop counter
    li      $t2,    0                       # sum accumulator

for:
    add     $t2,    $t2,        $t0
    beq     $t0,    $t1,        print_sum
    addi    $t0,    $t0,        1
    j       for

print_sum:
    li      $v0,    4
    la      $a0,    sum_msg
    syscall
    move    $a0,    $t2
    li      $v0,    1
    syscall
    li      $v0,    4
    la      $a0,    new_line
    syscall
    j       exit

exit:
    li      $v0,    10
    syscall