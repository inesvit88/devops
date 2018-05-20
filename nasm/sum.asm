section .data
    msg db	'AAAA','BBBB',10 ; line feed ACII HEX:(0x0A) or ASCII decimal: 10
    len equ	$-msg

;section .text
    global _start


;	%rax	System call	%rdi			%rsi			%rdx	
;	0	sys_read	unsigned int fd		char *buf		size_t count			
;	1	sys_write	unsigned int fd		const char *buf		size_t count			


_start:
;    mov     rax, 1 ; x86_64 ABI: sys_write	RAX - ACCUMULATOR
;    mov     rdi, 1 ; x86_64 ABI: 1 - stdout 	RDI - DESTINATION
;    mov     rsi, msg ;				RSI - SOURCE
;    mov     rdx, len ;				RDX - DATA (length of the string) 
;    syscall

;    mov    rax, 60
;    mov    rdi, 0
;    syscall

; ------ add prologue
    push ebp    
    mov ebp,esp 

; ----- save live registers
    push esi
    push edi
    push ebx

; ----- make room for result 
    sub esp,4

; ----- move b into ebx register
    mov ebx, [ebp+12] 
