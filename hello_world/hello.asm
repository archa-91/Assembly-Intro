extern printf

section .data

msg db "Hello World",0 ;Meassage to be printed, 0 indicates end of string
fmt db "%s",13,10 ; 13,10 indicates carriage return/line feed 

section .text
global main

main:

	push ebp ; save base pointer in stack
	mov ebp,esp ; set up the new frame
	push msg ; in 32-bit architecture the arguments of function is 
	push fmt ;pushed in reverse order
	
	call printf 

	add esp,8 ; restore the stack
	pop ebp	;restore the earlier stack frame 
	ret 

