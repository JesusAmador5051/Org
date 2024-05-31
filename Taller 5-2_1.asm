; Definir prototipo de la función C
extern _printf ; Prototipo de la función C '_printf'

; Definir variables
nombre db "Mundo", 0

; Llamar a la función C '_printf' para imprimir "Hola Mundo"
mov EAX, 4 ; Código de función del sistema para escribir en la consola
mov EBP, offset nombre ; Puntero al mensaje a imprimir
mov ECX, $-nombre ; Longitud del mensaje
int 80h ; Llamada a la función del sistema para escribir en la consola