section .data
    msg_lower db "El número es menor a 10", 0xA           ; Mensaje si es menor a 10
    len_msg_lower equ $ - msg_lower                       ; Longitud del mensaje anterior
    
    msg_greater db "El número es mayor o igual a 10", 0xA ; Mensaje si es mayor o igual a 10
    len_msg_greater equ $ - msg_greater                   ; Longitud del mensaje anterior


section .bss
    number resd 1         ; Reserva espacio en memoria para almacenar un entero 

%macro imprimir_mensaje 2 ; Definición del macro "imprimir_mensaje" con dos parámetros (if)
    mov eax, 4            ; Carga el valor de la llamada al sistema para imprimir en la consola
    mov ebx, 1            ; Carga el descriptor de archivo para la salida estándar 
    mov ecx, %1           ; Carga la dirección del mensaje pasado como primer argumento al macro
    mov edx, %2           ; Carga la longitud del mensaje pasado como segundo argumento al macro
    int 0x80              ; Realiza la llamada al sistema para imprimir el mensaje
%endmacro

section .text
    global _start   ; Marca el inicio del programa

_start:

    mov dword [number], 1     ; Asigna el valor 1 a la variable number

    mov eax, dword [number]   ; Carga el valor de 'number' en eax
    cmp eax, 10               ; Compara el valor de eax con 10
    jge greater_than_or_equal ; Si el número es mayor o igual a 10 salta a greater_than
    
    imprimir_mensaje msg_lower, len_msg_lower ; Imprime el mensaje de menor a 10
    jmp end_if_else           ; Salta al finla de la estructura if-else

greater_than_or_equal:

imprimir_mensaje msg_greater, len_msg_greater ; Imprime el mensaje de mayor o igual a 10

end_if_else:

    mov eax, 1    ; Código de la llamada al sistema para salir del programa
    xor ebx, ebx  ; Limpia el registro ebx
    int 0x80      ; Se realiza la syscall de eax para salir del programa
    