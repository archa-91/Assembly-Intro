extern printf

section .data

fmt db "%d",13,10

section .text
global main

main:

	push rbp
	mov rbp,rsp
	mov rbx,1
even:
	mov rax,rbx
	shr rax,1
	jc increase
	mov rdi,fmt
	mov rsi,rbx	
	call printf
increase:
	inc ebx
        cmp ebx,100
	jle even

        leave
	ret
