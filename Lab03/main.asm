[org 0x7c00]
[bits 16]

start:
	mov bp, 0x8000		; memory for stack 		
	mov sp, bp 

	mov bx, 0x9000 
	mov dh, 2		; read 2 sectors 
	call disk_load 

	mov dx, [0x9000]	; (0, 0, 2)
	call print_hex 

	mov bx, space 
	call print

	mov dx, [0x9000 + 512] 	; (0, 0, 3)
	call print_hex

	jmp $

%include "print.asm"
%include "print_hex.asm"
%include "disk_load.asm"

space: db " ", 0 

times 510 - ($ - $$) db 0 
db 0x55, 0xaa

times 256 dw 0xdead
times 256 dw 0xbeaf 
