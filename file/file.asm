section .text
	global _start

_start:
	mov eax, 8			;create file
	mov ebx, file_name
	mov ecx, 0666o		;permission all
	int 0x80

	mov [fd_out], eax	;save fd out

	mov eax, 4			;write
	mov ebx, [fd_out]	;file description
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 6 			;close file
	mov ebx, [fd_out]
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg_done
	mov edx, len_done
	int 0x80

	mov eax, 5			;open file
	mov ebx, file_name
	mov ecx, 0			;read-only access
	mov edx, 0666o		;permission
	int 0x80

	mov [fd_in], eax
	
	mov eax, 3			;read file
	mov ebx, [fd_in]
	mov ecx, info		;save content in info
	mov edx, 26
	int 0x80

	mov eax, 6			;close file
	mov ebx, [fd_in]
	int 0x80

	mov eax, 4			;print info
	mov ebx, 1
	mov ecx, info
	mov edx, 26
	int 0x80

	mov eax, 1
	int 0x80

section .data
	file_name db "myfile.txt", 0		;require end of string or new line char
	
	msg db "Welcome to Tutorials Point"
	len equ $ - msg

	msg_done db "Written to file", 0xa
	len_done equ $ - msg_done

section .bss
	fd_out resb 1
	fd_in resb 1
	info resb 26
