segment .data

	msg1 db "Enter first digit: "
	len1 equ $ - msg1

	msg2 db "Enter second digit: "
	len2 equ $ - msg2

	msg3 db "Sum is: "
	len3 equ $ - msg3

segment .bss
	num1 resb 2
	num2 resb 2
	res resb 1

section .text
	global _start

_start:
	mov eax, 4		;SYS_WRITE
	mov ebx, 1		;STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, [num1]
	sub eax, '0'

	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx
	add eax, '0'

	mov [res], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 1
	xor ebx, ebx
	int 0x80
