section .data
    num1 dd 10
    num2 dd 20

section .text
    global _start

extern sum

_start:
    mov ecx, [num1]
    mov edx, [num2]
    call sum

    mov eax, 1
    xor ebx, ebx
    int 0x80

sum:
    add ecx, edx
    ret
