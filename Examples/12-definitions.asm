; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Register definitions
.def r16 = Wait_Reg
.def r17 = Wait_Reg_2

; Loop forever...
Loop:

	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi Wait_Reg, 255
	rcall Wait
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi Wait_Reg, 255
	rcall Wait
	
	; Jump to Loop
	rjmp Loop


; Wait subroutine
Wait:
	; Load duration for inner loop
	ldi Wait_Reg_2, 255
	Inner_Wait:
		dec Wait_Reg_2
		brne Inner_Wait
	
	; Decrement the register
	dec Wait_Reg
	
	; If result does not equal 0, branch back to Wait
	brne Wait
; Return from function
ret