; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Turn on pull-up resistor for pin B0
sbi PORTB, 0

; Loop
Loop:
	; If pin B0 is clear (button is pressed), skip next instruction
	sbic PINB, 0
		; Turn off pin B4
		cbi PORTB, 4
	
	; If pin B0 is set (button is not pressed), skip next instruction
	sbis PINB0, 0
		; Turn on pin B4
		sbi PORTB, 4
	
	; Jump to Loop
	rjmp Loop