; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Print the summission of a seris number 


org 100h

.DATA
N DB ?
NEWLINE DB 0DH,0AH,"$"
MSG1 DB "Enter The range of summition: $"
MSG2 DB " The summission of the range is: $" 


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
    
    ; Reset BL and CX register
    MOV BL,0
    MOV CX,0
    
    
    MOV CL, AL
    
    START: ADD BL, CL   ; LOOPING START
    LOOP START ; CL DECREMENTS AUTOMATICALLY
    
    ;PRINT THE NEW LINE
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H 
    
    
    ;PRINGTHE MESSAGE 2
    MOV AH,09H
    LEA DX,MSG2
    INT 21H
    
    MOV AX,0
    MOV AL,BL
    MOV BL,10
    DIV BL
    MOV BL,AL
    MOV BH,AH
    
    
    ;PRINT THE NUMEBR
    
    ADD BL,48
    MOV AH, 02H  
    MOV DL,BL
    INT 21H  
    
    
    ADD BH,48
    MOV AH, 02H  
    MOV DL,BH
    INT 21H  
    
    
    MAIN ENDP
    END MAIN

ret