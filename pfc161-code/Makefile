SDCC ?= sdcc
OUTDIR=build
IC=pfc161
PROG_NAME=blink_pfc161

all: clean build flash
	
clean:
	rm -rf $(OUTDIR)

build:
	mkdir -p $(OUTDIR)
	$(SDCC) -DPFC161 -mpdk14 -o $(OUTDIR)/$(PROG_NAME).ihx main.c

flash:
	easypdkprog --icname=$(IC) write $(OUTDIR)/$(PROG_NAME).ihx

power:
	easypdkprog --runvdd=3.3 start

.PHONY: all clean
