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
	.globl _stop_tone_out
	.globl _start_tone_out_button
	.globl _start_tone_out_startup
	.globl _copy_to_buff
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
	.globl _copy_to_buff_PARM_2
	.globl _copy_to_buff_PARM_1
	.globl _tone_time
	.globl _tone_out_ctr
	.globl _pattern_step
	.globl _pattern_index
	.globl _pattern_count
	.globl _button_down
	.globl _button_ctr
	.globl _byte_ctr
	.globl _byte_t
	.globl _bytes
	.globl _pixel_buff
	.globl _off_color
	.globl _bright_blue_color
	.globl _bright_orange_color
	.globl _blue_color
	.globl _orange_color
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
_orange_color::
	.ds 3
_blue_color::
	.ds 3
_bright_orange_color::
	.ds 3
_bright_blue_color::
	.ds 3
_off_color::
	.ds 3
_pixel_buff::
	.ds 12
_bytes::
	.ds 1
_byte_t::
	.ds 1
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
_pattern_step::
	.ds 1
_tone_out_ctr::
	.ds 1
_tone_time::
	.ds 1
_copy_to_buff_PARM_1:
	.ds 3
_copy_to_buff_PARM_2:
	.ds 1
_copy_to_buff_sloc0_1_0:
	.ds 1
_copy_to_buff_sloc1_1_0:
	.ds 1
_update_pattern_bright_10000_19:
	.ds 3
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
;	main.c: 25: color_t orange_color = {.r=64, .g=16, .b=0};
	mov	a, #0x40
	mov	_orange_color+1, a
	mov	a, #0x10
	mov	_orange_color+0, a
	clear	_orange_color+2
;	main.c: 26: color_t blue_color = {.r=0, .g=0, .b=128};
	clear	_blue_color+1
	clear	_blue_color+0
	mov	a, #0x80
	mov	_blue_color+2, a
;	main.c: 27: color_t bright_orange_color = {.r=80, .g=32, .b=16};
	mov	a, #0x50
	mov	_bright_orange_color+1, a
	mov	a, #0x20
	mov	_bright_orange_color+0, a
	mov	a, #0x10
	mov	_bright_orange_color+2, a
;	main.c: 28: color_t bright_blue_color = {.r=16, .g=16, .b=128};
	mov	a, #0x10
	mov	_bright_blue_color+1, a
	mov	a, #0x10
	mov	_bright_blue_color+0, a
	mov	a, #0x80
	mov	_bright_blue_color+2, a
;	main.c: 29: color_t off_color = {.r=0, .g=0, .b=0};
	clear	_off_color+1
	clear	_off_color+0
	clear	_off_color+2
;	main.c: 34: volatile uint8_t bytes = LED_COUNT * 3;
	mov	a, #0x0c
	mov	_bytes+0, a
;	main.c: 35: volatile uint8_t byte_t = 0;    
	clear	_byte_t+0
;	main.c: 37: volatile uint8_t byte_ctr = 0;
	clear	_byte_ctr+0
;	main.c: 38: volatile uint8_t button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 39: volatile uint8_t button_down = 0;
	clear	_button_down+0
;	main.c: 40: volatile uint8_t pattern_count = 0;
	clear	_pattern_count+0
;	main.c: 41: volatile uint8_t pattern_index = 0;
	clear	_pattern_index+0
;	main.c: 42: volatile uint8_t pattern_step = 0;
	clear	_pattern_step+0
