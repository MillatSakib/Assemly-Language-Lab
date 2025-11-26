org 100h
.data 

.code  

mov ax, @data
mov ds, ax  
 
 
 mov bx, 0
 mov cx, 5
 
 start:
 add bx, cx
 loop start
  
 mov ax, bx
 mov bx, 10 
 div bx       ; ax = vagfol and dx= remaining
          
 mov bx, dx
 mov dx, ax 
 add dx, 48
 mov ah, 02
 int 21h
 
 mov dx, bx 
 add dx, 48
 mov ah, 02
 int 21h 
  
ret
