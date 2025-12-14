
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; This program will print the hello world message using procedure


org 100h

.DATA
StrArray DB 'Hello World!!$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    
    LEA DX, StrArray
    CALL USER
    
    MOV AH,4CH
    MOV AL,00H  ; A code after procedure call and return
    INT 21H ;exit to DOS
    
    MAIN ENDP

USER PROC   ;declare a procedure named user
MOV AH,09H
INT 21H


RET  ;return to MAIN procedure
USER ENDP  ;end of procedure user
END MAIN   ;end of program

ret 