include 'emu8086.inc' 

; Question
; Write an assembly language code to :
; Take any number of inputs in an array.
; Print out the elements in an array.

org 100h

; add your code here   

.DATA
array db 10 dup(1)
space db " $" 
NEWLINE DB 0DH,0AH,"$"
msg db "Enter the number of array element to input: $"
msg1 DB "Enter the array: $"    
msg2 DB "Avarage = $"
msg3 DB "Largest = $"
msg4 DB "Smallest = $"                
size DW ?
largest DB 0
smallest DB 255    
sum DB 0
                   
.CODE              
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
 
    ;print the message for ask array size
    MOV AH,09H
    LEA DX,msg
    INT 21H
    
    ;take input of array size
    MOV AH,01H
    INT 21H
    SUB AL,48
     
    ;store the value array size      
    MOV AH,0
    MOV size,AX 
    
    ;print new line 
    MOV AH,09H
    LEA DX, NEWLINE
    INT 21H
 
    ;print the message for ask array element
    MOV AH,09H
    LEA DX,msg1
    INT 21H
    
    MOV SI,OFFSET array
    MOV CX,size
    
    
    read_input:
        
        ;get the starting address of the array
        
        ;Take input 
        MOV AH,01H
        INT 21H
        ;store the value inside array
        MOV [SI],AL
        
        CALL SUMMATION
        CALL LARGESTT
        CALL SMALLESTT 
         
        ;CODE FOR ADDING SPACE
        MOV AH,09H
        LEA DX,space
        INT 21H
        
        
        INC SI
        
        ;run loop
        LOOP read_input 
        
        CALL PRINT_ALL 
        
         
ret       


SUMMATION PROC
MOV BL,sum
MOV BH,AL
SUB BH,48    
ADD BL,BH
MOV SUM,BL
RET
SUMMATION ENDP




LARGESTT PROC
MOV BL,largest 
MOV BH,AL
SUB BH,48 
CMP BH,BL
JA update
JMP end_
update:
MOV largest,BH  

end_:
RET
LARGESTT ENDP






SMALLESTT PROC
MOV BL,smallest
MOV BH,AL
SUB BH,48  
CMP BH,BL
JB update1
JMP end1_
update1:
MOV smallest,BH     
end1_:
RET
SMALLESTT ENDP        


PRINT_ALL PROC  
    
    
;print new line
MOV AH,09H
LEA DX, NEWLINE
INT 21H

;print the message for ask array element
MOV AH,09H
LEA DX,msg2
INT 21H

MOV AX,0
MOV AL,sum
MOV BX,size 
MOV BH,0
DIV BL  
ADD AL,48


MOV AH,02H
MOV DL,AL
INT 21H


;print new line
MOV AH,09H
LEA DX, NEWLINE
INT 21H

;print the message for ask array element
MOV AH,09H
LEA DX,msg3
INT 21H


MOV AL,largest
ADD AL,48
MOV AH,02H
MOV DL,AL
INT 21H

;print new line
MOV AH,09H
LEA DX, NEWLINE
INT 21H

;print the message for ask array element
MOV AH,09H
LEA DX,msg4
INT 21H


MOV AL,smallest
ADD AL,48
MOV AH,02H
MOV DL,AL
INT 21H


RET
PRINT_ALL ENDP