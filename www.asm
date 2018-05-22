; https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

section .data

msg db      	'w','w','w' ; www hex - 777777, makes it easier to find in memory
b1 db		'+','*','+','.'; 2B2A2B2E
b2 db		'.','+','*','+' ; 7B4B37

len equ     $ - msg

section .text 
global  _start              

_pre:
	db 0x90,0x90,0x90 ; direct raw instructions , run disassemble /r (nop nop nop ret)
	lea rbx, [b2]
        mov rdx, [b2]
	db 0xc3
_start:
	call _pre
	call _post
	nop
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
