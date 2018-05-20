    global _start
_start:
    mov rsp,12
    mov [rsp+4],34 
    mov [rsp+8],56

; ------ add prologue
;    push rbp    
;    mov  rbp, rsp 

; ----- save live registers
;    push rsi
;    push rdi
;    push rbx

; ----- make room for result 
;    sub rsp,4

; ----- move b into ebx register
;    mov rbx, [rbp+12] 
