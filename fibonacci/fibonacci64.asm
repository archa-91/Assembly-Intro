extern printf

section .data

fmt db "%d",13,10

section .text
global main

main:

	push rbp
	mov rbp,rsp
	mov r10,15
	mov rax,0
	mov rbx,1
	push r10
fib:
	add rax,rbx
	push rax
	push rbx
	mov rdi,fmt
	mov rsi,rax
	mov eax,0 ; no vector registers in use 
	call printf
	pop rax
	pop rbx
	pop r10
	dec r10
	push r10
        cmp r10,0
	jne fib

        leave
	ret
