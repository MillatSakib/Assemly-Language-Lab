
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Here we declare variable

.DATA
A DB 5
B DB 3
C DB ?  ; value declared but value not assigned
msg DB 'Result: $'

; Here we work with variable

.CODE 
MOV AX, @DATA      ; THIS IS IS FIXED FOR DATA CONNECTION WITH CODE
MOV DS, AX         ; THIS IS IS FIXED FOR DATA CONNECTION WITH CODE
;This connects the data segment to your program so you can use variables correctly.

MOV AL, A
ADD AL, B
MOV C, AL   ; store result (8) in variable C

; Print message
LEA DX, msg
MOV AH, 09h
INT 21h



; Print result (convert to ASCII)
MOV AL, C
ADD AL, 30h     ; convert number to ASCII
MOV DL, AL      ;before print inturupt we have to transfer data to Dl register because DL or DX register is use to print.
MOV AH, 02h
INT 21h
ret




