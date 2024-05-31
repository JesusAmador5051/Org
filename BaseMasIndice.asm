section .data
    numero dd 42            ; Se define un numero
    resultado dd 0          ; Se define el resultado inicializado en 0

section .text
global _start               ; Marca el inicio del programa

_start:
    mov eax, 0              ; Se carga el índice (0, ya que solo hay un número)
    mov ebx, numero         ; Se carga la dirección de memoria del número en ebx
    mov eax, [ebx + eax]    ; Se suma el índice a la base y se accede al elemento correspondiente
    mov [resultado], eax    ; Se guarda el resultado en la variable resultado

    mov eax, 1              ; Carga el número 1 de la syscall en eax para finalizar el programa
    xor ebx, ebx            ; Limpia el registro ebx
    int 0x80                ; Se realiza la syscall de eax para salir del programa
