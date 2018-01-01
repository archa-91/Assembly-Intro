extern printf
extern scanf

section .data

fmt db "%s",0,13,10 ; format specifier for message
inmsg db "Enter",0,13,10
infmt db "%d",0 ;format specifier for scanf
ip1 dd 0 ; 4 byte variable 1
ip2 dd 0 ; 4 byte variable 2

section .text
global main

main:

	push rbp
	mov rbp,rsp
	
	mov rdi,fmt ; 64-bit architecture use rdi,rsi,rcx,rdx,r8,r9 for first 6 arguments in straight order
        mov rsi,inmsg ; Further arguments stored in stack in reverse order 
       	mov eax, 0	
	call printf
	
	mov rdi, infmt 
	lea rsi, [ip1] ; load the address of variable 1 into register
	mov eax,0
	call scanf 
	
	mov rdi, infmt 
	lea rsi, [ip2]
	mov eax, 0
	call scanf
	
	mov rax,[ip1] ; move values in variables
	mov rbx,[ip2]
	add rax,rbx

        mov rdi, infmt
	mov rsi, rax
	mov eax, 0
        call printf
	
        leave ;restore stack frame
	ret
