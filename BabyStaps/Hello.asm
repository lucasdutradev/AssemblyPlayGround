section .data
    hi db 'Hello World!', 0xA
    length equ $- hi

section .text

global _start

_start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, hi
    mov edx, length
    int 0x80

    mov eax, 0x1
    mov ebx, 0x0
    int 0x80