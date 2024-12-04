; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B3 (LED) and B4 (speaker) to output
sbi DDRB, 3
sbi DDRB, 4

; Turn on pull-up resistor for pin B0
sbi PORTB, 0

; Register definitions
.def Duration_Reg = r18
.def Wait_Reg = r16

; Loop forever...
Loop:
	; Skip if the button is pressed
	sbic PINB, 0
		rjmp Button_Not_Pressed
	
	Button_Pressed:
		; The button is pressed
		
		; Decrement the duration
		dec Duration_Reg
		
		; Turn on LED
		sbi PORTB, 3
		
		; Jump to button done
		rjmp Button_Done
		
	Button_Not_Pressed:
		; The button is not pressed
		; Turn off LED
		cbi PORTB, 3
	
	Button_Done:
	
	
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