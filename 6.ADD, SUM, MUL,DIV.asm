                                 
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;sum, sub, mul, div code

.DATA
NUM1 DB 3       ;DB FOR 8BIT, DW FOR 16 BIT
NUM2 DB 5
SUM DB ?
SUBB DB ?
MULT DB ?
DIVI DB ?
REM DB ?

.CODE     
MOV AX, @DATA      ; THIS IS IS FIXED FOR DATA CONNECTION
MOV DS, AX         ; THIS IS IS FIXED FOR DATA CONNECTION


MOV AL, NUM1
ADD AL,NUM2  

MOV SUM, AL        ; STORE Summission     

MOV AL, NUM1
SUB AL,NUM2

MOV SUBB,AL         ; STORE SUBSTRUCTION

MOV AL, NUM1
SUB AL,NUM2  

MOV AL, NUM1
MUL NUM2          



MOV MULT,AL        ; STORE Multiplication


ret




