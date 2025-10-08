
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; this is code of divission 
MOV AX, 50
MOV BX, 3 
DIV BX

; this is code of multipllication
ret




