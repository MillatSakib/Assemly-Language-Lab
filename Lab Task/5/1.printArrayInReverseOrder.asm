include 'emu8086.inc' 
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; This program will print the element of array in reverse order

org 100h

; add your code here   

.DATA
array db 3,5,6,7,6,1
space db " $"
                    
                   
.CODE              
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV SI, OFFSET array
    MOV CX,6
    
    print 'Your Array Values: '
    ADD SI,5
    repeat:
        
        ;get the first element
        MOV DL,[SI]  ; without [] that will return index
        ;make ascii output
        ADD DL, 48
        ; print on terminal
        MOV AH,02H
        INT 21H
        
        ;CODE FOR ADDING SPACE
        MOV AH,09H
        LEA DX, space
        INT 21H
        DEC SI
        
        ;call loop
        LOOP repeat   
ret