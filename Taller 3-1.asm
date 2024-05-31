section .data
    msg_greater db "El número es mayor a 15", 0xA         ; Mensaje si es mayor a 15
    len_msg_greater equ $ - msg_greater                   ; Longitud del mensaje anterior

    msg_lower db "El número es menor o igual a 15", 0xA   ; Mensaje si es menor o igual a 15
    len_msg_lower equ $ - msg_lower                       ; Longitud del mensaje anterior

section .bss
    number resd 1   ; Reserva espacio en memoria para almacenar un entero 

section .text
    global _start   ; Marca el inicio del programa

_start:

    mov dword [number], 15    ; Asigna el valor 15 a la variable number

    mov eax, dword [number]   ; Carga el valor de 'number' en eax
    cmp eax, 15               ; Compara el valor de eax con 15
    jle lower_than_or_equal   ; Si el número es menor o igual a 15 salta a lower_than

    mov eax, 4                ; Código de la llamada al sistema para imprimir el mensaje
    mov ebx, 1                ; Descriptor de archivo para la salida
    mov ecx, msg_greater      ; Dirección del mensaje para números mayores a 15
    mov edx, len_msg_greater  ; Longitud del mensaje
    int 0x80                  ; Llamada al sistema para imprimir el mensaje
    jmp end_if_else           ; Salta al final de la estructura if-else

lower_than_or_equal:

    mov eax, 4                ; Código de la llamada al sistema para imprimir mensaje
    mov ebx, 1                ; Descriptor de archivo para la salida
    mov ecx, msg_lower        ; Dirección del mensaje para números menores o iguales a 15
    mov edx, len_msg_lower    ; Longitud del mensaje
    int 0x80                  ; Llamada al sistema para imprimir el mensaje

end_if_else:

    mov eax, 1    ; Código de la llamada al sistema para salir del programa
    xor ebx, ebx  ; Limpia el registro ebx
    int 0x80      ; Se realiza la syscall de eax para salir del programa
    