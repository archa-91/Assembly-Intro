extern printf

section .data

fmt db "%d",13,10

section .text
global main

main:

	push ebp
	mov ebp,esp
	mov ebx,1
even:
	mov eax,ebx
	shr eax,1 ; move the lsb into CF.
	jc increase ;If CF=1,odd; if CF=0,even
	push ebx	
	push fmt
	call printf
	add esp,8 ;restore stack pointer
increase:
	inc ebx
        cmp ebx,100 ;check counter
	jle even

        leave ;restore stack frame
	ret
