section .data
    numero1 dd 5            ; Se define numero1 con valor de 5
    numero2 dd 7            ; Se define numero2 con valor de 7
    resultado dd 0          ; Se define el resultado inicializado en 0

section .text
global _start               ; Marca el inicio del programa

_start:
    mov ebx, resultado      ; Se carga la dirección de memoria de resultado en ebx
    mov eax, [numero1]      ; Se carga el valor almacenado en numero1 en eax
    add eax, [numero2]      ; Se suma el valor almacenado en numero2 a eax
    add ebx, eax            ; Se suma el valor de eax a la dirección de memoria de resultado
    mov [ebx], eax          ; Se guarda el resultado en la dirección de memoria calculada

    mov eax, 1              ; Carga el número 1 de la syscall en eax para finalizar el programa
    xor ebx, ebx            ; Limpia el registro ebx
    int 0x80                ; Se realiza la syscall de eax para salir del programa
