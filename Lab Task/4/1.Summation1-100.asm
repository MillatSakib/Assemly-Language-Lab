
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

; Implement a loop to find out the summation of 1+2+3+....+100, also try to implement it without loop

org 100h

.data


.code
MOV AX,@DATA
MOV DS,AX

MOV AX,0

MOV CX,100

MOV BX,0

START: ADD BX,CX;

LOOP START 

;Here you can see the result on BX register


ret

; the formulla for without loop is s=(n*(n+1))/2


