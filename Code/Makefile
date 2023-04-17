# AVR-GCC Makefile
PROJECT=code
#PROGRAMMER=usbasp
#PROGRAMMER_PORT=usb
PROGRAMMER=stk500v2
PROGRAMMER_PORT=/dev/cu.usbserial-*
HIGH_FUSE=0xDF
LOW_FUSE=0xE2
PROCESSOR_SHORT=t85

# Executables
ASM=/opt/homebrew/opt/tavrasm/bin/tavrasm
AVRDUDE=/opt/homebrew/opt/avrdude/bin/avrdude

.PHONY: assemble program clean

all: assemble program

assemble:
	$(ASM) -I /opt/homebrew/opt/tavrasm/bin/include/asm $(PROJECT).asm -e $(PROJECT).lst -v -r $(PROJECT).eep

program:
#	avrdude -p $(PROCESSOR_SHORT) -c usbtiny -P usb -e -U hfuse:w:$(HIGH_FUSE):m -U lfuse:w:$(LOW_FUSE):m -U flash:w:$(PROJECT).hex
#	avrdude -V -p $(PROCESSOR_SHORT) -c usbasp -P usb -e -U hfuse:w:$(HIGH_FUSE):m -U lfuse:w:$(LOW_FUSE):m -U flash:w:$(PROJECT).hex
#	avrdude -p $(PROCESSOR_SHORT) -c avrispv2 -P /dev/cu.usbmodem000733521 -e -U hfuse:w:$(HIGH_FUSE):m -U lfuse:w:$(LOW_FUSE):m -U flash:w:$(PROJECT).hex
	avrdude -p $(PROCESSOR_SHORT) -c $(PROGRAMMER) -P $(PROGRAMMER_PORT) -e -U hfuse:w:$(HIGH_FUSE):m -U lfuse:w:$(LOW_FUSE):m -U flash:w:$(PROJECT).hex
# uncomment line below for EEPROM
#	avrdude -p $(PROCESSOR_SHORT) -c $(PROGRAMMER) -P $(PROGRAMMER_PORT) -e -U hfuse:w:$(HIGH_FUSE):m -U lfuse:w:$(LOW_FUSE):m -U flash:w:$(PROJECT).hex -U eeprom:w:$(PROJECT).eep

clean:
	rm -f $(PROJECT).lst
	rm -f $(PROJECT).hex
	rm -f $(PROJECT).eep