section .data
mensaje db "Este mensaje se va a acortar, o no",10

section .text
global _start

_start:

  mov eax, 4
  mov ebx, 1
  mov ecx, mensaje
  mov edx, 34
  int 0x80
  
  mov eax, 1
  xor ebx, ebx
  int 0x80