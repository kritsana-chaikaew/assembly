segment .bss
	num resb 1
segment .text
	global _start

_start:
	mov ecx, 10
	mov eax, '1'

l1:
	mov [num], eax
	mov eax, 4		;SYS_WRITE
	mov ebx, 1		;STDOUT
	push ecx

	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	sub eax, '0'
	inc eax
	add eax, '0'
	pop ecx
	loop l1

	mov eax, 1
	int 0x80 
