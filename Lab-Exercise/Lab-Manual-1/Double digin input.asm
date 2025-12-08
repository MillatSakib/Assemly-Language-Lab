; This is the program which will take double digit input from user and show sum of that. The limitation it can't sum the number 9+1 because of ascii value


org 100h

.data

A DB ?
B DB ?
SUM DB ? 


SPACE DB "  $"
NEXT DB 0DH, 0AH,"$"
INmSG DB "Please give two digit input: $"
OUTmSG DB "Sum of two digit is: $"




.code

MAIN PROC 
    
    ;CONNECT THE DATA WITH CODE SEGMENT
    mov ax, @data
    mov ds, ax

    ; print input message
    mov ah, 09h
    lea dx, INmSG
    int 21h

    ; read first digit
    mov ah, 01h
    int 21h
    mov A, al
    
    ;add an space between two digit
    MOV AH,09H
    LEA DX, SPACE
    INT 21H
    
    ; read second digit
    mov ah, 01h
    int 21h
    mov B, al
     
     
     ;PRINT NEW LINE
     MOV AH, 09H
     LEA DX, NEXT
     INT 21H
     
     
     ;COMMAND FOR EXTRA SPACE REMOVE
     MOV AH, 02
     MOV DX,13
     INT 21H
     
     
     ;PRINT OUTPUT MESSAGE
     MOV AH,09H
     LEA DX, OUTmSG 
     INT 21H
     
     
    
    ;summing  
    MOV AH, A 
    SUB AH,48
    MOV BH, B
    SUB BH,48
    ADD AH,BH
    MOV BH,AH   
    
    
    ;PRINT THE RESULT
     MOV AH, 02
     ADD BH,48
     MOV DL, BH
     INT 21H
    ; terminate program
MAIN ENDP
end MAIN