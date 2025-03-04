;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.4.4 #15018 (MINGW32)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mpdk14

; default segment ordering in RAM for linker
	.area DATA
	.area OSEG (OVR,DATA)

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _interrupt
	.globl _main
	.globl _update_pattern
	.globl _output_leds
	.globl __t16c
	.globl __rop
	.globl __ilrcr
	.globl __tm3b
	.globl __tm3s
	.globl __tm3ct
	.globl __tm3c
	.globl __lvdc
	.globl __tkcl
	.globl __tkch
	.globl __tps2
	.globl __tps
	.globl __tke1
	.globl __tke2
	.globl __tcc
	.globl __ts
	.globl __tm2b
	.globl __tm2s
	.globl __tm2ct
	.globl __tm2c
	.globl __misclvr
	.globl __bgtr
	.globl __gpcs
	.globl __gpcc
	.globl __pbpl
	.globl __pbph
	.globl __pbc
	.globl __pb
	.globl __papl
	.globl __paph
	.globl __pac
	.globl __pa
	.globl __misc2
	.globl __pbdier
	.globl __padier
	.globl __integs
	.globl __ihrcr
	.globl __eoscr
	.globl __misc
	.globl __t16m
	.globl __intrq
	.globl __inten
	.globl __clkmd
	.globl __sp
	.globl __flag
	.globl _cnt
	.globl _pattern_index
	.globl _pattern_count
	.globl _button_down
	.globl _button_ctr
	.globl _byte_ctr
	.globl _pixel_ptr
	.globl _byte_t
	.globl _bytes
	.globl _off_pixels
	.globl _orange_pixels
	.globl _blue_pixels
	.globl _b
	.globl _g
	.globl _r
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG (ABS)
	.org 0x0000
__flag	=	0x0000
__sp	=	0x0002
__clkmd	=	0x0003
__inten	=	0x0004
__intrq	=	0x0005
__t16m	=	0x0006
__misc	=	0x0008
__eoscr	=	0x000a
__ihrcr	=	0x000b
__integs	=	0x000c
__padier	=	0x000d
__pbdier	=	0x000e
__misc2	=	0x000f
__pa	=	0x0010
__pac	=	0x0011
__paph	=	0x0012
__papl	=	0x0013
__pb	=	0x0014
__pbc	=	0x0015
__pbph	=	0x0016
__pbpl	=	0x0017
__gpcc	=	0x0018
__gpcs	=	0x0019
__bgtr	=	0x001a
__misclvr	=	0x001b
__tm2c	=	0x001c
__tm2ct	=	0x001d
__tm2s	=	0x001e
__tm2b	=	0x001f
__ts	=	0x0020
__tcc	=	0x0021
__tke2	=	0x0022
__tke1	=	0x0024
__tps	=	0x0026
__tps2	=	0x0028
__tkch	=	0x002b
__tkcl	=	0x002c
__lvdc	=	0x002d
__tm3c	=	0x0032
__tm3ct	=	0x0033
__tm3s	=	0x0034
__tm3b	=	0x0035
__ilrcr	=	0x0039
__rop	=	0x003a
__t16c::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_r::
	.ds 1
_g::
	.ds 1
_b::
	.ds 1
_blue_pixels::
	.ds 12
_orange_pixels::
	.ds 12
_off_pixels::
	.ds 12
_bytes::
	.ds 1
_byte_t::
	.ds 1
_pixel_ptr::
	.ds 2
_byte_ctr::
	.ds 1
_button_ctr::
	.ds 1
_button_down::
	.ds 1
_pattern_count::
	.ds 1
_pattern_index::
	.ds 1
_cnt::
	.ds 1
_tmp:
	.ds 1
;--------------------------------------------------------
; overlayable items in ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	.area	HEADER (ABS)
	.org	 0x0020
	goto	_interrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
	.area	PREG (ABS)
	.org 0x00
p::
	.ds 2
	.area	HEADER (ABS)
	.org 0x0000
	nop
	clear	p+1
	mov	a, #s_OSEG
	add	a, #l_OSEG + 1
	and	a, #0xfe
	mov.io	sp, a
	call	___sdcc_external_startup
	cneqsn	a, #0x00
	goto	__sdcc_init_data
	goto	__sdcc_program_startup
	.area GSINIT
__sdcc_init_data:
	mov	a, #s_DATA
	mov	p, a
	goto	00002$
00001$:
	mov	a, #0x00
	idxm	p, a
	inc	p
	mov	a, #s_DATA
00002$:
	add	a, #l_DATA
	ceqsn	a, p
	goto	00001$
;	main.c: 27: volatile uint8_t r = 31;
	mov	a, #0x1f
	mov	_r+0, a
;	main.c: 28: volatile uint8_t g = 0;
	clear	_g+0
;	main.c: 29: volatile uint8_t b = 31;
	mov	a, #0x1f
	mov	_b+0, a
;	main.c: 39: volatile uint8_t blue_pixels[] = {
	clear	_blue_pixels+0
	clear	_blue_pixels+1
	mov	a, #0x80
	mov	_blue_pixels+2, a
	clear	_blue_pixels+3
	clear	_blue_pixels+4
	mov	a, #0x80
	mov	_blue_pixels+5, a
	clear	_blue_pixels+6
	clear	_blue_pixels+7
	mov	a, #0x80
	mov	_blue_pixels+8, a
	clear	_blue_pixels+9
	clear	_blue_pixels+10
	mov	a, #0x80
	mov	_blue_pixels+11, a
;	main.c: 43: volatile uint8_t orange_pixels[] = {
	mov	a, #0x10
	mov	_orange_pixels+0, a
	mov	a, #0x40
	mov	_orange_pixels+1, a
	clear	_orange_pixels+2
	mov	a, #0x10
	mov	_orange_pixels+3, a
	mov	a, #0x40
	mov	_orange_pixels+4, a
	clear	_orange_pixels+5
	mov	a, #0x10
	mov	_orange_pixels+6, a
	mov	a, #0x40
	mov	_orange_pixels+7, a
	clear	_orange_pixels+8
	mov	a, #0x10
	mov	_orange_pixels+9, a
	mov	a, #0x40
	mov	_orange_pixels+10, a
	clear	_orange_pixels+11
;	main.c: 47: volatile uint8_t off_pixels[] = {
	clear	_off_pixels+0
	clear	_off_pixels+1
	clear	_off_pixels+2
	clear	_off_pixels+3
	clear	_off_pixels+4
	clear	_off_pixels+5
	clear	_off_pixels+6
	clear	_off_pixels+7
	clear	_off_pixels+8
	clear	_off_pixels+9
	clear	_off_pixels+10
	clear	_off_pixels+11
;	main.c: 51: volatile uint8_t bytes = 12;
	mov	a, #0x0c
	mov	_bytes+0, a
;	main.c: 52: volatile uint8_t byte_t = 0;    
	clear	_byte_t+0
;	main.c: 53: volatile uint8_t * pixel_ptr = 0;  
	clear	_pixel_ptr+0
	clear	_pixel_ptr+1
;	main.c: 54: volatile uint8_t byte_ctr = 0;
	clear	_byte_ctr+0
;	main.c: 55: volatile uint8_t button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 56: volatile uint8_t button_down = 0;
	clear	_button_down+0
;	main.c: 57: volatile uint8_t pattern_count = 0;
	clear	_pattern_count+0
;	main.c: 58: volatile uint8_t pattern_index = 0;
	clear	_pattern_index+0
;	main.c: 59: volatile uint8_t cnt = 0;
	clear	_cnt+0
;	main.c: 60: static     uint8_t tmp = 0;
	clear	_tmp+0
	.area GSFINAL
	goto	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	goto	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	main.c: 63: void output_leds() 
;	-----------------------------------------
;	 function output_leds
;	-----------------------------------------
_output_leds:
;	main.c: 99: __endasm;
	mov	a, _bytes ;move our byte count into a
	mov	_byte_ctr, a ;move a into our index counter
	mov	a, _pixel_ptr ;load the address of the array into a
	mov	p, a ;put that address into p (a mem location)
00010$:
	idxm	a, p ;load the byte data from the array into a
	inc	p ;inc p to the next address
	mov	_byte_t+0, a ;load the byte data into byte_t
	mov	a, #0x08 ;reset the bit count
00011$:
;output	bit
	set1.io	__pa, #5 ;set the output pin high
	t1sn	_byte_t, #7 ;if the current MSB is 1, skip setting the pin low now
	set0.io	__pa, #5 ;set the output pin low
	nop	;wait one cycle
	set0.io	__pa, #5 ;set the output pin low
	sl	_byte_t ;left-shift the data byte (the LEDs are MSB first)
	dzsn	a ;dec a and skip next instruction if 0
	goto	00011$ ;jump back to 00011
	dzsn	_byte_ctr ;dec our index counter and skip the goto if 0
	goto	00010$ ;goto the next byte
;	main.c: 100: }
	ret
;	main.c: 102: void update_pattern() 
;	-----------------------------------------
;	 function update_pattern
;	-----------------------------------------
_update_pattern:
;	main.c: 105: switch (pattern_index)
	mov	a, _pattern_index+0
	cneqsn	a, #0x00
	goto	00101$
00126$:
	cneqsn	a, #0x01
	goto	00102$
00128$:
	cneqsn	a, #0x02
	goto	00103$
00130$:
	ret
;	main.c: 107: case 0:
00101$:
;	main.c: 108: pixel_ptr = off_pixels;
	mov	a, #(_off_pixels + 0)
	mov	_pixel_ptr+0, a
	clear	_pixel_ptr+1
;	main.c: 109: break;            
	ret
;	main.c: 110: case 1:
00102$:
;	main.c: 111: pixel_ptr = blue_pixels;
	mov	a, #(_blue_pixels + 0)
	mov	_pixel_ptr+0, a
	clear	_pixel_ptr+1
;	main.c: 112: break;            
	ret
;	main.c: 113: case 2:
00103$:
;	main.c: 114: pixel_ptr = orange_pixels;
	mov	a, #(_orange_pixels + 0)
	mov	_pixel_ptr+0, a
	clear	_pixel_ptr+1
;	main.c: 116: }
;	main.c: 118: }
	ret
;	main.c: 120: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 122: __disgint();
	disgint
;	main.c: 123: CLKMD |= 0x10;           //First enable IHRC
	set1.io	__clkmd, #4
;	main.c: 124: CLKMD = 0x34;           //Switch to IHRC/2 but leave ILRC on
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 125: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
	set0.io	__clkmd, #1
;	main.c: 126: PAC = LED_bm; //Pin 5 as out
	mov	a, #0x20
	mov.io	__pac, a
;	main.c: 127: PAPL = BTN_bm; //Pull Pin 4 low internally
	mov	a, #0x10
	mov.io	__papl, a
;	main.c: 128: PAC &= ~(BTN_bm); //Pin 4 as in
	set0.io	__pac, #4
;	main.c: 129: PADIER |= BTN_bm; //Enable digital in
	set1.io	__padier, #4
;	main.c: 132: INTEN = INTEN_TM2;
	mov	a, #0x40
	mov.io	__inten, a
;	main.c: 135: TM2B = 10;
	mov	a, #0x0a
	mov.io	__tm2b, a
;	main.c: 136: TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
	mov	a, #0x40
	mov.io	__tm2c, a
;	main.c: 137: TM2S = TM2S_PRESCALE_DIV64; //should also start the timer
	mov	a, #0x60
	mov.io	__tm2s, a
;	main.c: 138: __engint();
	engint
;	main.c: 144: while(1);
00102$:
	goto	00102$
;	main.c: 145: }
	ret
;	main.c: 147: void interrupt(void) __interrupt(0) {
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	main.c: 149: if( INTRQ & INTRQ_TM2 ) //Timer2 interrupt request?
	t1sn.io	__intrq, #6
	goto	00112$
00144$:
;	main.c: 152: if (PA & BTN_bm) {
	t1sn.io	__pa, #4
	goto	00106$
00145$:
;	main.c: 154: if (!button_down)
	mov	a, _button_down+0
	ceqsn	a, #0x00
	goto	00107$
00146$:
;	main.c: 156: button_ctr++;
	mov	a, _button_ctr+0
	add	a, #0x01
	mov	_button_ctr+0, a
;	main.c: 158: if (button_ctr == BTN_DEBOUNCE_DELAY)
	mov	a, _button_ctr+0
	ceqsn	a, #0x05
	goto	00107$
00147$:
;	main.c: 160: button_down = 1;
	mov	a, #0x01
	mov	_button_down+0, a
;	main.c: 161: pattern_index = (pattern_index + 1) % 3;             
	mov	a, _pattern_index+0
	add	a, #0x01
	mov	__modsint_PARM_1+0, a
	mov	a, #0x00
	addc	a
	mov	__modsint_PARM_1+1, a
	mov	a, #0x03
	mov	__modsint_PARM_2+0, a
	clear	__modsint_PARM_2+1
	call	__modsint
	mov	_pattern_index+0, a
	goto	00107$
00106$:
;	main.c: 170: button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 171: button_down = 0;
	clear	_button_down+0
00107$:
;	main.c: 174: pattern_count++;
	mov	a, _pattern_count+0
	add	a, #0x01
	mov	_pattern_count+0, a
;	main.c: 176: if (pattern_count == PATTERN_UPDATE_DELAY) 
	mov	a, _pattern_count+0
	ceqsn	a, #0x32
	goto	00109$
00148$:
;	main.c: 178: update_pattern();
	call	_update_pattern
;	main.c: 179: output_leds();
	call	_output_leds
;	main.c: 180: pattern_count = 0;
	clear	_pattern_count+0
00109$:
;	main.c: 203: INTRQ &= ~INTRQ_TM2; //Clear interrupt flag
	set0.io	__intrq, #6
00112$:
;	main.c: 206: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CABS (ABS)
