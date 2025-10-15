
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here  

.data  
str dw "Entar a number $"
a db 6
b db 3
sum db ?

.code
mov ax, @data
mov ds, ax
;when we want to print anything then we have to store that on dx
LEA dx, str
mov ah, 09   ; that means microprocessor will print something, and the pringin
             ; data will come from dx
INT 21H
             
MOV ah, 01
INT 21h   ; For value input 
sub al, 48


;MOV ah, 02
;INT 21h   ; For value output


mov dl, al
add dl,48
mov ah, 02
;mov sum, al
int 21h

ret




