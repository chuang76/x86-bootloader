print_hex:
	pusha 
	mov cx, 0 	

loop_hex:
	cmp cx, 4 
	je end_hex

	mov ax, dx 		; input dx = 0x[xxxx] 
	and ax, 0x000f 		; take LSB 
	cmp al, 0x09 		; number or not 
	jle next 
	add al, 0x27 		; add extra 

next:
	add al, 0x30 		; add extra for numbers 
	
	mov bx, dest_str + 5 	; last bit, since little-endian so reverse 
	sub bx, cx 		; index 
	mov [bx], al 		; copy
	ror dx, 0x04 

	add cx, 1 
	jmp loop_hex 

end_hex:
	mov bx, dest_str	; copy done 
	call print 

	popa 
	ret 

dest_str: db "0x0000", 0 
	
