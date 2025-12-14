# Microporcessor Lab

## Important Questions:

- Two number addition substraction, Multiplication and divission with remainder

- compare three number and sort it implement conditional operation

- vowel consonant.

- array input and print the array in reverse order

Most Frequently used code block

Systax for new line

```asm
NEWLINE DB 0DH,0AH,"$"
```

Inturupt for remove extra space

```asm
;COMMAND FOR EXTRA SPACE REMOVE
MOV AH, 02
MOV DX,13
INT 21H
```

Connecting data segment to code segment

```asm
MOV AX,@DATA
MOV DS, AX
```

Inturupt for input

```asm
MOV AH,01H
INT 21H
SUB AL,48
```

Inturupt for output a ascii

```asm
ADD BL,48
MOV AH, 02H
MOV DL,BL
INT 21H
```

Inturupt for print string

```asm
MOV AH,09H
LEA DX,MSG2
INT 21H
```

Library for print a message:

```asm
include 'emu8086.inc' 
```