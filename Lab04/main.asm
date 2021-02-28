[org 0x7c00]
[bits 16]

start:
	mov bp, 0x8000
	mov sp, bp 

	mov bx, str_real
	call print

	call switch 
	jmp $ 

%include "../Lab03/print.asm"
%include "gdt.asm"
%include "print_pmode.asm"
%include "switch.asm"

[bits 32]
pmode:
	mov ebx, str_pmode
	call print_pmode
	jmp $

str_real: db "Started in 16-bit real mode", 0
str_pmode: db "Landed in 32-bit protected mode", 0

times 510 - ($ - $$) db 0 
db 0x55, 0xaa 