;	main.c: 43: volatile uint8_t tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 44: volatile uint8_t tone_time = 0;
	clear	_tone_time+0
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
;	main.c: 47: void copy_to_buff(color_t pixel, uint8_t len) {
;	-----------------------------------------
;	 function copy_to_buff
;	-----------------------------------------
_copy_to_buff:
;	main.c: 48: for (uint8_t i = 0; i < len ; i++) {
	clear	_copy_to_buff_sloc0_1_0+0
00103$:
	mov	a, _copy_to_buff_sloc0_1_0+0
	sub	a, _copy_to_buff_PARM_2+0
	t1sn.io	f, c
	ret
00120$:
;	main.c: 49: pixel_buff[i].r = pixel.r;
	mov	a, _copy_to_buff_sloc0_1_0+0
	sl	a
	add	a, _copy_to_buff_sloc0_1_0+0
	mov	_copy_to_buff_sloc1_1_0+0, a
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	add	a, #0x01
	push	af
	mov	a, _copy_to_buff_PARM_1+1
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 50: pixel_buff[i].g = pixel.g;
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	push	af
	mov	a, _copy_to_buff_PARM_1+0
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 51: pixel_buff[i].b = pixel.b;
	mov	a, #(_pixel_buff + 0)
	add	a, _copy_to_buff_sloc1_1_0+0
	add	a, #0x02
	push	af
	mov	a, _copy_to_buff_PARM_1+2
	mov	p, a
	pop	af
	xch	a, p
	idxm	p, a
;	main.c: 48: for (uint8_t i = 0; i < len ; i++) {
	inc	_copy_to_buff_sloc0_1_0+0
	goto	00103$
;	main.c: 53: }
	ret
;	main.c: 55: void start_tone_out_startup() {
;	-----------------------------------------
;	 function start_tone_out_startup
;	-----------------------------------------
_start_tone_out_startup:
;	main.c: 56: tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 57: tone_time = STARTUP_TONE_TIME;
;	main.c: 58: TM2B = STARTUP_BOUNDS;
	mov a, #0x0a
	mov  _tone_time+0, a
	mov.io	__tm2b, a
;	main.c: 59: TM2C |= TM2C_CLK_IHRC;
	set1.io	__tm2c, #5
;	main.c: 60: }
	ret
;	main.c: 62: void start_tone_out_button() {
;	-----------------------------------------
;	 function start_tone_out_button
;	-----------------------------------------
_start_tone_out_button:
;	main.c: 63: tone_out_ctr = 0;
	clear	_tone_out_ctr+0
;	main.c: 64: tone_time = BUTTON_TONE_TIME;
;	main.c: 65: TM2B = BUTTON_BOUNDS;
	mov a, #0x05
	mov  _tone_time+0, a
	mov.io	__tm2b, a
;	main.c: 66: TM2C |= TM2C_CLK_IHRC;
	set1.io	__tm2c, #5
;	main.c: 67: }
	ret
;	main.c: 69: void stop_tone_out() {
;	-----------------------------------------
;	 function stop_tone_out
;	-----------------------------------------
_stop_tone_out:
;	main.c: 70: tone_time = 0;
	clear	_tone_time+0
;	main.c: 71: TM2C &= 0x0F; //0 out the top 4 bits for clock source
	mov.io	a, __tm2c
	and	a, #0x0f
	mov.io	__tm2c, a
;	main.c: 72: }
	ret
;	main.c: 74: void output_leds() 
;	-----------------------------------------
;	 function output_leds
;	-----------------------------------------
_output_leds:
;	main.c: 110: __endasm;
	mov	a, _bytes ;move our byte count into a
	mov	_byte_ctr, a ;move a into our index counter
	mov	a, #(_pixel_buff) ;load the address of the array into a
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
;	main.c: 111: }
	ret
;	main.c: 113: void update_pattern() 
;	-----------------------------------------
;	 function update_pattern
;	-----------------------------------------
_update_pattern:
;	main.c: 118: switch (pattern_index)
	mov	a, _pattern_index+0
	cneqsn	a, #0x00
	goto	00101$
00169$:
	cneqsn	a, #0x01
	goto	00102$
00171$:
	cneqsn	a, #0x02
	goto	00103$
00173$:
	goto	00104$
;	main.c: 120: case 0:            
00101$:
;	main.c: 121: copy_to_buff(off_color, LED_COUNT);            
	mov	a, #(_off_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	goto	_copy_to_buff
;	main.c: 122: return;         
	ret
;	main.c: 123: case 1:
00102$:
;	main.c: 124: copy_to_buff(blue_color, LED_COUNT);
	mov	a, #(_blue_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	call	_copy_to_buff
;	main.c: 125: bright = bright_blue_color;
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_bright_blue_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 126: break;            
	goto	00104$
;	main.c: 127: case 2:
00103$:
;	main.c: 128: copy_to_buff(orange_color, LED_COUNT);
	mov	a, #(_orange_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #(_copy_to_buff_PARM_1 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
	mov	a, #0x04
	mov	_copy_to_buff_PARM_2+0, a
	call	_copy_to_buff
;	main.c: 129: bright = bright_orange_color;
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_bright_orange_color + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	call	___memcpy
;	main.c: 131: }
00104$:
;	main.c: 133: pattern_step++;
	mov	a, _pattern_step+0
	add	a, #0x01
	mov	_pattern_step+0, a
