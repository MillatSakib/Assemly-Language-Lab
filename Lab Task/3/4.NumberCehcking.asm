; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.DATA
MSG DB "Enter an one digit number: $"
POSITIVE DB "THE NUMBER IS POSITIVE $"
NEGETIVE DB "THE NUMBER IS NEGETIVE $"
ZERO DB "THE NUMBER IS ZERO $"
NEWLINE DB 0DH,0AH,"$"



.CODE
MAIN PROC 
    ;DATA CONNCETION    
    MOV AX,@DATA
    MOV DS,AX
    
    
     ;PRINT THE INPUT MESSAGE
     MOV AH,09H
     LEA DX,MSG
     INT 21H
     
     ;TAKE INPUT
     MOV AH,01H
     INT 21H;
     SUB AL,48
     MOV AH,0 ;CLEAR THE AH REGISTER
     
     
     MOV BH,0
     CMP AL,BH 
       
       
      ;TAKE NEW LINE
      MOV AH,09H
      LEA DX,NEWLINE
      INT 21H  
        
        
      ;COMMAND FOR EXTRA SPACE REMOVE
      MOV AH, 02
      MOV DX,13
      INT 21H  
      
     JE ZERO_
     JL NEGETIVE_ 
     
     ;CODE FOR PRINT POSITIVE
     MOV AH,09H
     LEA DX,POSITIVE 
     INT 21H    

     
     JMP END_  ; JUMP TO END_
     
     
     ; CODE FOR PRINT ZERO
     ZERO_:
     MOV AH,09H
     LEA DX,ZERO
     INT 21H
     JMP END_
     
     ; CODE FOR PRINT NEGETIVE
     NEGETIVE_:
     MOV AH,09H
     LEA DX,NEGETIVE
     INT 21H
     END_:  
     
     
    ; terminate program   
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
ret