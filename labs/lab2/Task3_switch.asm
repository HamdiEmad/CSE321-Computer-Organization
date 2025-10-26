    # switch (day) {
    #     case 1:
    #     printf("Friday");
    #     break;
    #     case 2:
    #     printf("Saturday");
    #     break;
    #     default:
    #     printf("Not a weekend");
    # }

.data
day:            .asciiz "Enter the day index (1 - 7): "
day1:           .asciiz "Saturday\n"
day7:           .asciiz "Friday\n"
not_weekend:    .asciiz "Not a weekend\n"
invalid:        .asciiz "Invalid index!\n"

.text
main:
    li      $v0,        4
    la      $a0,        day
    syscall
    li      $v0,        5
    syscall

    li      $t1,        1
    li      $t7,        7
    li      $t8,        8

    # Handle invalid input
    ble     $v0,        $zero,          error
    bge     $v0,        $t8,            error


    beq     $v0,        $t1,            day_1
    beq     $v0,        $t7,            day_7
    j       work_day

day_1:
    li      $v0,        4
    la      $a0,        day1
    syscall
    j       exit

day_7:
    li      $v0,        4
    la      $a0,        day7
    syscall
    j       exit

work_day:
    li      $v0,        4
    la      $a0,        not_weekend
    syscall
    j       exit

error:
    li      $v0,        4
    la      $a0,        invalid
    syscall
    j       exit

exit:
    la      $v0,        10
    syscall