;	main.c: 135: switch (pattern_step)
	mov	a, _pattern_step+0
	cneqsn	a, #0x01
	goto	00105$
00175$:
	cneqsn	a, #0x03
	goto	00106$
00177$:
	cneqsn	a, #0x04
	goto	00107$
00179$:
	cneqsn	a, #0x06
	goto	00109$
00181$:
	cneqsn	a, #0x07
	goto	00109$
00183$:
	cneqsn	a, #0x0a
	goto	00110$
00185$:
	ret
;	main.c: 137: case 1:
00105$:
;	main.c: 138: pixel_buff[0] = bright;
	mov	a, #(_pixel_buff + 0)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 139: break;
	ret
;	main.c: 140: case 3:
00106$:
;	main.c: 141: pixel_buff[1] = bright;
	mov	a, #(_pixel_buff + 3)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 142: break;    
	ret
;	main.c: 143: case 4:
00107$:
;	main.c: 144: pixel_buff[2] = bright;
	mov	a, #(_pixel_buff + 6)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 145: break;   
	ret
;	main.c: 147: case 7:
00109$:
;	main.c: 148: pixel_buff[3] = bright;
	mov	a, #(_pixel_buff + 9)
	mov	___memcpy_PARM_1+0, a
	clear	___memcpy_PARM_1+1
	mov	a, #(_update_pattern_bright_10000_19 + 0)
	mov	___memcpy_PARM_2+0, a
	clear	___memcpy_PARM_2+1
	mov	a, #0x03
	mov	___memcpy_PARM_3+0, a
	clear	___memcpy_PARM_3+1
	goto	___memcpy
;	main.c: 149: break;                
	ret
;	main.c: 150: case 10:
00110$:
;	main.c: 151: pattern_step = 0;
	clear	_pattern_step+0
;	main.c: 153: } 
;	main.c: 156: }
	ret
;	main.c: 158: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c: 160: __disgint();
	disgint
;	main.c: 161: CLKMD |= 0x10;           //First enable IHRC
	set1.io	__clkmd, #4
;	main.c: 162: CLKMD = 0x34;           //Switch to IHRC/2 but leave ILRC on
	mov	a, #0x34
	mov.io	__clkmd, a
;	main.c: 163: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
	set0.io	__clkmd, #1
;	main.c: 164: PAC = LED_bm; //Pin 5 as out
	mov	a, #0x20
	mov.io	__pac, a
;	main.c: 165: PAPL = BTN_bm; //Pull Pin 4 low internally
	mov	a, #0x10
	mov.io	__papl, a
;	main.c: 166: PAC &= ~(BTN_bm); //Pin 4 as in
	set0.io	__pac, #4
;	main.c: 167: PADIER |= BTN_bm; //Enable digital in
	set1.io	__padier, #4
;	main.c: 170: INTEN = INTEN_TM3;
	mov	a, #0x80
	mov.io	__inten, a
;	main.c: 173: TM3B = 10;
	mov	a, #0x0a
	mov.io	__tm3b, a
