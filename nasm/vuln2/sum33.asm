section .data
  msg  db  'AAAAA'

global _start

_start:
	push rbp ; --- save the old ebp
	mov rbp,rsp ; --- point ebp to the saved ebp and the new stack frame  
	pop rbp ; --- restore the old ebp
	ret



















;   0x00005555555545fa <+0>:	push   %rbp
;   0x00005555555545fb <+1>:	mov    %rsp,%rbp
;   0x00005555555545fe <+4>:	mov    %edi,-0x14(%rbp)
;   0x0000555555554601 <+7>:	mov    %rsi,-0x20(%rbp)
;   0x0000555555554605 <+11>:	movl   $0x5,-0x4(%rbp)
;   0x000055555555460c <+18>:	mov    $0x0,%eax
;   0x0000555555554611 <+23>:	pop    %rbp
;   0x0000555555554612 <+24>:	retq   

