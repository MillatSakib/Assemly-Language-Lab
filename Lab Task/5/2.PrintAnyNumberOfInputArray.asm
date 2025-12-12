include 'emu8086.inc' 

; Question
; Write an assembly language code to :
; Take any number of inputs in an array.
; Print out the elements in an array.

org 100h

; add your code here   

.DATA
array db ?
space db " $" 
NEWLINE DB 0DH,0AH,"$"
msg db "Enter the number of array element to input: $"
msg1 DB "Enter the array: $"                    
size DW ?
odd-sum DB ?
even-sum DB ?
                   
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
        MOV array[SI],AL
         
         
        ;CODE FOR ADDING SPACE
        MOV AH,09H
        LEA DX,space
        INT 21H
        
        
        INC SI
        
        ;run loop
        LOOP read_input  
        
        
        
        
        
        
        
        
        MOV SI,OFFSET array
        MOV CX,size
         
         ;print new line 
        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H 
         
        print 'Your Array Values: '
    
        even-odd-sum:
        
        ;get the first element
        MOV DL,array[SI]  ; without [] that will return index
        
        ; print on terminal
        MOV AH,02H
        INT 21H
        
        ;CODE FOR ADDING SPACE
        MOV AH,09H
        LEA DX,space
        INT 21H
        INC SI
        
        ;call loop
        LOOP even-odd-sum  
         
ret