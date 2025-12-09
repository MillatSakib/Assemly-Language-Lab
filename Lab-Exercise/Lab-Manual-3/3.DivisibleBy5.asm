; This program will check is the number are divisible by five or not

org 100h

.data
MSG     DB "Enter a digit (0-9): $"
DIVMSG  DB "The number is divisible by 5.$"
NOTMSG  DB "The number is NOT divisible by 5.$"
NEWLINE DB 0DH,0AH,"$"

.code
main proc

    mov ax, @data
    mov ds, ax

    ; Print input message
    mov ah, 09h
    lea dx, MSG
    int 21h

    ; Read single character
    mov ah, 01h
    int 21h
    sub al, 30h      ; Convert ASCII → digit
    xor ah, ah       ; Clear AH (important for DIV)

    ; Divide by 5
    mov bl, 5
    div bl           ; AH = remainder

    ; Print newline
    mov ah, 09h
    lea dx, NEWLINE
    int 21h

    ; Check remainder
    cmp ah, 0
    je PRINT_DIV

PRINT_NOT:
    mov ah, 09h
    lea dx, NOTMSG
    int 21h
    jmp EXIT_

PRINT_DIV:
    mov ah, 09h
    lea dx, DIVMSG
    int 21h

EXIT_:
    mov ah, 4Ch
    int 21h

main endp
end main