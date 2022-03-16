		.h8300s
		
		.equ	syscall,0x1FF0
		.equ	PUTS,0x0114
		.equ	GETS,0x0113
			
		.data
		
var1:	.word	0x12CD
var_out:.space	5			;pamet pro textovy vystup (4 znaky + \n)

		.align	2
out:	.long	var_out		;param blok

		.align	1			; zarovnani adresy
		.space	100			; stack
stck:						; konec stacku + 1

		.text
		.global	_start

_start:	mov.l	#stck,ER7

		mov.w	@var1,r0
		mov.l	#var_out,er4	;adresa pameti pro vystup -> er4
		add.l	#0x04,er4		;posun adresy na posledni byte
		
		mov.b	#0x0A,r1l
		mov.b	r1l,@er4		;'\n' na poslednim bytu
		dec.l	#1,er4
		
		mov.b	#0x00,r5l		;pocitadlo cyklu
		
		;cyklus
lab1:	mov.w	r0,r1
		and.w	#0x000F,r1		;posledni 4 bity do r1
		
		cmp.w	#0x9,r1
		bgt		znak
		add.w	#'0',r1			;0-9 -> pricteme znak '0'
		jmp		cont
znak:	add.w	#('A'-0x0A),r1	;A-F -> pricteme znak '0'-0x0A

cont:	mov.b	r1l,@er4		;ulozime prevedeny znak do pameti
		dec.l	#1,er4			;snizime adresu pro vystup
		shlr.w	#2,r0			;posuneme r0 o 4 bity doprava
		shlr.w	#2,r0			;budeme tak zpracovavat dalsi znak
		
		inc.b	r5l
		cmp.b	#0x04,r5l
		blt		lab1
		
		;vypis do konzole
		mov.w	#PUTS,r0
		mov.l	#out,er1
		jsr		syscall
		
		sleep
		.end