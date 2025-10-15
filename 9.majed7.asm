org 100h

.data 
str dw "Enter a number : $"
 a db 2
.code 
mov ax, @data
mov ds, ax  

LEA dx, str ; load effective address
mov ah, 09  ; for printing string
int 21h  

mov ah,01  ; For taking input in al 
int 21h  
sub al,48  ; Because it takes input asci value . check asci list for concept

mov bl, al
mov dx, 10  ; For printing value in a new line
mov ah, 02
int 21h  
mov dx, 13  ; for removing unnecessary space
mov ah, 02
int 21h 


mov dl, bl ; Because prints value from dl
add dl, 48 ; For converting the decimal value in asci value
mov ah, 02 ; Command For showing output
int 21h

ret
