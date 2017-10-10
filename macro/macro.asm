;macro
	%macro print_string 2
		mov eax, 4
		mov ebx, 1
		mov ecx, %1
		mov edx, %2
		int 0x80
	%endmacro

section .text
	global _start

_start:
	print_string msg1, len1
	print_string msg2, len2
	print_string msg3, len3

	mov eax, 1
	int 0x80

section .data
	msg1 db "Message 1", 0xa
	len1 equ $ - msg1

	msg2 db "Message 2", 0xa
	len2 equ $ - msg2

	msg3 db "Message 3", 0xa
	len3 equ $ - msg3
