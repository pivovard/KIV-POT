		.h8300s
		
		.altmacro
		.macro add a,b
		
		local	noerr
		mov.w	@\a,r0
		mov.w	@\b,r1
		add.w	r1,r0
		bcc		noerr
		mov.l	#-0x1,er5
noerr:		
		.endm
		
		.data
var1:	.word	0xFFFF
var2:	.word	0xAB96

		
		.align	1			; zarovnani adresy
		.space	100			; stack
stck:						; konec stacku + 1

		.text
		.global	_start
		.global	var1,var2
		.extern	_add_fce

_start:	mov.l	#stck,ER7

		add		var1,var2		
		jsr		_add_fce
		

end:	sleep
		.end