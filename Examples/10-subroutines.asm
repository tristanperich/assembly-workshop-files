; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Loop forever...
Loop:

	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi r16, 255
	rcall Wait
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi r16, 255
	rcall Wait
	
	; Jump to Loop
	rjmp Loop


; Wait subroutine
Wait:
	; Decrement the register
	dec r16
	
	; If result does not equal 0, branch back to the Wait loop
	brne Wait
; Return from function
ret