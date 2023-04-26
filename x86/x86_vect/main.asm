.386
.xmm
.MODEL flat, stdcall
.stack 1024
 ExitProcess PROTO, dwExitCode: DWORD 

.data

arr1	dw	100 DUP(2)
arr2	dw	100 DUP(3)

.code
main PROC
	lea esi,arr1
	lea edi,arr2
	movups      xmm0, xmmword ptr[esi]
	movups      xmm1, xmmword ptr[edi]
	addps		xmm0, xmm1
	movdqa [edi + 4 * ecx], xmm0

	invoke ExitProcess, 0
main ENDP

END main