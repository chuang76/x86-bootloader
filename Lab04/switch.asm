[bits 16]

switch:
	cli
	lgdt [gdt_descriptor]
	
	mov eax, cr0 
	or eax, 0x1 
	mov cr0, eax 

	jmp CODE_SEG:init 	; flush pipeline  

[bits 32]
init:
	mov ax, DATA_SEG 
	mov ds, ax 
	mov ss, ax 
	mov es, ax 
	mov fs, ax 
	mov gs, ax 

	mov ebp, 0x80000
	mov esp, ebp 

	call pmode 
