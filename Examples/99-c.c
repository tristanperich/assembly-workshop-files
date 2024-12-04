#include <avr/io.h>

int main()
{
	DDRB = (1 << PORTB4);
	PORTB = (1 << PORTB4);
}