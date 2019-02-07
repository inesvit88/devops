;.set __NR_reboot, 88                 ; sys_call reboot()

;.set LINUX_REBOOT_MAGIC1, 0xfee1dead ; flags are specified in: <linux/reboot.h>
;.set LINUX_REBOOT_MAGIC2, 672274793
;.set LINUX_REBOOT_CMD_POWER_OFF, 0x4321fedc
;.set LINUX_REBOOT_CMD_RESTART, 0x01234567

section .text
        global _start
_start:
    mov eax,88
    mov ebx,0xfee1dead
    mov ecx,672274793
    mov edx,0x01234567
    mov esi,0
    int 0x80


;.set LINUX_REBOOT_MAGIC1, 0xfee1dead # flags are specified in: <linux/reboot.h>
;.set LINUX_REBOOT_MAGIC2, 672274793
;.set LINUX_REBOOT_CMD_POWER_OFF, 0x4321fedc
;.set LINUX_REBOOT_CMD_RESTART, 0x01234567

;movl $__NR_reboot, %eax
;movl $LINUX_REBOOT_MAGIC1, %ebx
;movl $LINUX_REBOOT_MAGIC2, %ecx
;movl $LINUX_REBOOT_CMD_RESTART, %edx
