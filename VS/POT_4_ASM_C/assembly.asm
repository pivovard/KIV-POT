.386
.model flat, stdcall
.stack 4096

EXTRN   sum:near

.data


.code

asmMain proc C 
    push    7
    push    8
    call    sum
    pop     edx
    pop     edx
    ret 
asmMain endp
public asmMain  

asmSum proc C
    pop edx
    pop eax
    pop ebx
    push    edx
    add eax,ebx
    ret
asmSum endp
public asmSum

end