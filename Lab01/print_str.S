[org 0x7c00]

[bits 16]

print_str:
	mov ah, 0x0e 	; tty mode
	mov al, 'H'
	int 0x10 

	mov al, 'e'
	int 0x10 

	mov al, 'l'
	int 0x10
	int 0x10

	mov al, 'o'
	int 0x10 

end:
	jmp $

; padding
times 510 - ($ - $$) db 0 
db 0x55, 0xaa 
