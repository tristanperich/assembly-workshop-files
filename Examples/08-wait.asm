; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Loop forever...
Loop:

	; Turn on pin B4
	sbi PORTB, 4
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (try multiple nop commands)
	nop
	
	; Jump to Loop
	rjmp Loop