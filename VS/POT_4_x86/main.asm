.386
.model  flat,stdcall
.stack  4096
ExitProcess proto,dwExitCode:dword


.data
msg     db  "Hello World"
var1    dw  1234h
var2    dw  0abcdh


.code
main proc c
        jmp start   ;skok

lab1:   nop
        ret

start:  call lab1   ;skok s navratem
        
        ;cyklus
        mov ecx,5
lab2:   nop
        loop    lab2

        movzx   eax,word ptr [var1]     ;ulozi hodntu na adrese var1
        lea     ebx,var2                ;ulozi adresu var2
        movzx   eax,word ptr [ebx]

        mov     esi,0
        movzx   eax,msg[esi]

        call    pr
        invoke  ExitProcess,0
main endp


;procedura
pr proc
start:  nop
        ret
pr endp

end main