		.h8300s

		.global	proc
		.extern	var1,var2
		
proc:	mov.w	@var1,r2
		mov.w	@var2,r3
		add.w	r2,r3
		rts