section .text
	global _start

_start:
	mov bx, 3
	call proc_fact		;fact(n)
	add ax, 0x30
	mov [res], ax

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, 4 
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80
	
	mov eax, 1
	int 0x80

proc_fact:
	cmp bl, 1			;if bl > 1 do calculation
	jg do_calculation
	mov ax, 1			;else ax = 1
	ret

do_calculation:
	dec bl
	call proc_fact		;fact(n-1)
	inc bl
	mul bl				; ax = al * bl
	ret

section .data
	msg1 db "Factorial of 3 is:", 0xa
	len1 equ $ - msg1

section .bss
	res resb 1
