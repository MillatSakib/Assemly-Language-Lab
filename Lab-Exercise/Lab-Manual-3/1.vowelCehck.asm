; Here user will give input and the program will decide that the charecter are either vowel or cosonant.

org 100h

.data
MSG     DB "Enter a character: $"
VMSG    DB "It is a vowel.$"
CMSG    DB "It is consonant.$"
NEWLINE DB 0DH,0AH,"$"

.code
main proc

    ; initialize DS
    mov ax, @data
    mov ds, ax

    ; print input message
    mov ah, 09h
    lea dx, MSG
    int 21h

    ; take character input
    mov ah, 01h
    int 21h
    mov bl, al          ; save input in BL

    ; print newline
    mov ah, 09h
    lea dx, NEWLINE
    int 21h

    ; convert lowercase to uppercase if needed
    cmp bl, 'a'
    jb  CHECK           ; if < 'a', skip conversion
    cmp bl, 'z'
    ja  CHECK           ; if > 'z', skip conversion
    sub bl, 20h         ; convert to uppercase

CHECK:
    ; Check for vowels: A, E, I, O, U
    cmp bl, 'A'
    je  PRINT_VOWEL
    cmp bl, 'E'
    je  PRINT_VOWEL
    cmp bl, 'I'
    je  PRINT_VOWEL
    cmp bl, 'O'
    je  PRINT_VOWEL
    cmp bl, 'U'
    je  PRINT_VOWEL

    ; Not a vowel
    mov ah, 09h
    lea dx, CMSG
    int 21h
    jmp END_

PRINT_VOWEL:
    mov ah, 09h
    lea dx, VMSG
    int 21h

END_:
    mov ah, 4Ch
    int 21h

main endp
end main