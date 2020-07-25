;     nasm -felf64 FIbonacci.asm && gcc -no-pie FIbonacci.o && ./a.out

        global  main
        extern  printf
        extern scanf

        section .text
main:
        push    RBX 

        mov 	RDI, Cadena
        call 	printf 

        mov 	RDI, FormatoScanf
        mov 	RSI, Numero        
        call scanf

        mov     RCX, [Numero]
        cmp 	RCX,92
        ja 		salir

		xor     RAX, RAX                
	    xor 	RBP, RBP
	    xor     RBX, RBX                
	    inc     RBX                     
	    inc    	RBP
	    inc 	RAX

	print:
	        push    RCX                     
	        push 	RAX

	        mov 	RDI, NumeroActual
	        mov 	RSI, RBP
	        xor 	RAX, RAX

	        call 	printf

	        pop 	RAX
	        pop 	RCX

	        push  	RCX
	        push 	RAX

	        mov     RDI, FormatoOUT             
	        mov     RSI, RAX                
	        xor     RAX, RAX                

	        call    printf                  
                   
	        pop     RAX  
	        pop     RCX                    

	        mov     RDX, RAX                
	        mov     RAX, RBX                
	        add     RBX, RDX                
	        inc 	RBP
	        dec     RCX                     
	        jnz     print
	        jmp 	salir

	salir:
	        pop     RBX                     
	        ret

        section .data
Cadena:
		db "Ingrese un Numero: ", 0
FormatoScanf:		
		db  "%d", 0
FormatoOUT:		
		db  "%20ld", 10, 0
NumeroActual:	
		db  "%3d.-", 0

		section .bss
Numero:
		resd 1