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

	push ebp
	mov ebp,esp
	
	push inmsg ; in 32-bit architecture the arguments of function is 
        push fmt ;pushed in reverse order
        call printf
	add esp,2 ; clear stack after printf is called

	lea eax, [ip1] ; load the address of variable 1 into register to push to stack
	push eax ; push elements in reverse order for scanf function call 
	push infmt 
	xor eax, eax
	call scanf 
	add esp,8
	
	lea eax, [ip2]
	push eax
	push infmt 
	xor eax, eax
	call scanf
	add esp,8
	
	mov eax,[ip1] ; move values in variables
	mov ebx,[ip2]
	add eax,ebx

	push eax
        push infmt
	xor eax, eax
        call printf
	
        leave ;restore stack frame
	ret
