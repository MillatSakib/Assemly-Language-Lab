
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; Here we declare variable

.DATA
A DB 5
B DB 3
C DB ?  ; value declared but value not assigned


; Here we work with variable

.CODE 
MOV AX, @DATA      ; THIS IS IS FIXED FOR DATA CONNECTION
MOV DS, AX         ; THIS IS IS FIXED FOR DATA CONNECTION


MOV AL, A
ADD AL, B

ret




