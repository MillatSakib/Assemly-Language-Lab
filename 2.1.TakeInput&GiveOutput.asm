org 100h

MOV AH,01H ;For making inturupt for input
INT 21H ; Making inturupt
SUB AL,48
MOV DL,AL
ADD DL,48
MOV AH,02H ;For making inturupt for output
INT 21H


RET