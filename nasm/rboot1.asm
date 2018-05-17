section .text
        global _start
_start:
    mov eax,88
    mov ebx,0
    mov ecx,0
    mov edx,0
    mov esi,0
    int 0x80
