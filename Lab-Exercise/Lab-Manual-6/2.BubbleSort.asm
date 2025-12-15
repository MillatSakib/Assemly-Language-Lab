.model small
.stack 100h
.data
    space db " $"
    msg1 db 10,13,"Enter the elements of array: $"
    msg2 db 10,13,"Ascending: $"
    msg3 db 10,13,"Descending: $"

    arr  db 7 dup(?)
    n    db 7

.code
main proc
    mov ax, @data
    mov ds, ax

    call INPUT_ARRAY

    call BUBBLE_ASC
    lea dx, msg2
    mov ah, 09h
    int 21h
    call PRINT_ARRAY

    call BUBBLE_DESC
    lea dx, msg3
    mov ah, 09h
    int 21h
    call PRINT_ARRAY

    mov ah, 4Ch
    int 21h
main endp

; -------------------------------
; INPUT ARRAY PROCEDURE
; -------------------------------
INPUT_ARRAY proc
    lea dx, msg1
    mov ah, 09h
    int 21h

    mov cx, 7
    mov si, 0

IN_LOOP:
    mov ah, 01h
    int 21h
    sub al, '0'
    mov arr[si], al
    inc si
    
    mov ah,09h
    lea dx,space
    int 21h
    loop IN_LOOP
    ret
INPUT_ARRAY endp

; -------------------------------
; BUBBLE SORT ASCENDING
; -------------------------------
BUBBLE_ASC proc
    mov cl, n
    dec cl

OUTER1:
    mov si, 0
    mov ch, cl

INNER1:
    mov al, arr[si]
    mov bl, arr[si+1]
    cmp al, bl
    jbe NO_SWAP1

    mov arr[si], bl
    mov arr[si+1], al

NO_SWAP1:
    inc si
    dec ch
    jnz INNER1
    dec cl
    jnz OUTER1
    ret
BUBBLE_ASC endp

; -------------------------------
; BUBBLE SORT DESCENDING
; -------------------------------
BUBBLE_DESC proc
    mov cl, n
    dec cl

OUTER2:
    mov si, 0
    mov ch, cl

INNER2:
    mov al, arr[si]
    mov bl, arr[si+1]
    cmp al, bl
    jae NO_SWAP2

    mov arr[si], bl
    mov arr[si+1], al

NO_SWAP2:
    inc si
    dec ch
    jnz INNER2
    dec cl
    jnz OUTER2
    ret
BUBBLE_DESC endp

; -------------------------------
; PRINT ARRAY PROCEDURE
; -------------------------------
PRINT_ARRAY proc
    mov cx, 7
    mov si, 0

PRINT_LOOP:
    mov dl, arr[si]
    add dl, '0'
    mov ah, 02h
    int 21h

    mov dl, ' '
    int 21h

    inc si
    loop PRINT_LOOP
    ret
PRINT_ARRAY endp

end main