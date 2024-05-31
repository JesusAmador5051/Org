section .data
    numero1 dd 5         ; Se define numero1 con valor de 5
    numero2 dd 7         ; Se define numero2 con valor de 7
    resultado dd 0       ; Se define el resultado inicializado en 0

section .text
    global _start        ; Marca el inicio del programa 

_start:
    mov ebx, numero1     ; Se carga la dirección de memoria de numero1 en el registro ebx
    mov eax, [ebx]       ; Mueve el valor de la dirección de memoria apuntada por ebx a eax
    add ebx, 4           ; Se avanza a la siguiente posición de memoria
    add eax, [ebx]       ; Se suma el valor almacenado en la siguiente posición de memoria a eax
    mov [resultado], eax ; Se guarda el resultado en la variable resultado


    mov eax, 1           ; Carga el numero 1 de la syscall en eax para finalizar el programa
    xor ebx, ebx         ; Limpia el registro ebx
    int 0x80             ; Se realiza la syscall de eax para salir del programa
