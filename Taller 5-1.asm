nombre_archivo db "archivo.txt", 0
longitud_archivo equ $-nombre_archivo

; 1. Instrucciones de segmento:

; Leer un valor de la memoria utilizando un segmento de datos
mov EAX, [DS:0x1000] ; Carga el valor de la dirección 0x1000 del segmento de datos en EAX
; Escribir un valor en la memoria utilizando un segmento extra
mov [ES:0x2000], EAX ; Almacena el valor de EAX en la dirección 0x2000 del segmento extra

; 2. Instrucciones de E/S direccionadas por puerto:

in AL, 0x3F8 ; Lee un byte del puerto de E/S 0x3F8 en AL
mov DX, 0xAB
out DX, 0x200 ; Escribe el valor de DX en el puerto de E/S 0x200

; 3. Interrupciones de software:

int 80h ; Genera una interrupción de software con el número 80h 

; 4. Llamadas a funciones del sistema:

; Abrir archivo 
mov EAX, 4 ; Código de función del sistema para abrir un archivo
mov EBX, offset nombre_archivo ; Puntero al nombre del archivo
mov ECX, longitud_archivo ; Longitud del nombre del archivo
int 80h ; Llamada a la función del sistema para abrir un archivo

; Salir del programa
mov EAX, 1 ; Código de salida
mov EBX, 0 ; Parámetro de salida (0 para éxito)
int 80h