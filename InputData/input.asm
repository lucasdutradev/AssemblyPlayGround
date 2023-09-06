segment .data

    LF        equ 0xA  ; Line Feed
    NULL      equ 0xD  ; End string

    SYS_CALL  equ 0x80 ; Send information to SO

    ; This values we´ll send to EAX -------------------
    SYS_EXIT  equ 0x1  ; Code for call finish program |
    SYS_READ  equ 0x3  ; Operation of read            |
    SYS_WRITE equ 0x4  ; Operation of write           |
    ; -------------------------------------------------

    ; This values we´ll send to EBX -------------------------
    RET_EXIT  equ 0x0  ; Operation realized with success    |
    STD_IN    equ 0x0  ; Operation represent a default entry|
    STD_OUT   equ 0x1  ; Operation represent a default exit |
    ; -------------------------------------------------------

section .data
    msg db "Type it your name:", LF, NULL
    tam equ $- msg

section .bss
    name resb 1

section .text

global _start

_start:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg
    mov EDX, tam
    int SYS_CALL

    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, name
    mov EDX, 0xA
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL