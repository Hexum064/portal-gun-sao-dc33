SDCC ?= sdcc
OUTDIR=build

all:
	mkdir -p $(OUTDIR)
	$(SDCC) -DPFC161 -mpdk14 -o $(OUTDIR)/blink_pfc161.ihx main.c
	
PMS150C:
	mkdir -p $(OUTDIR)
	$(SDCC) -DPMS150C -mpdk13 -o $(OUTDIR)/blink_pms150c.ihx main.c

clean:
	rm -rf $(OUTDIR)

.PHONY: all clean
