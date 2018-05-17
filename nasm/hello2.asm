; Define variables in the data section
SECTION .DATA
	hello:     db 'Hello world',10
	helloLen:  equ $-hello

; Code goes in the text section
SECTION .TEXT
	GLOBAL _start 

_start:
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel

; mov ah, 0x0e    ; function number = 0Eh : Display Character
; mov al, '!'     ; AL = code of character to display
; int 0x10        ; call INT 10h, BIOS video service

	; Terminate program
	mov eax,1            ; 'exit' system call = 1 (sys_exit)
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel, software interrupt 'int 0x80'. After each syscall, an integer is returned in %eax.
; INT is an assembly language instruction for x86 processors that generates a software interrupt. It takes the interrupt number formatted as a byte value

