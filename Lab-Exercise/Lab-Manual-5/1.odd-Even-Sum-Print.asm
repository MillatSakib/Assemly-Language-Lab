org 100h

.DATA
array db 10 dup(?)       
space db " $" 
NEWLINE DB 0DH,0AH,"$"
msg db "Enter the number of array element to input: $"
msg1 DB "Enter the array: $"   
msg2 db "The sum of even list: $" 
msg3 db "The sum of odd list: $"  
msg4 dw "Your Array Values: $"               
size DW ?
temp db 0
odd_sum DB 0
even_sum DB 0
                   
.CODE              
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;Ask for the size of array
    MOV AH,09H
    LEA DX,msg
    INT 21H
    
    ;Take input
    MOV AH,01H
    INT 21H
    SUB AL,48
    MOV AH,0
    MOV size,AX 
    
    ;Print Newline
    MOV AH,09H
    LEA DX, NEWLINE
    INT 21H
    
    ;Ask for array element
    MOV AH,09H
    LEA DX,msg1
    INT 21H
    
    ;store the array first index and set counter for start loop
    MOV SI,OFFSET array
    MOV CX,size
    
read_input:
    ;take input array element
    MOV AH,01H
    INT 21H
    
    ;store the value inside array
    MOV [SI],AL          
    
    ;convert ascii to number and store in temp
    ;then reset the BX,AH regeter
    MOV BL,AL
    SUB BL,48
    MOV temp,BL
    MOV BX,0
    MOV AH,0
    
    ;find vagfor and vagsesh and store on register   
    ;here vagfor are on AL and vagsesh are on AH and BL
    MOV AL,temp
    MOV BL,2         
    DIV BL
    MOV BL,AH
    
    ;comparing between vagsesh and 1    
    MOV BH,1
    CMP BL,BH
    JE ODD 
    JMP EVEN

ODD:
    ;code to store on sum of odd value
    MOV AH,odd_sum
    ADD AH,temp          
    MOV odd_sum,AH
    JMP end_ 
        
EVEN: 
    ;;code to store on sum of even value
    MOV AH,even_sum 
    ADD AH,temp          
    MOV even_sum,AH

end_:
    ;print space
    MOV AH,09H
    LEA DX,space
    INT 21H
        
    INC SI  ;increment the value of SI
    LOOP read_input  ;LOOP iteration  
    
    
    ;here same thing like before for print the whole array
    
    MOV SI,OFFSET array
    MOV CX,size
         
    MOV AH,09H
    LEA DX,NEWLINE
    INT 21H 
         
    MOV AH,09H
    LEA DX,msg4
    INT 21H
    
output:
    MOV DL,[SI]
    MOV AH,02H
    INT 21H
        
    MOV AH,09H
    LEA DX,space
    INT 21H
    INC SI
    LOOP output
    
    
    MOV AH,09H
    LEA DX, NEWLINE
    INT 21H
    
    MOV AH,09
    LEA DX,msg2
    INT 21H
    
    MOV AL,odd_sum
    ADD AL,48
    MOV AH,02
    MOV DL,AL
    INT 21H  
    
    MOV AH,09H
    LEA DX, NEWLINE
    INT 21H
    
    MOV AH,09
    LEA DX,msg3
    INT 21H  
    
    MOV AL,even_sum
    ADD AL,48
    MOV AH,02
    MOV DL,AL
    INT 21H
              
ret 