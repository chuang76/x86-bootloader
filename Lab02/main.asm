[org 0x7c00]
[bits 16]

main:
	mov bx, string 
	call print 
	jmp $ 

%include "print_str.asm"

string:
	db "Hello world", 0

times 510 - ($ - $$) db 0 
db 0x55, 0xaa
