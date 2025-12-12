; This program will give the summition of array element which it will be taken.

org 100h

.DATA
A   DB 3,1,2,2,1
B   DB 00H
MSG DB 'ENTER THE VALUE OF N(Range:1-5): $'
NEWLINE DB 0DH,0AH,"$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX,0
    MOV SI, OFFSET A
    MOV DI, OFFSET B    

    ;print message
    ;MOV DX, OFFSET MSG
    MOV AH, 09H
    LEA DX,MSG
    INT 21H

    ;take input
    MOV AH, 01H
    INT 21H
    MOV CL, AL
    SUB CL, 48        ; convert ASCII to number

    MOV AL,0       

Loop_1:
    ADD AL, [SI]      ; add array element
    INC SI            ; move to next element
    LOOP Loop_1       ; loop CL times

    MOV BL, AL
    ADD BL, 48        ; convert to ASCII
    
    
   
    
    
    
    
    ; print newline
    MOV AH, 09H
    LEA DX,NEWLINE
    INT 21H

    ; print result 
    MOV AH,02H
    MOV DL, BL
    INT 21H

MAIN ENDP
END MAIN
