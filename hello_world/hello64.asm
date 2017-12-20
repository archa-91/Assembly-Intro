extern printf

section .data

msg db "Hello World",0 
fmt db "%s",13,10

section .text
global main

main:

	push rbp ; save the base pointer of frame on stack
	
	mov rdi,fmt ; 64-bit architecture use rdi,rsi,rcx,rdx,r8,r9 for first 6 arguments in straight order
	mov rsi,msg ; Further arguments stored in stack in reverse order 
	call printf
	
	pop rbp ; restore stack frame 
	ret

