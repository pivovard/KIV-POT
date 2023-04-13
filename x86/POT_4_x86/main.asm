.386
.model  flat,stdcall
.stack  4096
ExitProcess proto,dwExitCode:dword


.data
var1    dd  1234h
var2    dw  0abcdh
arr		db	10 DUP(1)
msg     db  "Hello World"


.code
main proc c

    mov     aex,2
    movzx   eax,word ptr [var1]     ;presune hodntu na adrese var1 - mov.w @var1,eax
    mov     [var2],0Ah              ;lze zapisovat const rovnou do pameti
    lea     esi,arr                 ;presune adresu arr do esi     - mov.l #var2,esi  
    movzx   eax,byte ptr [ebx]      ;movzx = zero extension
    mov	    [esi+4],85h             ;na 5. pozici pole ulozi 85h

;cyklus
    mov	ecx,10
	lea edi,arr
loop1:
	mov		eax,10
	sub		eax,ecx
	mov		[edi+eax],cl
	loop	loop1                   ;decrementuje ecx, pokud ecx > 0 skoci na loop1

    call lab1   ;skok s navratem (jsr)
    jmp end1    ;skok bez navratu

lab1:
    push eax
    pop  eax
    ret         ;rts

end1:
    invoke  ExitProcess,0
main endp

end main