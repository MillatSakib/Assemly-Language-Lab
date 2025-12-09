;Program for take two charecter input and print them to reverse order

org 100h

.data

msg_1 DB 'Enter the first capital letter: $';first input message
msg_2 DB 'Enter the second capital letter: $' ;second input message 
msg_3 DB 'The given capital leters in alphabetical order are: $' ;The output message

NEXT DB 0DH,0AH,"$"
SPACE DB "  $"

A DB ?
B DB ?



.code

MAIN PROC 
    
    ;CONNECT THE DATA WITH CODE SEGMENT
    mov ax, @data
    mov ds, ax

    ; print fitst input message
    mov ah, 09h
    lea dx, msg_1
    int 21h

    ; read first digit
    mov ah, 01h
    int 21h
    mov A, al

    ;PRINT NEW LINE
    MOV AH, 09H
    LEA DX, NEXT
    INT 21H
      
    ; print second input message
    MOV AH,09H
    LEA DX, msg_2
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
     LEA DX, msg_3 
     INT 21H
     
     
     ;CONDITION
     MOV AH,02H
     
     
     MOV BL,A
     MOV BH,B
     
     
     ;CODE FOR PRINT INTO REVERSE ORDER
     Larger_:
     MOV DL,BH
     INT 21H
     
     MOV AH,09
     LEA DX,SPACE  
     INT 21H
     MOV AH, 02H
     
     MOV DL,BL
     INT 21H
     
  
    ; terminate program   
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
end MAIN