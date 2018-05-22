; https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

section .data

msg db      'w','w' ; w hex - 77, makes it easier to find in memory
len equ     $ - msg

section .text 
             
	global  _start              
			       

_start:
	push rbp
	mov rbp, rsp
	sub rsp, 0x40
	xor rdx, rdx
	mov rdx, 8 
	mov rcx, 8 
	mov [rbp-0x10], rdx
	mov [rbp-0x18], rcx
	add rdx, rcx
	mov [rbp-0x20], rdx

        lea rbx, [msg] 

	mov     rax, 60	; sys_exit   
	mov	rdi, [rbp-0x20]	; retcode is the sum of numbers 
	syscall
