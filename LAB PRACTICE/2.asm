
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Take two digit input and give output of that with add 9


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
sub al, 48  
mov bl,10
mul bl
mov bl,al      ; first input in BL=6



lea dx, newline  
mov ah, 09
int 21h

lea dx, str2
mov ah, 09
int 21h
        
       
mov ah, 01
int 21h   
sub al, 48
mov cl,al  
       ; second input in CL=3
add bl, cl   
add bl, 9 
 mov ax,0 
mov al,bl
mov bl,10
div bl 
mov cl,ah


mov dl, al
add dl, 48
mov ah, 02   

int 21h 

mov dl, cl
add dl, 48
mov ah, 02
int 21h     

ret