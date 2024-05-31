section .data
    debug_msg db "Debugging message", 0xA  ; Definición del mensaje de depuración con un salto de línea al final
    debug_len equ $ - debug_msg            ; Longitud del mensaje calculada restando la dirección actual ($) menos la dirección de inicio de debug_msg

section .text
    global _start      

_start:                     
    mov eax, 4           ; Código de la llamada al sistema para escribir
    mov ebx, 1           ; Descriptor de archivo para la salida estándar (stdout)
    mov ecx, debug_msg   ; Dirección del mensaje de depuración
    mov edx, debug_len   ; Longitud del mensaje de depuración
    int 0x80             ; Interrupción para manejar la escritura de datos a stdout

    mov eax, 1           ; Código de la llamada al sistema para salir 
    xor ebx, ebx         ; Código de salida 0 
    int 0x80             ; Interrupción para llamar al kernel y terminar el programa
    
