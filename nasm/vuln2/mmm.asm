	global	_start
_start:
	push rbp
	mov rbp,rsp
       
	sub rsp, 0x50
	mov dword [rbp-0x20], 0x11BABE01 
	mov dword [rbp-0x24], 0x22BABE02

	mov rax, [rbp-0x20]
	mov rdx, [rbp-0x28]
	ret
