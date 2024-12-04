; Include chip definition
.include "tn85def.inc"

; Set data-direction of pin B4 to output
sbi DDRB, 4

; Turn on pin B4
sbi PORTB, 4