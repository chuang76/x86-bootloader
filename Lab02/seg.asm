[bits 16]

start:
	mov ah, 0x0e 	; tty mode 
	
	mov bx, string
	call print

	mov bx, string 
	mov cx, 0x7c0  
	mov ds, cx
	call print  

	jmp $

%include "print_str.asm" 

string:
	db "Hello world", 0 

times 510 - ($ - $$) db 0 
db 0x55, 0xaa
