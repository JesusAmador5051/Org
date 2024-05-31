%macro print_int 1  ; Define una macro llamada print_int que imprimirá un entero
    mov eax, 4      ; Carga el código de la llamada al registro eax para escribir el entero
    mov ebx, 1      ; Configura el registro ebx en 1 para el formato de la salida
    mov ecx, %1     ; Mueve el primer parametro a ecx para imprimirlo
    mov edx, 4      ; Configura la longitud del entero a imprimir
    int 0x80        ; Llamada al sistema para imprimir el entero
%endmacro

section .data      
    array dd 1, 2, 3, 4, 5 ; Se declara un arreglo de enteros

section .text       
    global _start   ; Marca el inicio del programa

_start:             
    mov ecx, 0      ; Inicializa el contador del bucle en 0 
    mov eax, 0      ; Inicializa el acumulador de la suma en 0

bucle:              ; Marca el inicio del bucle de suma
    mov ebx, [array + ecx*4]  ; Carga el valor del elemento actual del arreglo en ebx
    add eax, ebx   ; Suma el valor del elemento actual (ebx) al acumulador en eax

    inc ecx        ; Incrementa el contador del bucle 
    cmp ecx, 5     ; Compara el contador con 5 para verificar que puede entrar denuevo
    jl bucle       ; Si ecx es menor que 5, vuelve a saltar al inicio del bucle

    print_int eax  ; Llama a la macro print_int para imprimir la suma en eax

    mov eax, 1     ; Carga el numero 1 de la syscall en eax para finalizar el programa
    xor ebx, ebx   ; Limpia el registro ebx
    int 0x80       ; Se realiza la syscall de eax para salir del programa
