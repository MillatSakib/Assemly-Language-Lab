;this program will take an input of array element and divide them into two array odd and even array


.model small
.stack 100h
.data
    msg1 db 10,13,"Enter array elements: $"
    msg2 db 10,13,"ODD Digits: $"
    msg3 db 10,13,"EVEN Digits: $"

    arr db 6 dup(?)
    n   db 6

.code

; -------------------------------
; MACRO TO PROCESS ARRAY
; -------------------------------
PROCESS_ARRAY MACRO arr_addr, count
    lea si, arr_addr
    mov cl, count
    call SEPARATE_ODD_EVEN
ENDM

main proc
    mov ax, @data
    mov ds, ax

; ---------- INPUT ----------
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov cx, 6
    mov si, 0

INPUT_LOOP:
    mov ah, 01h
    int 21h
    sub al, '0'
    mov arr[si], al
    inc si
    loop INPUT_LOOP

; ---------- CALL MACRO ----------
    PROCESS_ARRAY arr, n

    mov ah, 4Ch
    int 21h
main endp

; -------------------------------
; PROCEDURE: SEPARATE ODD & EVEN
; -------------------------------
SEPARATE_ODD_EVEN proc

; ----- PRINT ODD -----
    lea dx, msg2
    mov ah, 09h
    int 21h

    push si
    push cx

ODD_LOOP:
    mov al, [si]
    test al, 01h
    jz NOT_ODD

    mov dl, al
    add dl, '0'
    mov ah, 02h
    int 21h

    mov dl, ' '
    int 21h

NOT_ODD:
    inc si
    loop ODD_LOOP

    pop cx
    pop si

; ----- PRINT EVEN -----
    lea dx, msg3
    mov ah, 09h
    int 21h

EVEN_LOOP:
    mov al, [si]
    test al, 01h
    jnz NOT_EVEN

    mov dl, al
    add dl, '0'
    mov ah, 02h
    int 21h

    mov dl, ' '
    int 21h

NOT_EVEN:
    inc si
    loop EVEN_LOOP

    ret
SEPARATE_ODD_EVEN endp

end main