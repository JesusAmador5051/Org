section .data
    object:
        dd 5
        dd 10

section .text
    global _start

extern method

_start:
    lea ecx, [object]
    call method

    mov eax, 1
    xor ebx, ebx
    int 0x80

method:
    mov eax, [ecx]
    add eax, [ecx + 4]
    ret
