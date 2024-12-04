# Tristan Perich
# Programming Workshop
# Base Makefile

# Constants
processor_t85=t85
processor_m168=m168
high_fuse_t85_default=0xDF
low_fuse_t85_default=0x62
low_fuse_t85_nockdiv8=0xE2
mmcu_t85=attiny85
mmcu_m168=atmega168

# Hardware Configuration
processor=$(processor_t85)
high_fuse=$(high_fuse_t85_default)
low_fuse=$(low_fuse_t85_default)

# Default Project Files
project=code
output_directory=Output

# Programmer and OS
ifeq ($(os),windows)
	CLEAN_COMMAND=del /f
	PROGRAMMER=avrisp
	PROGRAMMER_PORT=COM5
	PROGRAMMER_BAUD_PARAMETER=-b 19200
else
	CLEAN_COMMAND=rm -f
	ifneq ($(wildcard /dev/cu.usbserial-A*),) 
		PROGRAMMER=stk500v2
		PROGRAMMER_PORT=/dev/cu.usbserial-A*
	else
		ifneq ($(wildcard /dev/cu.usbmodem*),) 
			PROGRAMMER=avrisp
			PROGRAMMER_PORT=/dev/cu.usbmodem*
			PROGRAMMER_BAUD_PARAMETER=-b 19200
		else
			PROGRAMMER=usbasp
			PROGRAMMER_PORT=usb
		endif
	endif
endif

# Tools
ASM=tavrasm
ASM_FLAGS=-I /opt/homebrew/opt/tavrasm/bin/include/asm
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-mmcu=$(MMCU) -Wall -I./ -Os
AVRDUDE=avrdude
ifeq ($(processor),$(processor_t85))
	MMCU=$(mmcu_t85)
else
	MMCU=$(mmcu_m168)
endif

# all
# (default target, compiles .c or .asm files, and then programs the .hex file)
ifneq ("$(wildcard $(project).c)","")
all: compile program
endif
ifneq ("$(wildcard $(project).asm)","")
all: assemble program
endif

# compile
# (compiles c files into hex file)
compile: $(project).c
	@printf "\n`tput bold`Compiling...`tput sgr0`\n"
	$(CC) $(CFLAGS) -o $(output_directory)/$(project).out $(project).c
	$(CC) $(CFLAGS) -S -fverbose-asm -o $(output_directory)/$(project).asm $(project).c
	$(OBJCOPY) -j .text -O ihex $(output_directory)/$(project).out $(output_directory)/$(project).hex
	rm $(output_directory)/$(project).out
	
# assemble (asm files)
# (assembles asm files into hex file)
assemble: $(project).asm
	@printf "\n`tput bold`Assembling...`tput sgr0`\n"
	mkdir -p $(output_directory)
	$(ASM) $(ASM_FLAGS) $(project).asm -v -e $(output_directory)/$(project).lst -o $(output_directory)/$(project).hex -r $(output_directory)/$(project).eep

# program
# (programs hex file onto chip)
program: $(output_directory)/$(project).hex
	@printf "\n`tput bold`Programming...`tput sgr0`\n"
	$(AVRDUDE) -p $(processor) -c $(PROGRAMMER) -P $(PROGRAMMER_PORT) $(PROGRAMMER_BAUD_PARAMETER) -e -U hfuse:w:$(high_fuse):m -U lfuse:w:$(low_fuse):m -U flash:w:$(output_directory)/$(project).hex

# clean
# (removes out/hex files)
clean:
	@printf "\n`tput bold`Cleaning up...`tput sgr0`\n"
	$(CLEAN_COMMAND) $(project).out
	$(CLEAN_COMMAND) $(project).hex
