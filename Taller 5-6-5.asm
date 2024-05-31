section .data
    vec1 dq 1.1
    vec2 dq 2.2

section .text
    global _start

extern add_vectors

_start:
    movsd xmm0, [vec1]
    movsd xmm1, [vec2]
    call add_vectors

    mov eax, 1
    xor ebx, ebx
    int 0x80

add_vectors:
    addsd xmm0, xmm1
    ret

