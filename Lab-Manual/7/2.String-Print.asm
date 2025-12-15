; Macro for string print

MDSPLY_STRING MACRO STRING
    MOV DX, OFFSET STRING
    
    MOV AH,09H
    INT 21H
ENDM

ORG 100H

.DATA
    MESSAGE1 DB 'Microprocessors and $'
    MESSAGE2 DB 'Microcontrollers lab $'                

.CODE 
    MAIN PROC
        MOV AX,@DATA
        MOV DS, AX
        
        MDSPLY_STRING MESSAGE1
        MDSPLY_STRING MESSAGE2
        
        
        MOV AH,4CH
        INT 21H
        
        MAIN ENDP
END MAIN