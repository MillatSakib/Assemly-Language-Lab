;This will take an input. Store it on variable and Give output with newline with remove space before new line

; We use DB as we store on 8bit data in register



org 100h
.data
A DB ?      ; Taked a un-initialized variable. DB(Define Byte) are use for store 8bit data. Which are 0-255

B DB 2     ; Taked a variable with initialized value.


MSG DB "YOU ENTERED: $"

.code
MAIN PROC

MOV AX,@DATA     ;This line and next line is for Data connection
MOV DS,AX

MOV AH,01H       ;This line is for input and next line is for inturuption
INT 21H

MOV A,AL         ;As we work with 8 bit register so the input data will
                 ;store on AL register
                 
MOV AH,02H        ;This is for(02) output inturupt
MOV DL,10         ;When the inturupt are called then it found the value of
                  ;dl register for instruction. For new Line we use (10) on ascii
                  ;So we use 10 for new line
INT 21H           ;inturupt calling

MOV AH,02h
MOV DL, 13        ; for removing unnecessary space
int 21h


MOV AH,09         ; for message print inturupt
LEA DX,MSG
INT 21H


MOV AH,02
MOV DL,A
INT 21H



   
MAIN ENDP
END MAIN
RET