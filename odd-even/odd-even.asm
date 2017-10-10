segment .data
	msg db "Enter a digit: "
	len equ $ - msg

	even_m db "Even digit!"
	len_even_m equ $ - even_m

	odd_m db "Odd digit!"
	len_odd_m equ $ - odd_m

segment .bss
	digit resb 2

segment .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, digit
	mov edx, 2
	int 0x80

	mov eax, [digit]
	sub eax, '0'

	and eax, 1
	jz even
	
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_m
	mov edx, len_odd_m
	int 0x80
	
	jmp _exit

even:
	mov eax, 4
	mov ebx, 1
	mov ecx, even_m
	mov edx, len_even_m
	int 0x80

_exit:
	mov eax, 1
	int 0x80
