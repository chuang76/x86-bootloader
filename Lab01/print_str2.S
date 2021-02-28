[org 0x7c00]
[bits 16]

print_str:
	mov ah, 0x0e	; tty 

	mov bp, 0x8000
	mov sp, bp 

	push 'o'
	push 'l'
	push 'l'
	push 'e'
	push 'H'

	pop bx
	mov al, bl
	int 0x10	; 'H'

	pop bx
	mov al, bl 	
	int 0x10	; 'e'

	pop bx
	mov al, bl
	int 0x10 	; 'l'

	pop bx
	mov al, bl
	int 0x10 	; 'l'

	pop bx
	mov al, bl 
	int 0x10 	; 'o'

end:
	jmp $ 

times 510 - ($ - $$) db 0 
db 0x55, 0xaa 
	
