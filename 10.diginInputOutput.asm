; This program will take two digit input and give output the same 


.DATA

.CODE

MOV AX, @DATA
MOV DS, AX

MOV AH, 01
INT 21H

SUB AL, 48


MOV BL, 10
MUL BL 





//15
MOV BL, 10
MUL BL

MOV BL, AL

MOV AH, 01
INT 21H

SUB AL, 48

ADD AL, BL
MOV BL, 20
DIV BL

MOV BL, AH

MOV DL, AL
ADD DL, 48
MOV AH, 02
INT 21H

MOV DL, BL
ADD DL, 48

MOV AH, 02
INT 21H

RET