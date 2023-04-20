.386
.model flat, stdcall
.stack 1024

EXTRN   myprint:near
EXTRN   sum1:near

.data


.code

proc_asm proc C 
    call    myprint
    push    7
    push    8
    call    sum1
    pop     edx
    pop     edx
    ret 
proc_asm endp
public proc_asm  

;int sum_asm(int a, int b);
sum_asm proc C
    mov eax,[esp+4]
	mov ebx,[esp+8]
    add eax,ebx
    ret
sum_asm endp
public sum_asm

end