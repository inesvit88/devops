time nasm -f elf64 www.asm && ld www.o -o www && ./www; echo -e " \e[30;48;5;84m $? \e[0m"

gdb www

>break _pre
>run
>disassemble /r
>stepi
>disassemble /r 
