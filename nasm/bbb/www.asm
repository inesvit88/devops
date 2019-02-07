; https://sourceware.org/gdb/onlinedocs/gdb/Memory.html

section .data

s1 db		"leet"
s2 db		"coffee"

section .text 
global  _start              

_pre:
	db 0x90,0x90,0x90 ; NOP direct raw instructions , run disassemble /r (nop nop nop ret)
	lea rbx, [s1]
        lea rdx, [s2]
	db 0xc3		; RET
_start:
;	call _pre
;	call _post
	nop
	nop
	nop
	push rbp
	mov rbp, rsp
	sub rsp, 0x40
	xor rdx, rdx
	mov rdx, 3 
	mov rcx, 4
	mov [rbp-0x10], rdx
	mov [rbp-0x18], rcx
	add rdx, rcx
	mov [rbp-0x20], rdx
	nop
	nop
	nop
	mov     rax, 60	; sys_exit   
	mov	rdi, [rbp-0x20]	; retcode is the sum of numbers 
	syscall
_post:
        mov     rax, 60 ; sys_exit
        mov     rdi, 88 
        syscall
	ret
