		.h8300s
		
		.equ	syscall,0x1FF0
		.equ	PUTS,0x0114
		.equ	GETS,0x0113
			
		.data
		
LED:	.byte	0x00

txt1:   .ascii "Hello World!\n"      ; vypisovany text ukonceny \n
buffer: .space 100                   ; vstupni buffer

        .align 2                     ; zarovnani adresy
out:    .long txt1                   ; parametricky blok 1
in:     .long buffer                 ; parametricky blok 2

		.align	1			; zarovnani adresy
		.space	100			; stack
stck:						; konec stacku + 1

		.text
		.global	_start
		.global _int1
		.global _int2
		
_int1:  push	er0
		
		mov.b	@LED,r0l
		rotl.b	r0l
		cmp		#0x05,r0l
		blt		write
		mov.b	#0x01,r0l
		
write:	mov.b	r0l,@LED
		
		pop		er0
		rts
		
_int2:	mov.w #PUTS,R0               ; 24bitovy PUTS
        mov.l #out,ER1               ; adr. param. bloku do ER1
        jsr   syscall
		rts
		
_start:	mov.l	#stck,ER7

		mov.w	#0xff01,r0
		mov.w	#0x3101,r1
		add.w	r1,r0

		mov.b	#0xff,r0l
		mov.b	r0l,@LED
		
		mov.b	#0x01,r0l
		mov.b	r0l,@LED

loop:	jmp		loop

		.end