BITS 64
global _start

zerobuf: 
	times 100 db 0
_start:
	push rbp
	mov rbp,rsp
	times 300 db 0x90
	mov cl, 7 
	mov dl, 7
	add cl, dl
	mov [rbp-20], cl

	mov     rax, 60
	xor     rdi, rdi
	mov	rdi, [rbp-20]
	syscall		; 0x60

