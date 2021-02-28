gdt_start:

gdt_null:
	dd 0x0
	dd 0x0		; 8-byte

gdt_code:
	dw 0xffff	; limit
	dw 0x0		; base 
	db 0x0		; base
	db 10011010b 	; P, DPL, S, Type flags
	db 11001111b 	; G, D/B, L, AVL flags, limit 
	db 0x0 		; base 

gdt_data:
	dw 0xffff
	dw 0x0 
	db 0x0 
	db 10010010b 	; Type flag is diff
	db 11001111b 
	db 0x0 

gdt_end:

gdt_descriptor:
	; size (16-bit) + addr (32-bit)
	dw gdt_end - gdt_start + 1
	dd gdt_start 

; some useful information
CODE_SEG equ gdt_code - gdt_start 
DATA_SEG equ gdt_data - gdt_start
	
