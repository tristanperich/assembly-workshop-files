; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Register definitions
.def Wait_Reg = r16
.def Wait_More_Reg = r17

; Loop forever...
Loop:

	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi Wait_More_Reg, 255
	rcall Wait_More
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait (load duration into register and call Wait subroutine)
	ldi Wait_More_Reg, 255
	rcall Wait_More
	
	; Jump to Loop
	rjmp Loop


; Wait subroutine
Wait:
	; Load duration into register
	ldi Wait_Reg, 255
	
	; Loop until done waiting...
	Wait_Loop:
		; Decrement the register
		dec Wait_Reg
		
		; If result does not equal 0, branch back to the Wait loop
		brne Wait_Loop
; Return from subroutine
ret

; Wait More subroutine
Wait_More:
	; Loop until done waiting...
	Wait_More_Loop:
		; Call Wait
		rcall Wait
		
		; Decrement the register
		dec Wait_More_Reg
		
		; If result does not equal 0, loop
		brne Wait_More_Loop
; Return
ret