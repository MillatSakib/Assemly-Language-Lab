; convert farenheit to celcius 


org 100h

MOV BX, 1000
MOV CX, 32
SUB BX,CX

MOV AX, 5
MUL BX

MOV CX, 9
DIV CX

MOV DX,1
ADD AX,DX


; Here result are store on the AX register
; 


RET                        

