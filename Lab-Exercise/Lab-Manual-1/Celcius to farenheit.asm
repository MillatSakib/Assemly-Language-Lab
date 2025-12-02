; convert celcius to   farenheit  


org 100h

MOV AX, 260    
MOV BX,2
MUL BX


MOV BX, 32
ADD AX,BX

; Here result are store on the AX register
; 


RET                        

