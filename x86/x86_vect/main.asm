.386
.xmm
.MODEL flat, stdcall
.stack 1024
 ExitProcess PROTO, dwExitCode: DWORD 

.data

arr1	dw	16 DUP(1)
num1	dw	1, 2, 3, 4, 5, 6, 7, 8

.code
main PROC
	lea			eax,arr1
	movups      xmm0, xmmword ptr[eax+4*2]
	movups      xmm1, xmmword ptr[num1]
	addps		xmm0, xmm1
	movups		xmmword ptr [eax+8], xmm0 ;in memory: {1,1,1,1,2,3,4,5,6,7,8,9,1,1,1,1}
	
	invoke ExitProcess, 0
main ENDP

END main