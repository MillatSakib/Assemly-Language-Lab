org 100h
   .data  
   str dw "Enter a number$"
   a db 6
   b db 3 
   nline dw 0AH, 0DH, "$" 
   
   sum db ?
   
   .code
   mov ax, @data
   mov ds, ax
   
   LEA dx, str  ; loads effective address of str variable 
   mov ah, 09   ; command to print a string
   int 21h  
   
   lea dx, nline
   mov ah, 09  
   int 21h
     
      LEA dx, str  ; loads effective address of str variable 
   mov ah, 09   ; command to print a string
   int 21h
     
   mov ah, 01   ;command to take an input from user and stored it in AL register
   int 21h
   sub al, 48   ; command to convert from ASCII to Decimal
     mov bl,al  
     
     mov dx,10     ;command to print the newline
     mov ah, 02
     int 21h  
     mov dx, 13    ;command to remove the spaces
     mov ah, 02
     int 21h
     
   mov dl, bl   ;
   add dl,48    ;command to convert from decimal to ASCII
   mov ah, 02   ;command to show the output on emulator screen
   int 21h

ret