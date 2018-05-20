	global	_start
_start:
	push rbp
	mov rbp,rsp
       
	sub rsp, 0x18
	mov dword [rbp-0x04], 0xbabe0001
	mov dword [rbp-0x10], 0xbabe0002

	mov rax, [rbp-0x04]
	mov rdx, [rbp-0x10]
	ret
