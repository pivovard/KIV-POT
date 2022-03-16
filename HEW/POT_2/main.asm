		.h8300s
		
		.data
var1:	.word	0xFFFF
var2:	.word	0xAB96

		
		.align	1			; zarovnani adresy
		.space	100			; stack
stck:						; konec stacku + 1

		.text
		.global	_start

_start:	mov.l	#stck,ER7

		mov.w	@var1,R5
		mov.b	R5L,R0L
		mov.b	R5H,R1L
		mov.w	@var2,R5
		mov.b	R5L,R2L
		mov.b	R5H,R3L
		
		jsr		addl
									
end:	sleep

err:	mov.l	#-0x1,ER6
		sleep
		
addl:	add.b	R2L,R0L
		BCC		addh
		
		add.b	#0x1,R1l
		BCS		err
		
addh:	add.b	R3L,R1L	
		BCS		err
		rts

		.end