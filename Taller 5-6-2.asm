section .data
    msg db 'Hello, stdcall!', 0

section .text
    global _start

extern printf

_start:
    push msg
    call printf

    mov eax, 1
    xor ebx, ebx
    int 0x80
