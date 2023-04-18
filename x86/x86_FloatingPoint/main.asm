.386
.model  flat,stdcall
.stack  1024
ExitProcess proto,dwExitCode:dword


.data
var1    dd  12.5
var2    dq  123.56
var3    dd  100
res     dd  ?


.code
main proc c

    fld     [var1]      ;load
    fld     [var2]

    fadd                ;add st0+st1
    fst     [res]       ;store
    
    fild    [var3]      ;load integer
    fmul

    fistp   [res]       ;store integer and pop
    mov     eax,[res]

    invoke  ExitProcess,0
main endp

end main