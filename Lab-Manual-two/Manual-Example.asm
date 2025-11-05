
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; This is the code for a basic summision using variable and give output on the terminal
org 100h

.DATA
A DW 2
B DW 2
RESULT DW  ? 
MSG DW "SUM IS: $"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    ; FROM HERE CODE FOR MULITPLY TWO NUMBER CODE
    
    MOV AX,A
    MUL B  
    ADD AX,48
    MOV RESULT, AX
    
    LEA DX,MSG
    MOV AH,09
    INT 21H 
    
    MOV DX,RESULT
    MOV AH,02
    INT 21H
    
    RET

