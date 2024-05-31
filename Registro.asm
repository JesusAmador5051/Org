section .data
    numero1 dd 5        ; Se define numero1 con valor de 5
    numero2 dd 7        ; Se define numero2 con valor de 7
    resultado dd 0      ; Se define el resultado inicializado en 0

section .text
    global _start       ; Marca el inicio del programa 

_start:
    mov eax, numero1     ; Copia el valor de numero1 en el registro eax
    add eax, 4           ; Añade el desplazamiento de numero2
    mov eax, [eax]       ; Carga el valor de la ubicación de memoria señalada por eax
    add eax, [numero2]   ; Añade el valor de numero2 directamente
    mov [resultado], eax ; Almacena el resultado en la ubicación de memoria de resultado

    mov eax, 1           ; Carga el numero 1 de la syscall en eax para finalizar el programa
    xor ebx, ebx         ; Limpia el registro ebx
    int 0x80             ; Se realiza la syscall de eax para salir del programa
