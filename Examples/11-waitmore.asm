; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Loop forever...
Loop:

	; Turn on pin B4
	sbi PORTB, 4
	
	; Wait
	rcall Wait_More
	
	; Turn off pin B4
	cbi PORTB, 4
	
	; Wait
	rcall Wait_More
	
	; Jump to Loop
	rjmp Loop


; Wait subroutine
Wait:
	; Load duration into register
	ldi r16, 255
	
	; Loop until done waiting...
	Wait_Loop:
		; Decrement the register
		dec r16
		
		; If result does not equal 0, branch back to the Wait loop
		brne Wait_Loop
; Return from subroutine
ret

; Wait More subroutine
Wait_More:
	; Load duration into register
	ldi r17, 255
	
	; Loop until done waiting...
	Wait_More_Loop:
		; Call Wait
		rcall Wait
		
		; Decrement the register
		dec r17
		
		; If result does not equal 0, loop
		brne Wait_More_Loop
; Return
ret