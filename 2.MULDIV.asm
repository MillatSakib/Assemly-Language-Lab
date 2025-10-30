; You may customize this and other start-up templates; 

; The location of this template is c:\emu8086\inc\0_com_template.txt



org 100h



; this is code of division 

MOV AX, 50

MOV BX, 3 

DIV BX

; Here AX register are store the vagfol

; And DX register are store the vagsesh or remainder
; In case of 8bit data the vagfol are store on AH and the vagsesh are store on AL


; this is code of multiplication
MOV AX, 50
MOV BX, 3 
MUL BX

ret