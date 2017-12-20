extern printf

section .data

fmt db "%d",13,10

section .text
global main

main:

	push ebp
	mov ebp,esp
	mov ecx,15 ; loop count of 15
	mov ebx,0
	mov edx,1
	push ecx
fib:
	add ebx,edx
	push edx
	push ebx
	push fmt
	call printf
	add esp,4
	pop edx
	pop ebx
	pop ecx
	dec ecx
	push ecx
        cmp ecx,0
	jne fib

        leave
	ret
