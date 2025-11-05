
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; This is a basic code for basic code and using comparing.

org 100h
.data      
str1 dw "Enter a number: $"
str2 dw "Enter the second number: $"   
newline dw 0AH, 0DH, "$"

.code
mov ax, @data
mov ds, ax 

lea dx, str1
mov ah, 09
int 21h

mov ah, 01
int 21h  
;sub al, 48
mov bl,al      ; first input in BL=6



lea dx, newline  
mov ah, 09
int 21h

lea dx, str2
mov ah, 09
int 21h
        
        
mov ah, 01
int 21h   
;sub al, 48
mov cl,al  
       ; second input in CL=3
lea dx, newline  
mov ah, 09
int 21h  

cmp bl, cl  
jae larger 

mov dl, bl
mov ah, 02
int 21h

mov dl, cl
mov ah, 02
int 21h 
ret


larger:
  mov dl, cl
  mov ah, 02
  int 21h
  
  mov dl, bl
  mov ah, 02
  int 21h
  
ret




