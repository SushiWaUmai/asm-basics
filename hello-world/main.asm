section .data
  msg db "Hello, World!", 10 ; 10 = \n LF EOF
  len equ $ - msg

section .text
  global _start

_start:
  mov rax, 1        ; system call of 1 is write
  mov rdi, 1        ; set output stream to stdout
  mov rsi, msg      ; set adress of the string to output
  mov rdx, len      ; number of the bytes of the message including the null terminiator
  syscall

  mov rax, 60       ; system call for exit
  mov rdi, 0        ; set return code to 0
  syscall

