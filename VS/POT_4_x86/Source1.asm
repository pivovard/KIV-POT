promptFirst PROTO C
promptSecond PROTO C
printInt PROTO C

.586
.model flat, stdcall

.stack 4096

; ---------------------------------------

.DATA

first DWORD 0
second DWORD 0

; --------------------------------

.CODE

asmMain PROC C  
    invoke  promptFirst
    mov first, promptFirst              
    ret 
asmMain ENDP

PUBLIC asmMain  
END