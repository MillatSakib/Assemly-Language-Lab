; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; This program take an input from user and chech wheather is it even or odd

org 100h
.DATA
MSG DB "Enter an one digit number: $"
ODD DB "THE NUMBER IS ODD $"
EVEN DB "THE NUMBER IS EVEN $"
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
     
     
     ;DEVIDE BY 2
     MOV BL,2
     DIV BL

     
     MOV BH,1
     CMP AH,BH 
       
       
      ;TAKE NEW LINE
      MOV AH,09H
      LEA DX,NEWLINE
      INT 21H  
        
        
      ;COMMAND FOR EXTRA SPACE REMOVE
      MOV AH, 02
      MOV DX,13
      INT 21H  
      
     JE ODD_ 
     
     ;CODE FOR PRINT EVEN
     MOV AH,09H
     LEA DX,EVEN 
     INT 21H    

     
     JMP END_  ; JUMP TO END_
     
     
     ; CODE FOR PRINT ODD
     ODD_:
     MOV AH,09H
     LEA DX,ODD
     INT 21H
     END_:  
     
     
    ; terminate program   
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN
ret