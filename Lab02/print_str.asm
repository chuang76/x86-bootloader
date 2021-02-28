print:
	pusha		; push all GPRs

loop:
	mov al, [bx]
	cmp al, 0 
	je end 

	mov ah, 0x0e 	; tty mode 
	int 0x10 	; print 

	add bx, 1 	; next address 
	jmp loop 

end:
	popa 
	ret 
