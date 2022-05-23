section .data
star    db "*"; star
new_line db 10      ; \n

section .text
global  _start

_start:
	xor r11, r11; set the r11 counter to 0

	call loop1
	call end

loop1:
	mov rax, 1; system call of 1 is write
	mov rdi, 1; set output stream to stdout
	mov rsi, star; set adress of the string to *
	mov rdx, 1; add length of string

	xor  rcx, rcx; set rcx counter to 0
	call loop2; call the inner loop

	mov rax, 1; system call of 1 is write
	mov rdi, 1; set output stream to stdout
	mov rsi, new_line; set adress of the string to \n
	mov rdx, 1; add string

	push r11; push r11 before syscall
	syscall
	pop  r11; pop r11 after syscall

	inc r11; increment r11 by 1
	cmp r11, 100; if the r11 counter is less than 5
	jl  loop1; jump to loop1
	ret

loop2:
	;    push all persistent registers before syscall
	push rcx
	push r11

	syscall

	;   pop all persistent registers after syscall
	pop r11
	pop rcx

	inc rcx; increment counter by 1
	cmp rcx, r11; if the counter is less than 4
	jle loop2; jump to loop2
	ret

end:
	mov rax, 60; system call for exit
	mov rdi, 0; exit code 0
	syscall
