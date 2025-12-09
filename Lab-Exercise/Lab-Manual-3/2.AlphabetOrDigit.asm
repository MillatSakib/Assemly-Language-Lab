;This will take an input as charecter and findout either it is a charecter or it is a digit

org 100h

.data
MSG     DB "Enter a character: $"
ALPMSG  DB "It is an alphabet.$"
DIGMSG  DB "It is a digit.$"
OTHERMSG DB "It is neither alphabet nor digit.$"
NEWLINE DB 0DH,0AH,"$"

.code
main proc

    ; initialize DS
    mov ax, @data
    mov ds, ax

    ; print prompt
    mov ah, 09h
    lea dx, MSG
    int 21h

    ; take character input
    mov ah, 01h
    int 21h
    mov bl, al      ; save input

    ; print newline
    mov ah, 09h
    lea dx, NEWLINE
    int 21h

    ; ----- CHECK DIGIT (0–9) -----
    cmp bl, '0'
    jb  CHECK_ALPHA     ; if < '0', skip
    cmp bl, '9'
    jbe PRINT_DIGIT     ; if 0–9 → digit

CHECK_ALPHA:
    ; ----- CHECK UPPERCASE A–Z -----
    cmp bl, 'A'
    jb  PRINT_OTHER
    cmp bl, 'Z'
    jbe PRINT_ALPHA

    ; ----- CHECK LOWERCASE a–z -----
    cmp bl, 'a'
    jb  PRINT_OTHER
    cmp bl, 'z'
    jbe PRINT_ALPHA

    ; ----- NOT ALPHABET OR DIGIT -----
PRINT_OTHER:
    mov ah, 09h
    lea dx, OTHERMSG
    int 21h
    jmp END_

PRINT_DIGIT:
    mov ah, 09h
    lea dx, DIGMSG
    int 21h
    jmp END_

PRINT_ALPHA:
    mov ah, 09h
    lea dx, ALPMSG
    int 21h

END_:
    mov ah, 4Ch
    int 21h

main endp
end main