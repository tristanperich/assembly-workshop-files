; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Turn on pull-up resistor for pin B0
sbi PORTB, 0

; Loop forever...
Loop:
	; Skip if the button is not pressed
	sbis PINB, 0
		; The button is pressed, so decrement the duration
		dec r18
	
	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait (copy duration into register and call Wait subroutine)
	mov r16, r18
	rcall Wait
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (copy duration into register and call Wait subroutine)
	mov r16, r18
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