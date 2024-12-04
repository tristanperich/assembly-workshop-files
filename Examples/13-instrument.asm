; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Turn on pull-up resistor for pin B0
sbi PORTB, 0

; Register definitions
.def r18 = Duration_Reg
.def r16 = Wait_Reg

; Loop forever...
Loop:
	; Skip if the button is not pressed
	sbis PINB, 0
		; The button is pressed, so decrement the duration
		dec Duration_Reg
	
	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait (copy duration into register and call Wait subroutine)
	mov Wait_Reg, Duration_Reg
	rcall Wait
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (copy duration into register and call Wait subroutine)
	mov r16, Duration_Reg
	rcall Wait
	
	; Jump to Loop
	rjmp Loop


; Wait subroutine
Wait:
	
	; Decrement the register
	dec Wait_Reg
	
	; If result does not equal 0, branch back to the Wait loop
	brne Wait
; Return from function
ret