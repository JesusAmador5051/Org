; Definir función ensamblador 'saludar_mundo'
saludar_mundo:
  push EBP ; Guardar puntero de marco
  mov EBP, ESP ; Establecer puntero de marco
  mov EAX, [EBP+4] ; Obtener el puntero al mensaje pasado desde C
  mov EDX, [EAX] ; Obtener el primer carácter del mensaje
  ciclo:
    cmp EDX, 0 ; Comprobar si el carácter es nulo
    je fin_ciclo ; Si es nulo, salir del ciclo
    mov AL, EDX ; Cargar el carácter en AL
    int 80h ; Escribir el carácter en la consola
    inc EAX ; Avanzar al siguiente carácter
    jmp ciclo ; Continuar el ciclo
  fin_ciclo:
  pop EBP ; Restaurar puntero de marco
  ret ; Retornar a la función C

; Definir prototipo de la función C
extern int main(void);
