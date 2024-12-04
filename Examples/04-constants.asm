.equ PORTB = 0x18
.equ DDRB = 0x17

sbi DDRB, 4
sbi PORTB, 4