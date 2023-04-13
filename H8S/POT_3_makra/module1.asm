		.h8300s

		.global	_add_fce
		.extern	var1,var2
		
_add_fce:	mov.w	@var1,r2
		mov.w	@var2,r3
		add.w	r2,r3
		rts