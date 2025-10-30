.data

n1 db 'Green $'
n2 db 'University $'

.code

;data connection
mov ax,@data
mov ds,ax

main proc
	lea dx,n1	; lea means load effective address
	mov ah, 09h
	int 21h
mov dl,10
mov ah,02
int 21h

mov dl,13
mov ah,02h
int 21h
	
	lea dx,n2
	mov ah,09h
	int 21h
	
main endp
end main
ret