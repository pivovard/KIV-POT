		.h8300s
		
		.equ	syscall,0x1FF0
		.equ	PUTS,0x0114
		.equ	GETS,0x0113
			
		.data
		

LED:    .byte	0x00

txt1:   .ascii "Hello World!\n" 
        .align 2                     ; zarovnani adresy
out:    .long  txt1                  ; parametricky blok 1

		.align	1			; zarovnani adresy
		.space	100			; stack
stck:						; konec stacku + 1

		.text
		.global	_start
		.global _int1
		.global _int2
		
_int1:  mov.b	@LED,r0l
		rotl.b	r0l
		
		cmp.b	#0x04,r0l
		ble		lab1
		mov.b	#0x01,r0l
		
lab1:	mov.b	r0l,@LED
		rts
		
_int2:  mov.w #PUTS,R0               ; 24bitovy PUTS
        mov.l #out,ER1               ; adr. param. bloku do ER1
        jsr   syscall
		rts

_start:	mov.l	#stck,ER7

	    mov.b	#0xff,r0l
		mov.b	r0l,@LED
		mov.b	#0x01,r0l
		mov.b	r0l,@LED
				
loop1:  nop
		jmp		loop1
		
		sleep
		.end