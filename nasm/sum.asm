section .data
    msg db      'AAAA','BBBB' 

section .text
    global _start


;	%rax	System call	%rdi			%rsi			%rdx	
;	0	sys_read	unsigned int fd		char *buf		size_t count			
;	1	sys_write	unsigned int fd		const char *buf		size_t count			


_start:
    mov     rax, 1 ; x86_64 ABI: sys_write
    mov     rdi, 1 ; x86_64 ABI: 1 - stdout 
    mov     rsi, msg
    mov     rdx, 4 
    syscall

    mov    rax, 60
    mov    rdi, 0
    syscall
