segment .data
	msg1 db "Enter first number: ", 0xA
	len1 equ $ - msg1

	msg2 db "Enter second number: ",  0xA
	len2 equ $ - msg2

	msg3 db "The largest numbers is: ", 0xA
	len3 equ $ - msg3

segment .bss
	num1 resb 2
	num2 resb 2
	res resb 1

segment .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
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

	mov ecx, [num1]
	sub ecx, '0'

	mov ebx, [num2]
	sub ebx, '0'

	cmp ecx, ebx
	jge` _exit
	mov ecx, ebx
	
_exit:
	add ecx, '0'
	mov [res], ecx

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 1
	int 0x80
