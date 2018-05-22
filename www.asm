; https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

section .data

msg db      'w','w' ; w hex - 77, makes it easier to find in memory
len equ     $ - msg

section .text 
global  _start              

_pre:
	db 0x90,0x90,0x90,0xc3 ; direct raw instructions , run disassemble /r (nop nop nop ret)
_start:
	call _pre
	call _post
	push rbp
	mov rbp, rsp
	sub rsp, 0x40
	xor rdx, rdx
	mov rdx, 200 
	mov rcx, 2 
	mov [rbp-0x10], rdx
	mov [rbp-0x18], rcx
	add rdx, rcx
	mov [rbp-0x20], rdx
	nop
        lea rbx, [msg] 
	nop
	mov     rax, 60	; sys_exit   
	mov	rdi, [rbp-0x20]	; retcode is the sum of numbers 
	syscall
_post:
        mov     rax, 60 ; sys_exit
        mov     rdi, 0 
        syscall
	ret
