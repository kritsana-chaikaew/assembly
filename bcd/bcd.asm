section .data
	msg1 db "Entter first 5 digit number", 0xa
	len1 equ $ - msg1

	msg2 db "Enter second 5 digit number", 0xa
	len2 equ $ - msg2

	msg3 db "The sum is", 0xa
	len3 equ $ - msg3

section .bss	
	num1 resb 6
	num2 resb 6
	sum resb 5

section .text
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
	mov edx, 6
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 6
	int 0x80

	mov eax, [num1]
	sub eax, '0'
	mov [num1], eax

	mov ebx, [num2]
	sub ebx, '0'
	mov [num2], ebx
	
	mov esi, 4					;point rightmost digit
	mov ecx, 5					;number of digiti and loop counter
	clc							;clear carry flag

add_loop:
	mov al, [num1 + esi]
	adc al, [num2 + esi]		;add with carry
	aaa							;ascii adjust after addition
	pushf						;push flag to stack
	or 	al, 30h					;al + '0' ('0'=30h)
	popf						;pop flag from stack

	mov [sum + esi], al
	dec esi						;move index
	loop add_loop

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 5
	int 0x80

	mov eax, 1
	int 0x80
