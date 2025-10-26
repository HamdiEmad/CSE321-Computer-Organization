.data
prompt:         .asciiz "Enter numbers count: "
input_num:      .asciiz "Enter a number: "
average_msg:    .asciiz "The average is: "
new_line:       .asciiz "\n"
invalid:        .asciiz "invalid number!"

.text
main:
    li      $v0,            4
    la      $a0,            prompt
    syscall
    li      $v0,            5
    syscall
    ble     $v0,            $zero,          error   # handling non-positive numbers

    move    $t9,            $v0                     # t9 = n (count of numbers)
    li      $t0,            0                       # t0 = loop counter
    li      $t1,            0                       # t1 = sum accumulator

for:
    li      $v0,            4
    la      $a0,            input_num
    syscall
    li      $v0,            5
    syscall
    add     $t1,            $t1,            $v0     # sum += input number
    addi    $t0,            $t0,            1       # counter++
    beq     $t0,            $t9,            avg     # if (counter == n) average();
    j       for

avg:
    div     $t2,            $t1,            $t9     # average = sum / n
    li      $v0,            4
    la      $a0,            average_msg
    syscall
    li      $v0,            1
    move    $a0,            $t2
    syscall
    j       print_new_line

print_new_line:
    li      $v0,            4
    la      $a0,            new_line
    syscall
    j       exit

error:
    li      $v0,            4
    la      $a0,            invalid
    syscall
    j       print_new_line

exit:
    li      $v0,            10
    syscall