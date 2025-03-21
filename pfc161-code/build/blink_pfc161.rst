                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mpdk14
                                      7 	
                                      8 
                                      9 ; default segment ordering in RAM for linker
                                     10 	.area DATA
                                     11 	.area OSEG (OVR,DATA)
                                     12 
                                     13 ;--------------------------------------------------------
                                     14 ; Public variables in this module
                                     15 ;--------------------------------------------------------
                                     16 	.globl _interrupt
                                     17 	.globl _main
                                     18 	.globl _update_pattern
                                     19 	.globl _output_leds
                                     20 	.globl _stop_tone_out
                                     21 	.globl _start_tone_out_button
                                     22 	.globl _start_tone_out_startup
                                     23 	.globl _copy_to_buff
                                     24 	.globl __t16c
                                     25 	.globl __rop
                                     26 	.globl __ilrcr
                                     27 	.globl __tm3b
                                     28 	.globl __tm3s
                                     29 	.globl __tm3ct
                                     30 	.globl __tm3c
                                     31 	.globl __lvdc
                                     32 	.globl __tkcl
                                     33 	.globl __tkch
                                     34 	.globl __tps2
                                     35 	.globl __tps
                                     36 	.globl __tke1
                                     37 	.globl __tke2
                                     38 	.globl __tcc
                                     39 	.globl __ts
                                     40 	.globl __tm2b
                                     41 	.globl __tm2s
                                     42 	.globl __tm2ct
                                     43 	.globl __tm2c
                                     44 	.globl __misclvr
                                     45 	.globl __bgtr
                                     46 	.globl __gpcs
                                     47 	.globl __gpcc
                                     48 	.globl __pbpl
                                     49 	.globl __pbph
                                     50 	.globl __pbc
                                     51 	.globl __pb
                                     52 	.globl __papl
                                     53 	.globl __paph
                                     54 	.globl __pac
                                     55 	.globl __pa
                                     56 	.globl __misc2
                                     57 	.globl __pbdier
                                     58 	.globl __padier
                                     59 	.globl __integs
                                     60 	.globl __ihrcr
                                     61 	.globl __eoscr
                                     62 	.globl __misc
                                     63 	.globl __t16m
                                     64 	.globl __intrq
                                     65 	.globl __inten
                                     66 	.globl __clkmd
                                     67 	.globl __sp
                                     68 	.globl __flag
                                     69 	.globl _copy_to_buff_PARM_2
                                     70 	.globl _copy_to_buff_PARM_1
                                     71 	.globl _tone_time
                                     72 	.globl _tone_out_ctr
                                     73 	.globl _pattern_step
                                     74 	.globl _pattern_index
                                     75 	.globl _pattern_count
                                     76 	.globl _button_down
                                     77 	.globl _button_ctr
                                     78 	.globl _byte_ctr
                                     79 	.globl _byte_t
                                     80 	.globl _bytes
                                     81 	.globl _pixel_buff
                                     82 	.globl _off_color
                                     83 	.globl _bright_blue_color
                                     84 	.globl _bright_orange_color
                                     85 	.globl _blue_color
                                     86 	.globl _orange_color
                                     87 ;--------------------------------------------------------
                                     88 ; special function registers
                                     89 ;--------------------------------------------------------
                                     90 	.area RSEG (ABS)
      000000                         91 	.org 0x0000
                           000000    92 __flag	=	0x0000
                           000002    93 __sp	=	0x0002
                           000003    94 __clkmd	=	0x0003
                           000004    95 __inten	=	0x0004
                           000005    96 __intrq	=	0x0005
                           000006    97 __t16m	=	0x0006
                           000008    98 __misc	=	0x0008
                           00000A    99 __eoscr	=	0x000a
                           00000B   100 __ihrcr	=	0x000b
                           00000C   101 __integs	=	0x000c
                           00000D   102 __padier	=	0x000d
                           00000E   103 __pbdier	=	0x000e
                           00000F   104 __misc2	=	0x000f
                           000010   105 __pa	=	0x0010
                           000011   106 __pac	=	0x0011
                           000012   107 __paph	=	0x0012
                           000013   108 __papl	=	0x0013
                           000014   109 __pb	=	0x0014
                           000015   110 __pbc	=	0x0015
                           000016   111 __pbph	=	0x0016
                           000017   112 __pbpl	=	0x0017
                           000018   113 __gpcc	=	0x0018
                           000019   114 __gpcs	=	0x0019
                           00001A   115 __bgtr	=	0x001a
                           00001B   116 __misclvr	=	0x001b
                           00001C   117 __tm2c	=	0x001c
                           00001D   118 __tm2ct	=	0x001d
                           00001E   119 __tm2s	=	0x001e
                           00001F   120 __tm2b	=	0x001f
                           000020   121 __ts	=	0x0020
                           000021   122 __tcc	=	0x0021
                           000022   123 __tke2	=	0x0022
                           000024   124 __tke1	=	0x0024
                           000026   125 __tps	=	0x0026
                           000028   126 __tps2	=	0x0028
                           00002B   127 __tkch	=	0x002b
                           00002C   128 __tkcl	=	0x002c
                           00002D   129 __lvdc	=	0x002d
                           000032   130 __tm3c	=	0x0032
                           000033   131 __tm3ct	=	0x0033
                           000034   132 __tm3s	=	0x0034
                           000035   133 __tm3b	=	0x0035
                           000039   134 __ilrcr	=	0x0039
                           00003A   135 __rop	=	0x003a
      000000                        136 __t16c::
      000000                        137 	.ds 2
                                    138 ;--------------------------------------------------------
                                    139 ; ram data
                                    140 ;--------------------------------------------------------
                                    141 	.area DATA
      000002                        142 _orange_color::
      000002                        143 	.ds 3
      000005                        144 _blue_color::
      000005                        145 	.ds 3
      000008                        146 _bright_orange_color::
      000008                        147 	.ds 3
      00000B                        148 _bright_blue_color::
      00000B                        149 	.ds 3
      00000E                        150 _off_color::
      00000E                        151 	.ds 3
      000011                        152 _pixel_buff::
      000011                        153 	.ds 12
      00001D                        154 _bytes::
      00001D                        155 	.ds 1
      00001E                        156 _byte_t::
      00001E                        157 	.ds 1
      00001F                        158 _byte_ctr::
      00001F                        159 	.ds 1
      000020                        160 _button_ctr::
      000020                        161 	.ds 1
      000021                        162 _button_down::
      000021                        163 	.ds 1
      000022                        164 _pattern_count::
      000022                        165 	.ds 1
      000023                        166 _pattern_index::
      000023                        167 	.ds 1
      000024                        168 _pattern_step::
      000024                        169 	.ds 1
      000025                        170 _tone_out_ctr::
      000025                        171 	.ds 1
      000026                        172 _tone_time::
      000026                        173 	.ds 1
      000027                        174 _copy_to_buff_PARM_1:
      000027                        175 	.ds 3
      00002A                        176 _copy_to_buff_PARM_2:
      00002A                        177 	.ds 1
      00002B                        178 _copy_to_buff_sloc0_1_0:
      00002B                        179 	.ds 1
      00002C                        180 _copy_to_buff_sloc1_1_0:
      00002C                        181 	.ds 1
      00002D                        182 _update_pattern_bright_10000_19:
      00002D                        183 	.ds 3
                                    184 ;--------------------------------------------------------
                                    185 ; overlayable items in ram
                                    186 ;--------------------------------------------------------
                                    187 ;--------------------------------------------------------
                                    188 ; Stack segment in internal ram
                                    189 ;--------------------------------------------------------
                                    190 	.area SSEG
      000047                        191 __start__stack:
      000047                        192 	.ds	1
                                    193 
                                    194 ;--------------------------------------------------------
                                    195 ; absolute external ram data
                                    196 ;--------------------------------------------------------
                                    197 	.area DABS (ABS)
                                    198 ;--------------------------------------------------------
                                    199 ; interrupt vector
                                    200 ;--------------------------------------------------------
                                    201 	.area HOME
      000022                        202 __interrupt_vect:
                                    203 	.area	HEADER (ABS)
      000020                        204 	.org	 0x0020
      000020 2D 31                  205 	goto	_interrupt
                                    206 ;--------------------------------------------------------
                                    207 ; global & static initialisations
                                    208 ;--------------------------------------------------------
                                    209 	.area HOME
                                    210 	.area GSINIT
                                    211 	.area GSFINAL
                                    212 	.area GSINIT
                                    213 	.area	PREG (ABS)
      000000                        214 	.org 0x00
      000000                        215 p::
      000000                        216 	.ds 2
                                    217 	.area	HEADER (ABS)
      000000                        218 	.org 0x0000
      000000 00 00                  219 	nop
      000002 01 13                  220 	clear	p+1
      000004 39 2F                  221 	mov	a, #s_OSEG
      000006 0F 28                  222 	add	a, #l_OSEG + 1
      000008 FE 2C                  223 	and	a, #0xfe
      00000A 82 01                  224 	mov.io	sp, a
      00000C FB 39                  225 	call	___sdcc_external_startup
      00000E 00 2B                  226 	cneqsn	a, #0x00
      000010 12 30                  227 	goto	__sdcc_init_data
      000012 11 30                  228 	goto	__sdcc_program_startup
                                    229 	.area GSINIT
      000024                        230 __sdcc_init_data:
      000024 02 2F                  231 	mov	a, #s_DATA
      000026 80 0B                  232 	mov	p, a
      000028 19 30                  233 	goto	00002$
      00002A                        234 00001$:
      00002A 00 2F                  235 	mov	a, #0x00
      00002C 80 03                  236 	idxm	p, a
      00002E 00 12                  237 	inc	p
      000030 02 2F                  238 	mov	a, #s_DATA
      000032                        239 00002$:
      000032 37 28                  240 	add	a, #l_DATA
      000034 00 17                  241 	ceqsn	a, p
      000036 15 30                  242 	goto	00001$
                                    243 ;	main.c: 25: color_t orange_color = {.r=64, .g=16, .b=0};
      000038 40 2F                  244 	mov	a, #0x40
      00003A 83 0B                  245 	mov	_orange_color+1, a
      00003C 10 2F                  246 	mov	a, #0x10
      00003E 82 0B                  247 	mov	_orange_color+0, a
      000040 04 13                  248 	clear	_orange_color+2
                                    249 ;	main.c: 26: color_t blue_color = {.r=0, .g=0, .b=128};
      000042 06 13                  250 	clear	_blue_color+1
      000044 05 13                  251 	clear	_blue_color+0
      000046 80 2F                  252 	mov	a, #0x80
      000048 87 0B                  253 	mov	_blue_color+2, a
                                    254 ;	main.c: 27: color_t bright_orange_color = {.r=80, .g=32, .b=16};
      00004A 50 2F                  255 	mov	a, #0x50
      00004C 89 0B                  256 	mov	_bright_orange_color+1, a
      00004E 20 2F                  257 	mov	a, #0x20
      000050 88 0B                  258 	mov	_bright_orange_color+0, a
      000052 10 2F                  259 	mov	a, #0x10
      000054 8A 0B                  260 	mov	_bright_orange_color+2, a
                                    261 ;	main.c: 28: color_t bright_blue_color = {.r=16, .g=16, .b=128};
      000056 10 2F                  262 	mov	a, #0x10
      000058 8C 0B                  263 	mov	_bright_blue_color+1, a
      00005A 10 2F                  264 	mov	a, #0x10
      00005C 8B 0B                  265 	mov	_bright_blue_color+0, a
      00005E 80 2F                  266 	mov	a, #0x80
      000060 8D 0B                  267 	mov	_bright_blue_color+2, a
                                    268 ;	main.c: 29: color_t off_color = {.r=0, .g=0, .b=0};
      000062 0F 13                  269 	clear	_off_color+1
      000064 0E 13                  270 	clear	_off_color+0
      000066 10 13                  271 	clear	_off_color+2
                                    272 ;	main.c: 34: volatile uint8_t bytes = LED_COUNT * 3;
      000068 0C 2F                  273 	mov	a, #0x0c
      00006A 9D 0B                  274 	mov	_bytes+0, a
                                    275 ;	main.c: 35: volatile uint8_t byte_t = 0;    
      00006C 1E 13                  276 	clear	_byte_t+0
                                    277 ;	main.c: 37: volatile uint8_t byte_ctr = 0;
      00006E 1F 13                  278 	clear	_byte_ctr+0
                                    279 ;	main.c: 38: volatile uint8_t button_ctr = 0;
      000070 20 13                  280 	clear	_button_ctr+0
                                    281 ;	main.c: 39: volatile uint8_t button_down = 0;
      000072 21 13                  282 	clear	_button_down+0
                                    283 ;	main.c: 40: volatile uint8_t pattern_count = 0;
      000074 22 13                  284 	clear	_pattern_count+0
                                    285 ;	main.c: 41: volatile uint8_t pattern_index = 0;
      000076 23 13                  286 	clear	_pattern_index+0
                                    287 ;	main.c: 42: volatile uint8_t pattern_step = 0;
      000078 24 13                  288 	clear	_pattern_step+0
                                    289 ;	main.c: 43: volatile uint8_t tone_out_ctr = 0;
      00007A 25 13                  290 	clear	_tone_out_ctr+0
                                    291 ;	main.c: 44: volatile uint8_t tone_time = 0;
      00007C 26 13                  292 	clear	_tone_time+0
                                    293 	.area GSFINAL
      00007E 11 30                  294 	goto	__sdcc_program_startup
                                    295 ;--------------------------------------------------------
                                    296 ; Home
                                    297 ;--------------------------------------------------------
                                    298 	.area HOME
                                    299 	.area HOME
      000022                        300 __sdcc_program_startup:
      000022 10 31                  301 	goto	_main
                                    302 ;	return from main will return to caller
                                    303 ;--------------------------------------------------------
                                    304 ; code
                                    305 ;--------------------------------------------------------
                                    306 	.area CODE
                                    307 ;	main.c: 47: void copy_to_buff(color_t pixel, uint8_t len) {
                                    308 ;	-----------------------------------------
                                    309 ;	 function copy_to_buff
                                    310 ;	-----------------------------------------
      000080                        311 _copy_to_buff:
                                    312 ;	main.c: 48: for (uint8_t i = 0; i < len ; i++) {
      000080 2B 13                  313 	clear	_copy_to_buff_sloc0_1_0+0
      000082                        314 00103$:
      000082 AB 0F                  315 	mov	a, _copy_to_buff_sloc0_1_0+0
      000084 AA 0C                  316 	sub	a, _copy_to_buff_PARM_2+0
      000086 40 1A                  317 	t1sn.io	f, c
      000088 65 30                  318 	goto	00105$
      00008A                        319 00120$:
                                    320 ;	main.c: 49: pixel_buff[i].r = pixel.r;
      00008A AB 0F                  321 	mov	a, _copy_to_buff_sloc0_1_0+0
      00008C 6B 00                  322 	sl	a
      00008E 2B 0C                  323 	add	a, _copy_to_buff_sloc0_1_0+0
      000090 AC 0B                  324 	mov	_copy_to_buff_sloc1_1_0+0, a
      000092 11 2F                  325 	mov	a, #(_pixel_buff + 0)
      000094 2C 0C                  326 	add	a, _copy_to_buff_sloc1_1_0+0
      000096 01 28                  327 	add	a, #0x01
      000098 72 00                  328 	push	af
      00009A A8 0F                  329 	mov	a, _copy_to_buff_PARM_1+1
      00009C 80 0B                  330 	mov	p, a
      00009E 73 00                  331 	pop	af
      0000A0 80 13                  332 	xch	a, p
      0000A2 80 03                  333 	idxm	p, a
                                    334 ;	main.c: 50: pixel_buff[i].g = pixel.g;
      0000A4 11 2F                  335 	mov	a, #(_pixel_buff + 0)
      0000A6 2C 0C                  336 	add	a, _copy_to_buff_sloc1_1_0+0
      0000A8 72 00                  337 	push	af
      0000AA A7 0F                  338 	mov	a, _copy_to_buff_PARM_1+0
      0000AC 80 0B                  339 	mov	p, a
      0000AE 73 00                  340 	pop	af
      0000B0 80 13                  341 	xch	a, p
      0000B2 80 03                  342 	idxm	p, a
                                    343 ;	main.c: 51: pixel_buff[i].b = pixel.b;
      0000B4 11 2F                  344 	mov	a, #(_pixel_buff + 0)
      0000B6 2C 0C                  345 	add	a, _copy_to_buff_sloc1_1_0+0
      0000B8 02 28                  346 	add	a, #0x02
      0000BA 72 00                  347 	push	af
      0000BC A9 0F                  348 	mov	a, _copy_to_buff_PARM_1+2
      0000BE 80 0B                  349 	mov	p, a
      0000C0 73 00                  350 	pop	af
      0000C2 80 13                  351 	xch	a, p
      0000C4 80 03                  352 	idxm	p, a
                                    353 ;	main.c: 48: for (uint8_t i = 0; i < len ; i++) {
      0000C6 2B 12                  354 	inc	_copy_to_buff_sloc0_1_0+0
      0000C8 41 30                  355 	goto	00103$
      0000CA                        356 00105$:
                                    357 ;	main.c: 53: }
      0000CA 7A 00                  358 	ret
                                    359 ;	main.c: 55: void start_tone_out_startup() {
                                    360 ;	-----------------------------------------
                                    361 ;	 function start_tone_out_startup
                                    362 ;	-----------------------------------------
      0000CC                        363 _start_tone_out_startup:
                                    364 ;	main.c: 56: tone_out_ctr = 0;
      0000CC 25 13                  365 	clear	_tone_out_ctr+0
                                    366 ;	main.c: 57: tone_time = STARTUP_TONE_TIME;
      0000CE 0A 2F                  367 	mov	a, #0x0a
      0000D0 A6 0B                  368 	mov	_tone_time+0, a
                                    369 ;	main.c: 58: TM2B = STARTUP_BOUNDS;
      0000D2 0A 2F                  370 	mov	a, #0x0a
      0000D4 9F 01                  371 	mov.io	__tm2b, a
                                    372 ;	main.c: 59: TM2C |= TM2C_CLK_IHRC;
      0000D6 5C 1F                  373 	set1.io	__tm2c, #5
                                    374 ;	main.c: 60: }
      0000D8 7A 00                  375 	ret
                                    376 ;	main.c: 62: void start_tone_out_button() {
                                    377 ;	-----------------------------------------
                                    378 ;	 function start_tone_out_button
                                    379 ;	-----------------------------------------
      0000DA                        380 _start_tone_out_button:
                                    381 ;	main.c: 63: tone_out_ctr = 0;
      0000DA 25 13                  382 	clear	_tone_out_ctr+0
                                    383 ;	main.c: 64: tone_time = BUTTON_TONE_TIME;
      0000DC 05 2F                  384 	mov	a, #0x05
      0000DE A6 0B                  385 	mov	_tone_time+0, a
                                    386 ;	main.c: 65: TM2B = BUTTON_BOUNDS;
      0000E0 05 2F                  387 	mov	a, #0x05
      0000E2 9F 01                  388 	mov.io	__tm2b, a
                                    389 ;	main.c: 66: TM2C |= TM2C_CLK_IHRC;
      0000E4 5C 1F                  390 	set1.io	__tm2c, #5
                                    391 ;	main.c: 67: }
      0000E6 7A 00                  392 	ret
                                    393 ;	main.c: 69: void stop_tone_out() {
                                    394 ;	-----------------------------------------
                                    395 ;	 function stop_tone_out
                                    396 ;	-----------------------------------------
      0000E8                        397 _stop_tone_out:
                                    398 ;	main.c: 70: tone_time = 0;
      0000E8 26 13                  399 	clear	_tone_time+0
                                    400 ;	main.c: 71: TM2C &= 0x0F; //0 out the top 4 bits for clock source
      0000EA DC 01                  401 	mov.io	a, __tm2c
      0000EC 0F 2C                  402 	and	a, #0x0f
      0000EE 9C 01                  403 	mov.io	__tm2c, a
                                    404 ;	main.c: 72: }
      0000F0 7A 00                  405 	ret
                                    406 ;	main.c: 74: void output_leds() 
                                    407 ;	-----------------------------------------
                                    408 ;	 function output_leds
                                    409 ;	-----------------------------------------
      0000F2                        410 _output_leds:
                                    411 ;	main.c: 110: __endasm;
      0000F2 9D 0F                  412 	mov	a, _bytes ;move our byte count into a
      0000F4 9F 0B                  413 	mov	_byte_ctr, a ;move a into our index counter
      0000F6 11 2F                  414 	mov	a, #(_pixel_buff) ;load the address of the array into a
      0000F8 80 0B                  415 	mov	p, a ;put that address into p (a mem location)
      0000FA                        416 00010$:
      0000FA 81 03                  417 	idxm	a, p ;load the byte data from the array into a
      0000FC 00 12                  418 	inc	p ;inc p to the next address
      0000FE 9E 0B                  419 	mov	_byte_t+0, a ;load the byte data into byte_t
      000100 08 2F                  420 	mov	a, #0x08 ;reset the bit count
      000102                        421 00011$:
                                    422 ;output	bit
      000102 50 1F                  423 	set1.io	__pa, #5 ;set the output pin high
      000104 DE 23                  424 	t1sn	_byte_t, #7 ;if the current MSB is 1, skip setting the pin low now
      000106 50 1D                  425 	set0.io	__pa, #5 ;set the output pin low
      000108 00 00                  426 	nop	;wait one cycle
      00010A 50 1D                  427 	set0.io	__pa, #5 ;set the output pin low
      00010C 9E 15                  428 	sl	_byte_t ;left-shift the data byte (the LEDs are MSB first)
      00010E 63 00                  429 	dzsn	a ;dec a and skip next instruction if 0
      000110 81 30                  430 	goto	00011$ ;jump back to 00011
      000112 9F 11                  431 	dzsn	_byte_ctr ;dec our index counter and skip the goto if 0
      000114 7D 30                  432 	goto	00010$ ;goto the next byte
                                    433 ;	main.c: 111: }
      000116 7A 00                  434 	ret
                                    435 ;	main.c: 113: void update_pattern() 
                                    436 ;	-----------------------------------------
                                    437 ;	 function update_pattern
                                    438 ;	-----------------------------------------
      000118                        439 _update_pattern:
                                    440 ;	main.c: 118: switch (pattern_index)
      000118 A3 0F                  441 	mov	a, _pattern_index+0
      00011A 00 2B                  442 	cneqsn	a, #0x00
      00011C 94 30                  443 	goto	00101$
      00011E                        444 00169$:
      00011E 01 2B                  445 	cneqsn	a, #0x01
      000120 A2 30                  446 	goto	00102$
      000122                        447 00171$:
      000122 02 2B                  448 	cneqsn	a, #0x02
      000124 BA 30                  449 	goto	00103$
      000126                        450 00173$:
      000126 D1 30                  451 	goto	00104$
                                    452 ;	main.c: 120: case 0:            
      000128                        453 00101$:
                                    454 ;	main.c: 121: copy_to_buff(off_color, LED_COUNT);            
      000128 0E 2F                  455 	mov	a, #(_off_color + 0)
      00012A BB 0B                  456 	mov	___memcpy_PARM_2+0, a
      00012C 3C 13                  457 	clear	___memcpy_PARM_2+1
      00012E 27 2F                  458 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000130 B9 0B                  459 	mov	___memcpy_PARM_1+0, a
      000132 3A 13                  460 	clear	___memcpy_PARM_1+1
      000134 03 2F                  461 	mov	a, #0x03
      000136 BD 0B                  462 	mov	___memcpy_PARM_3+0, a
      000138 3E 13                  463 	clear	___memcpy_PARM_3+1
      00013A 6B 39                  464 	call	___memcpy
      00013C 04 2F                  465 	mov	a, #0x04
      00013E AA 0B                  466 	mov	_copy_to_buff_PARM_2+0, a
      000140 40 30                  467 	goto	_copy_to_buff
                                    468 ;	main.c: 122: return;         
      000142 7A 00                  469 	ret
                                    470 ;	main.c: 123: case 1:
      000144                        471 00102$:
                                    472 ;	main.c: 124: copy_to_buff(blue_color, LED_COUNT);
      000144 05 2F                  473 	mov	a, #(_blue_color + 0)
      000146 BB 0B                  474 	mov	___memcpy_PARM_2+0, a
      000148 3C 13                  475 	clear	___memcpy_PARM_2+1
      00014A 27 2F                  476 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      00014C B9 0B                  477 	mov	___memcpy_PARM_1+0, a
      00014E 3A 13                  478 	clear	___memcpy_PARM_1+1
      000150 03 2F                  479 	mov	a, #0x03
      000152 BD 0B                  480 	mov	___memcpy_PARM_3+0, a
      000154 3E 13                  481 	clear	___memcpy_PARM_3+1
      000156 6B 39                  482 	call	___memcpy
      000158 04 2F                  483 	mov	a, #0x04
      00015A AA 0B                  484 	mov	_copy_to_buff_PARM_2+0, a
      00015C 40 38                  485 	call	_copy_to_buff
                                    486 ;	main.c: 125: bright = bright_blue_color;
      00015E 2D 2F                  487 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      000160 B9 0B                  488 	mov	___memcpy_PARM_1+0, a
      000162 3A 13                  489 	clear	___memcpy_PARM_1+1
      000164 0B 2F                  490 	mov	a, #(_bright_blue_color + 0)
      000166 BB 0B                  491 	mov	___memcpy_PARM_2+0, a
      000168 3C 13                  492 	clear	___memcpy_PARM_2+1
      00016A 03 2F                  493 	mov	a, #0x03
      00016C BD 0B                  494 	mov	___memcpy_PARM_3+0, a
      00016E 3E 13                  495 	clear	___memcpy_PARM_3+1
      000170 6B 39                  496 	call	___memcpy
                                    497 ;	main.c: 126: break;            
      000172 D1 30                  498 	goto	00104$
                                    499 ;	main.c: 127: case 2:
      000174                        500 00103$:
                                    501 ;	main.c: 128: copy_to_buff(orange_color, LED_COUNT);
      000174 02 2F                  502 	mov	a, #(_orange_color + 0)
      000176 BB 0B                  503 	mov	___memcpy_PARM_2+0, a
      000178 3C 13                  504 	clear	___memcpy_PARM_2+1
      00017A 27 2F                  505 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      00017C B9 0B                  506 	mov	___memcpy_PARM_1+0, a
      00017E 3A 13                  507 	clear	___memcpy_PARM_1+1
      000180 03 2F                  508 	mov	a, #0x03
      000182 BD 0B                  509 	mov	___memcpy_PARM_3+0, a
      000184 3E 13                  510 	clear	___memcpy_PARM_3+1
      000186 6B 39                  511 	call	___memcpy
      000188 04 2F                  512 	mov	a, #0x04
      00018A AA 0B                  513 	mov	_copy_to_buff_PARM_2+0, a
      00018C 40 38                  514 	call	_copy_to_buff
                                    515 ;	main.c: 129: bright = bright_orange_color;
      00018E 2D 2F                  516 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      000190 B9 0B                  517 	mov	___memcpy_PARM_1+0, a
      000192 3A 13                  518 	clear	___memcpy_PARM_1+1
      000194 08 2F                  519 	mov	a, #(_bright_orange_color + 0)
      000196 BB 0B                  520 	mov	___memcpy_PARM_2+0, a
      000198 3C 13                  521 	clear	___memcpy_PARM_2+1
      00019A 03 2F                  522 	mov	a, #0x03
      00019C BD 0B                  523 	mov	___memcpy_PARM_3+0, a
      00019E 3E 13                  524 	clear	___memcpy_PARM_3+1
      0001A0 6B 39                  525 	call	___memcpy
                                    526 ;	main.c: 131: }
      0001A2                        527 00104$:
                                    528 ;	main.c: 133: pattern_step++;
      0001A2 A4 0F                  529 	mov	a, _pattern_step+0
      0001A4 01 28                  530 	add	a, #0x01
      0001A6 A4 0B                  531 	mov	_pattern_step+0, a
                                    532 ;	main.c: 135: switch (pattern_step)
      0001A8 A4 0F                  533 	mov	a, _pattern_step+0
      0001AA 01 2B                  534 	cneqsn	a, #0x01
      0001AC E2 30                  535 	goto	00105$
      0001AE                        536 00175$:
      0001AE 03 2B                  537 	cneqsn	a, #0x03
      0001B0 ED 30                  538 	goto	00106$
      0001B2                        539 00177$:
      0001B2 04 2B                  540 	cneqsn	a, #0x04
      0001B4 F8 30                  541 	goto	00107$
      0001B6                        542 00179$:
      0001B6 06 2B                  543 	cneqsn	a, #0x06
      0001B8 03 31                  544 	goto	00109$
      0001BA                        545 00181$:
      0001BA 07 2B                  546 	cneqsn	a, #0x07
      0001BC 03 31                  547 	goto	00109$
      0001BE                        548 00183$:
      0001BE 0A 2B                  549 	cneqsn	a, #0x0a
      0001C0 0E 31                  550 	goto	00110$
      0001C2                        551 00185$:
      0001C2 0F 31                  552 	goto	00112$
                                    553 ;	main.c: 137: case 1:
      0001C4                        554 00105$:
                                    555 ;	main.c: 138: pixel_buff[0] = bright;
      0001C4 11 2F                  556 	mov	a, #(_pixel_buff + 0)
      0001C6 B9 0B                  557 	mov	___memcpy_PARM_1+0, a
      0001C8 3A 13                  558 	clear	___memcpy_PARM_1+1
      0001CA 2D 2F                  559 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001CC BB 0B                  560 	mov	___memcpy_PARM_2+0, a
      0001CE 3C 13                  561 	clear	___memcpy_PARM_2+1
      0001D0 03 2F                  562 	mov	a, #0x03
      0001D2 BD 0B                  563 	mov	___memcpy_PARM_3+0, a
      0001D4 3E 13                  564 	clear	___memcpy_PARM_3+1
      0001D6 6B 31                  565 	goto	___memcpy
                                    566 ;	main.c: 139: break;
      0001D8 0F 31                  567 	goto	00112$
                                    568 ;	main.c: 140: case 3:
      0001DA                        569 00106$:
                                    570 ;	main.c: 141: pixel_buff[1] = bright;
      0001DA 14 2F                  571 	mov	a, #(_pixel_buff + 3)
      0001DC B9 0B                  572 	mov	___memcpy_PARM_1+0, a
      0001DE 3A 13                  573 	clear	___memcpy_PARM_1+1
      0001E0 2D 2F                  574 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001E2 BB 0B                  575 	mov	___memcpy_PARM_2+0, a
      0001E4 3C 13                  576 	clear	___memcpy_PARM_2+1
      0001E6 03 2F                  577 	mov	a, #0x03
      0001E8 BD 0B                  578 	mov	___memcpy_PARM_3+0, a
      0001EA 3E 13                  579 	clear	___memcpy_PARM_3+1
      0001EC 6B 31                  580 	goto	___memcpy
                                    581 ;	main.c: 142: break;    
      0001EE 0F 31                  582 	goto	00112$
                                    583 ;	main.c: 143: case 4:
      0001F0                        584 00107$:
                                    585 ;	main.c: 144: pixel_buff[2] = bright;
      0001F0 17 2F                  586 	mov	a, #(_pixel_buff + 6)
      0001F2 B9 0B                  587 	mov	___memcpy_PARM_1+0, a
      0001F4 3A 13                  588 	clear	___memcpy_PARM_1+1
      0001F6 2D 2F                  589 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001F8 BB 0B                  590 	mov	___memcpy_PARM_2+0, a
      0001FA 3C 13                  591 	clear	___memcpy_PARM_2+1
      0001FC 03 2F                  592 	mov	a, #0x03
      0001FE BD 0B                  593 	mov	___memcpy_PARM_3+0, a
      000200 3E 13                  594 	clear	___memcpy_PARM_3+1
      000202 6B 31                  595 	goto	___memcpy
                                    596 ;	main.c: 145: break;   
      000204 0F 31                  597 	goto	00112$
                                    598 ;	main.c: 147: case 7:
      000206                        599 00109$:
                                    600 ;	main.c: 148: pixel_buff[3] = bright;
      000206 1A 2F                  601 	mov	a, #(_pixel_buff + 9)
      000208 B9 0B                  602 	mov	___memcpy_PARM_1+0, a
      00020A 3A 13                  603 	clear	___memcpy_PARM_1+1
      00020C 2D 2F                  604 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      00020E BB 0B                  605 	mov	___memcpy_PARM_2+0, a
      000210 3C 13                  606 	clear	___memcpy_PARM_2+1
      000212 03 2F                  607 	mov	a, #0x03
      000214 BD 0B                  608 	mov	___memcpy_PARM_3+0, a
      000216 3E 13                  609 	clear	___memcpy_PARM_3+1
      000218 6B 31                  610 	goto	___memcpy
                                    611 ;	main.c: 149: break;                
      00021A 0F 31                  612 	goto	00112$
                                    613 ;	main.c: 150: case 10:
      00021C                        614 00110$:
                                    615 ;	main.c: 151: pattern_step = 0;
      00021C 24 13                  616 	clear	_pattern_step+0
                                    617 ;	main.c: 153: } 
      00021E                        618 00112$:
                                    619 ;	main.c: 156: }
      00021E 7A 00                  620 	ret
                                    621 ;	main.c: 158: void main(void) {
                                    622 ;	-----------------------------------------
                                    623 ;	 function main
                                    624 ;	-----------------------------------------
      000220                        625 _main:
                                    626 ;	main.c: 160: __disgint();
      000220 79 00                  627 	disgint
                                    628 ;	main.c: 161: CLKMD |= 0x10;           //First enable IHRC
      000222 03 1F                  629 	set1.io	__clkmd, #4
                                    630 ;	main.c: 162: CLKMD = 0x34;           //Switch to IHRC/2 but leave ILRC on
      000224 34 2F                  631 	mov	a, #0x34
      000226 83 01                  632 	mov.io	__clkmd, a
                                    633 ;	main.c: 163: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
      000228 43 1C                  634 	set0.io	__clkmd, #1
                                    635 ;	main.c: 164: PAC = LED_bm; //Pin 5 as out
      00022A 20 2F                  636 	mov	a, #0x20
      00022C 91 01                  637 	mov.io	__pac, a
                                    638 ;	main.c: 165: PAPL = BTN_bm; //Pull Pin 4 low internally
      00022E 10 2F                  639 	mov	a, #0x10
      000230 93 01                  640 	mov.io	__papl, a
                                    641 ;	main.c: 166: PAC &= ~(BTN_bm); //Pin 4 as in
      000232 11 1D                  642 	set0.io	__pac, #4
                                    643 ;	main.c: 167: PADIER |= BTN_bm; //Enable digital in
      000234 0D 1F                  644 	set1.io	__padier, #4
                                    645 ;	main.c: 170: INTEN = INTEN_TM3;
      000236 80 2F                  646 	mov	a, #0x80
      000238 84 01                  647 	mov.io	__inten, a
                                    648 ;	main.c: 173: TM3B = 10;
      00023A 0A 2F                  649 	mov	a, #0x0a
      00023C B5 01                  650 	mov.io	__tm3b, a
                                    651 ;	main.c: 174: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
      00023E 40 2F                  652 	mov	a, #0x40
      000240 B2 01                  653 	mov.io	__tm3c, a
                                    654 ;	main.c: 175: TM3S = TM3S_PRESCALE_DIV64; //should also start the timer
      000242 60 2F                  655 	mov	a, #0x60
      000244 B4 01                  656 	mov.io	__tm3s, a
                                    657 ;	main.c: 177: TM2B = 10;
      000246 0A 2F                  658 	mov	a, #0x0a
      000248 9F 01                  659 	mov.io	__tm2b, a
                                    660 ;	main.c: 178: TM2C = TM2C_CLK_DISABLE | TM2C_OUT_PA3 | TM3C_MODE_PERIOD;
      00024A 08 2F                  661 	mov	a, #0x08
      00024C 9C 01                  662 	mov.io	__tm2c, a
                                    663 ;	main.c: 179: TM2S = TM2S_PRESCALE_DIV16;
      00024E 40 2F                  664 	mov	a, #0x40
      000250 9E 01                  665 	mov.io	__tm2s, a
                                    666 ;	main.c: 181: __engint();
      000252 78 00                  667 	engint
                                    668 ;	main.c: 184: start_tone_out_startup();
      000254 66 38                  669 	call	_start_tone_out_startup
                                    670 ;	main.c: 186: while(1) ;
      000256                        671 00102$:
      000256 2B 31                  672 	goto	00102$
                                    673 ;	main.c: 187: }
      000258 7A 00                  674 	ret
                                    675 ;	main.c: 189: void interrupt(void) __interrupt(0) {
                                    676 ;	-----------------------------------------
                                    677 ;	 function interrupt
                                    678 ;	-----------------------------------------
      00025A                        679 _interrupt:
      00025A 72 00                  680 	push	af
      00025C 80 0F                  681 	mov	a, p
      00025E 72 00                  682 	push	af
                                    683 ;	main.c: 191: if( INTRQ & INTRQ_TM3 ) //Timer3 interrupt request
      000260 C5 01                  684 	mov.io	a, __intrq
      000262 80 2C                  685 	and	a, #0x80
      000264 00 2B                  686 	cneqsn	a, #0x00
      000266 67 31                  687 	goto	00116$
      000268                        688 00160$:
                                    689 ;	main.c: 194: if (PA & BTN_bm) {
      000268 D0 01                  690 	mov.io	a, __pa
      00026A 10 2C                  691 	and	a, #0x10
      00026C 00 2B                  692 	cneqsn	a, #0x00
      00026E 51 31                  693 	goto	00106$
      000270                        694 00161$:
                                    695 ;	main.c: 196: if (!button_down)
      000270 A1 0F                  696 	mov	a, _button_down+0
      000272 00 2A                  697 	ceqsn	a, #0x00
      000274 53 31                  698 	goto	00107$
      000276                        699 00162$:
                                    700 ;	main.c: 198: button_ctr++;
      000276 A0 0F                  701 	mov	a, _button_ctr+0
      000278 01 28                  702 	add	a, #0x01
      00027A A0 0B                  703 	mov	_button_ctr+0, a
                                    704 ;	main.c: 200: if (button_ctr == BTN_DEBOUNCE_DELAY)
      00027C A0 0F                  705 	mov	a, _button_ctr+0
      00027E 05 2A                  706 	ceqsn	a, #0x05
      000280 53 31                  707 	goto	00107$
      000282                        708 00163$:
                                    709 ;	main.c: 202: button_down = 1;
      000282 01 2F                  710 	mov	a, #0x01
      000284 A1 0B                  711 	mov	_button_down+0, a
                                    712 ;	main.c: 203: pattern_index = (pattern_index + 1) % 3;      
      000286 A3 0F                  713 	mov	a, _pattern_index+0
      000288 01 28                  714 	add	a, #0x01
      00028A B0 0B                  715 	mov	__modsint_PARM_1+0, a
      00028C 00 2F                  716 	mov	a, #0x00
      00028E 60 00                  717 	addc	a
      000290 B1 0B                  718 	mov	__modsint_PARM_1+1, a
      000292 03 2F                  719 	mov	a, #0x03
      000294 B2 0B                  720 	mov	__modsint_PARM_2+0, a
      000296 33 13                  721 	clear	__modsint_PARM_2+1
      000298 94 39                  722 	call	__modsint
      00029A A3 0B                  723 	mov	_pattern_index+0, a
                                    724 ;	main.c: 204: pattern_step = 0;     
      00029C 24 13                  725 	clear	_pattern_step+0
                                    726 ;	main.c: 205: start_tone_out_button();  
      00029E 6D 38                  727 	call	_start_tone_out_button
      0002A0 53 31                  728 	goto	00107$
      0002A2                        729 00106$:
                                    730 ;	main.c: 214: button_ctr = 0;
      0002A2 20 13                  731 	clear	_button_ctr+0
                                    732 ;	main.c: 215: button_down = 0;
      0002A4 21 13                  733 	clear	_button_down+0
      0002A6                        734 00107$:
                                    735 ;	main.c: 218: pattern_count++;
      0002A6 A2 0F                  736 	mov	a, _pattern_count+0
      0002A8 01 28                  737 	add	a, #0x01
      0002AA A2 0B                  738 	mov	_pattern_count+0, a
                                    739 ;	main.c: 220: if (pattern_count == PATTERN_UPDATE_DELAY) 
      0002AC A2 0F                  740 	mov	a, _pattern_count+0
      0002AE 32 2A                  741 	ceqsn	a, #0x32
      0002B0 5C 31                  742 	goto	00109$
      0002B2                        743 00164$:
                                    744 ;	main.c: 222: update_pattern();
      0002B2 8C 38                  745 	call	_update_pattern
                                    746 ;	main.c: 223: output_leds();
      0002B4 79 38                  747 	call	_output_leds
                                    748 ;	main.c: 224: pattern_count = 0;
      0002B6 22 13                  749 	clear	_pattern_count+0
      0002B8                        750 00109$:
                                    751 ;	main.c: 227: if (tone_time) {
      0002B8 A6 0F                  752 	mov	a, _tone_time+0
      0002BA 00 2B                  753 	cneqsn	a, #0x00
      0002BC 66 31                  754 	goto	00113$
      0002BE                        755 00165$:
                                    756 ;	main.c: 228: tone_out_ctr++;
      0002BE A5 0F                  757 	mov	a, _tone_out_ctr+0
      0002C0 01 28                  758 	add	a, #0x01
      0002C2 A5 0B                  759 	mov	_tone_out_ctr+0, a
                                    760 ;	main.c: 230: if (tone_out_ctr >= tone_time) {
      0002C4 A5 0F                  761 	mov	a, _tone_out_ctr+0
      0002C6 A6 0C                  762 	sub	a, _tone_time+0
                                    763 ;	main.c: 231: stop_tone_out();
      0002C8 40 1A                  764 	t1sn.io	f, c
      0002CA 74 38                  765 	call	_stop_tone_out
      0002CC                        766 00113$:
                                    767 ;	main.c: 237: INTRQ &= ~INTRQ_TM3; //Clear interrupt flag
      0002CC C5 1D                  768 	set0.io	__intrq, #7
      0002CE                        769 00116$:
                                    770 ;	main.c: 240: }
      0002CE 73 00                  771 	pop	af
      0002D0 80 0B                  772 	mov	p, a
      0002D2 73 00                  773 	pop	af
      0002D4 7B 00                  774 	reti
                                    775 	.area CODE
                                    776 	.area CONST
                                    777 	.area CABS (ABS)
