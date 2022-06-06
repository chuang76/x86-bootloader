[org 0x7c00]

kernel_offset equ 0x1000

start:
	mov bp, 0x8000
	mov sp, bp 

	; print a string in real mode 
	mov bx, str_real
	call print 

	; load kernel from disk 
	call load_kernel

	; switch to protected mode 
	call switch 

	jmp $

%include "../print.asm"
%include "../disk_load.asm"
%include "../gdt.asm"
%include "../print_pmode.asm"
%include "../switch.asm"

[bits 16]
load_kernel:
	call print_nl
	
	mov bx, str_load
	call print 

	mov bx, kernel_offset 
	mov dh, 2 
	call disk_load 
	ret 

print_nl:
	pusha
	mov ah, 0x0e
	mov al, 0x0a
	int 0x10
	mov al, 0x0d
	int 0x10
	popa
	ret

[bits 32]
pmode:
	mov ebx, str_pmode 
	call print_pmode 
	call kernel_offset  		; ?
	jmp $

str_real: db "Started in 16-bit real mode", 0
str_pmode: db "Landed in 32-bit protected mode", 0
str_load: db "Loading kernel from the disk", 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa
