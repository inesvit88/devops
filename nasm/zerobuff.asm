global _start

section .data
zerobuf: 
	times 100 db 0

section .text
_start:
	push rbp
	mov rbp,rsp
	times 8 db 0x90

	mov     rax, 60
	xor     rdi, rdi
	mov	rdi, 77 
	syscall		; 0x60
