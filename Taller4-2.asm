section .data
   msg db "Ingresa dos numeros de un digito:  ", 0
   len equ $ - msg
   result db "El resultado es: ",0
   len_result equ $ - result

section .bss
  num1 resb 2
  num2 resb 2
  res resb 1

section .text
  global _start

_start:

  mov eax, 4     ; syscall número (write)
  mov ebx, 1     ; file descriptor (stdout)
  mov ecx, msg   ; puntero al mensaje
  mov edx, len   ; longitud del mensaje
  int 0x80

  mov eax, 3     ; syscall número (read)
  mov ebx, 0     ; file descriptor (stdin)
  mov ecx, num1  ; puntero al espacio reservado para el primer número
  mov edx, 2
  int 0x80

  mov eax, 3     ; syscall (read)
  mov ebx, 0     ; file descriptor (stdin)
  mov ecx, num2
  mov edx, 2
  int 0x80

  mov al, [num1] ; Carga el primer número ingresado en AL
  sub al, '0'
  mov bl, [num2] ; Carga el segundo número ingresado en BL
  sub bl, '0'

  add al, bl
  add al, '0'

  mov [res], al  ; Guarda el resultado de la suma de las variable

  mov eax, 4     ; syscall (write)
  mov ebx, 1     ; file descriptor (stdout)
  mov ecx, result
  mov edx, len_result
  int 0x80

  mov eax, 4     ; syscall (write)
  mov ebx, 1     ; file descriptor (stdout)
  mov ecx, res
  mov edx, 1
  int 0x80

mov eax, 1
xor ebx, ebx
int 0x80