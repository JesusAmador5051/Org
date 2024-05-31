#include <stdio.h>

int main()
{
    int a = 10, b = 20, sum;

    // Inline assembly para sumar 'a' y 'b'
    __asm__(
        "movl %1, %%eax;"    // Mueve el valor de 'a' al registro EAX
        "movl %2, %%ebx;"    // Mueve el valor de 'b' al registro EBX
        "addl %%ebx, %%eax;" // Suma el valor en EBX al valor en EAX
        "movl %%eax, %0;"    // Mueve el resultado (ahora en EAX) a 'sum'
        : "=r"(sum)          // Output operand: 'sum' se asigna a un registro de propósito general
        : "r"(a), "r"(b)     // Input operands: 'a' y 'b' se asignan a registros de propósito general
        : "%eax", "%ebx"     // Clobbered registers: EAX y EBX se utilizarán y modificarán
    );

    printf("La suma de %d y %d es %d\n", a, b, sum);
    return 0;
}