;	main.c: 174: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
	mov	a, #0x40
	mov.io	__tm3c, a
;	main.c: 175: TM3S = TM3S_PRESCALE_DIV64; //should also start the timer
	mov	a, #0x60
	mov.io	__tm3s, a
;	main.c: 177: TM2B = 10;
	mov	a, #0x0a
	mov.io	__tm2b, a
;	main.c: 178: TM2C = TM2C_CLK_DISABLE | TM2C_OUT_PA3 | TM3C_MODE_PERIOD;
	mov	a, #0x08
	mov.io	__tm2c, a
;	main.c: 179: TM2S = TM2S_PRESCALE_DIV16;
	mov	a, #0x40
	mov.io	__tm2s, a
;	main.c: 181: __engint();
	engint
;	main.c: 184: start_tone_out_startup();
	call	_start_tone_out_startup
;	main.c: 186: while(1) ;
00102$:
	goto	00102$
;	main.c: 187: }
	ret
;	main.c: 189: void interrupt(void) __interrupt(0) {
;	-----------------------------------------
;	 function interrupt
;	-----------------------------------------
_interrupt:
	push	af
	mov	a, p
	push	af
;	main.c: 191: if( INTRQ & INTRQ_TM3 ) //Timer3 interrupt request
	t1sn.io	__intrq, #7
	goto	00116$
00160$:
;	main.c: 194: if (PA & BTN_bm) {
	t1sn.io	__pa, #4
	goto	00106$
00161$:
;	main.c: 196: if (!button_down)
	mov	a, _button_down+0
	ceqsn	a, #0x00
	goto	00107$
00162$:
;	main.c: 198: button_ctr++;
	mov	a, _button_ctr+0
	add	a, #0x01
	mov	_button_ctr+0, a
;	main.c: 200: if (button_ctr == BTN_DEBOUNCE_DELAY)
	mov	a, _button_ctr+0
	ceqsn	a, #0x05
	goto	00107$
00163$:
;	main.c: 202: button_down = 1;
	mov	a, #0x01
	mov	_button_down+0, a
;	main.c: 203: pattern_index = (pattern_index + 1) % 3;      
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
;	main.c: 204: pattern_step = 0;     
	clear	_pattern_step+0
;	main.c: 205: start_tone_out_button();  
	call	_start_tone_out_button
	goto	00107$
00106$:
;	main.c: 214: button_ctr = 0;
	clear	_button_ctr+0
;	main.c: 215: button_down = 0;
	clear	_button_down+0
00107$:
;	main.c: 218: pattern_count++;
	mov	a, _pattern_count+0
	add	a, #0x01
	mov	_pattern_count+0, a
;	main.c: 220: if (pattern_count == PATTERN_UPDATE_DELAY) 
	mov	a, _pattern_count+0
	ceqsn	a, #0x32
	goto	00109$
00164$:
;	main.c: 222: update_pattern();
	call	_update_pattern
;	main.c: 223: output_leds();
	call	_output_leds
;	main.c: 224: pattern_count = 0;
	clear	_pattern_count+0
00109$:
;	main.c: 227: if (tone_time) {
	mov	a, _tone_time+0
	cneqsn	a, #0x00
	goto	00113$
00165$:
;	main.c: 228: tone_out_ctr++;
	mov	a, _tone_out_ctr+0
	add	a, #0x01
	mov	_tone_out_ctr+0, a
;	main.c: 230: if (tone_out_ctr >= tone_time) {
	mov	a, _tone_out_ctr+0
	sub	a, _tone_time+0
;	main.c: 231: stop_tone_out();
	t1sn.io	f, c
	call	_stop_tone_out
00113$:
;	main.c: 237: INTRQ &= ~INTRQ_TM3; //Clear interrupt flag
	set0.io	__intrq, #7
00116$:
;	main.c: 240: }
	pop	af
	mov	p, a
	pop	af
	reti
	.area CODE
	.area CONST
	.area CABS (ABS)
