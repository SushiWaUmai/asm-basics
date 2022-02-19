section .data
  msg db "Hello, World!", 10 ; 10 = \n LF EOF
  len equ $ - msg

section .text
  global _start

_start:
  mov eax, 1        ; system call of 1 is write
  mov edi, 1        ; set output stream to stdout
  mov esi, msg      ; set adress of the string to output
  mov edx, len      ; number of the bytes of the message including the null terminiator
  syscall

  mov eax, 60       ; system call for exit
  mov edi, 0        ; set return code to 0
  syscall

