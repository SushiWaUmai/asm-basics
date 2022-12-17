section .text
global _start

_start:
    jmp main

print_char:
    mov     rax, 1
    mov     rdi, 1
    mov     rdx, 1
    syscall
    ret

print_row:
    push    rbp
    xor     rbp, rbp

    for_print_row:
        mov     rsi, star
        call    print_char

        inc     rbp
        cmp     rbp, r10
        jl      for_print_row

    mov     rsi, newline
    call    print_char

    pop     rbp
    ret

print_triangle:
    xor     r10, r10

    for_print_triangle:
        inc     r10

        call    print_row

        cmp     r10, 10
        jl      for_print_triangle

    ret

main:
    call    print_triangle

    mov     rax, 60
    mov     rdi, 0
    syscall

section .data
    star    db "*"
    newline db 10
