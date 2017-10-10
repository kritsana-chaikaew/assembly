segment .text
	global _start
_start:
	mov edx, 11
	mov ecx, name
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov [name], dword 'Seco'
	mov [name+4], dword 'nd N'
	mov [name+8], dword 'ame'
	
	mov edx, 11
	mov ecx, name
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

segment .data
name db 'First Name '
