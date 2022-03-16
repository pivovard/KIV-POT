		.h8300s
		
		.equ syscall,0x1FF00         ; adresa systemoveho volani
        .equ PUTS,0x0114             ; kod PUTS
        .equ GETS,0x0113             ; kod GETS
		
		.data

txt1:   .ascii "Hello World!\n"      ; vypisovany text ukonceny \n
buffer: .space 100                   ; vstupni buffer

        .align 2                     ; zarovnani adresy
out:    .long txt1                   ; parametricky blok 1
in:     .long buffer                 ; parametricky blok 2
		
		.align	1					 ; zarovnani adresy
		.space	100					 ; stack
stck:								 ; konec stacku + 1

		.text
		.global	_start

_start:	mov.l	#stck,ER7

		mov.w #PUTS,R0               ; 24bitovy PUTS
        mov.l #out,ER1               ; adr. param. bloku do ER1
        jsr   syscall

		;echo
        mov.w #GETS,R0               ; 24bitovy GETS
        mov.l #in,ER1                ; adr. param. bloku do ER1
        jsr @syscall
		
		mov.w #PUTS,R0               ; 24bitovy PUTS
        mov.l #in,ER1                ; adr. param. bloku do ER1
        jsr @syscall

		sleep
		.end