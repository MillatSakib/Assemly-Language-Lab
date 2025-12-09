; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.DATA
N DB ?

MSG1 DB "Enter The range of summition: $"
MSG2 DB "The summission of the range is: $" 


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV AH,09H
    LEA DX, MSG1
    INT 21H
    
    MOV AH,01H
    INT 21H 
    SUB AL,48
    MOV N,AL
    MOV BL,0
    
    MOV CX,0
    MOV CL, AL
    
    START: ADD BL, CL   ; LOOPING START
    LOOP START ; CL DECREMENTS AUTOMATICALLY
    
    MOV AX,0
    MOV AL,BL
    ADD AL,48
    MOV AH, 02H
    INT 21H   
    
    
    MAIN ENDP
    END MAIN

ret