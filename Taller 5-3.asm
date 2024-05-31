section .data
    msg db 'Usando la pila en ensamblador x86', 0

section .text
    global _start

_start:
    ; Guardar el valor actual del registro EBP
    push ebp
    ; Establecer EBP como el nuevo puntero base
    mov ebp, esp

    ; Pasar el mensaje a la función print_message
    push msg
    call print_message
    add esp, 4   ; Limpiar el parámetro de la pila

    ; Restaurar el valor original de EBP
    mov esp, ebp
    pop ebp

    ; Salir del programa
    mov eax, 1   ; Número de syscall para sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80

print_message:
    ; Prologo de la función
    push ebp
    mov ebp, esp

    ; Obtener el parámetro de la pila
    mov eax, [ebp+8]
    ; Llamar a la función printf de C
    push eax
    call printf
    add esp, 4   ; Limpiar el parámetro de la pila

    ; Epilogo de la función
    mov esp, ebp
    pop ebp
    ret
