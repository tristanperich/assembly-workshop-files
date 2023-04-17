.include "tn85def.inc"

sbi DDRB, PORTB3
sbi DDRB, PORTB4
sbi DDRB, PORTB2
sbi DDRB, PORTB1
sbi DDRB, PORTB0

cbi DDRB, PORTB0
sbi PORTB, PORTB0

ldi r18, 50

.def Temp_Reg = r16

.equ Pitch_Period_1 = 25
.equ Pitch_Period_2 = 10
.equ Pitch_Period_3 = 45
.equ Pitch_Period_4 = 30
.equ Pitch_Period_5 = 15

.equ Normal_Beat_Period = 4000
.equ FF_Beat_Period = 900

; Period remaining registers
.def Period_1_Remaining = r18
.def Period_2_Remaining = r19
.def Period_3_Remaining = r20
.def Beat_Remaining_L = r21
.def Beat_Remaining_H = r22

; Period registers
.def Period_1 = r0
.def Period_2 = r1
.def Period_3 = r2
.def Period_4 = r3
.def Period_5 = r4
.def Period_Swap = r8
.def Beat_Period_L = r9
.def Beat_Period_H = r10

; Setup pitch periods
ldi Temp_Reg, Pitch_Period_1
mov Period_1, Temp_Reg
ldi Temp_Reg, Pitch_Period_2
mov Period_2, Temp_Reg
ldi Temp_Reg, Pitch_Period_3
mov Period_3, Temp_Reg
ldi Temp_Reg, Pitch_Period_4
mov Period_4, Temp_Reg
ldi Temp_Reg, Pitch_Period_5
mov Period_5, Temp_Reg

; Setup beat period
ldi Temp_Reg, high(Normal_Beat_Period)
mov Beat_Period_H, Temp_Reg
ldi Temp_Reg, low(Normal_Beat_Period)
mov Beat_Period_L, Temp_Reg

; Initialize periods
mov Period_1_Remaining, Period_1
mov Period_2_Remaining, Period_2
mov Period_3_Remaining, Period_3
mov Beat_Remaining_H, Beat_Period_H
mov Beat_Remaining_L, Beat_Period_L

loop:
	; Check if button pressed
	sbic PINB, PINB0
		rjmp Button_Not_Pressed
		
		; Button pressed
		ldi Temp_Reg, high(FF_Beat_Period)
		mov Beat_Period_H, Temp_Reg
		ldi Temp_Reg, low(FF_Beat_Period)
		mov Beat_Period_L, Temp_Reg
		rjmp Button_End
	Button_Not_Pressed:
		; Button not pressed
		ldi Temp_Reg, high(Normal_Beat_Period)
		mov Beat_Period_H, Temp_Reg
		ldi Temp_Reg, low(Normal_Beat_Period)
		mov Beat_Period_L, Temp_Reg
	Button_End:
	
	dec Period_1_Remaining
	brne Period_1_Remaining_Not_0
		mov Period_1_Remaining, Period_1
		sbi PINB, PINB4
	Period_1_Remaining_Not_0:
	
	dec Period_2_Remaining
	brne Period_2_Remaining_Not_0
		mov Period_2_Remaining, Period_2
		sbi PINB, PINB3
	Period_2_Remaining_Not_0:
	
	dec Period_3_Remaining
	brne Period_3_Remaining_Not_0
		mov Period_3_Remaining, Period_3
		sbi PINB, PINB2
	Period_3_Remaining_Not_0:
	
	; Decrement beat
	dec Beat_Remaining_L
	brne Beat_Remaining_L_Not_0
		dec Beat_Remaining_H
		brne Beat_Remaining_H_Not_0
			; Cycle pitches
			mov Period_Swap, Period_1
			mov Period_1, Period_2
			mov Period_2, Period_3
			mov Period_3, Period_4
			mov Period_4, Period_5
			mov Period_5, Period_Swap
			
			; Reset beat remaining
			mov Beat_Remaining_H, Beat_Period_H
			mov Beat_Remaining_L, Beat_Period_L
		Beat_Remaining_H_Not_0:
	Beat_Remaining_L_Not_0:
	
	; Wait
	ldi r17, 100
	rcall wait2
	
	; Loop
	rjmp loop

wait:
	ldi r17, 2
	rcall wait2
	
	dec r16
		brne wait
	ret
	
wait2:
	dec r17
		brne wait2
	ret