                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.4.4 #15018 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 	.optsdcc -mpdk14
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
      000020 2B 31                  205 	goto	_interrupt
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
      00000C F5 39                  225 	call	___sdcc_external_startup
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
      000022 0E 31                  301 	goto	_main
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
      000088 7A 00                  318 	ret
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
                                    356 ;	main.c: 53: }
      0000CA 7A 00                  357 	ret
                                    358 ;	main.c: 55: void start_tone_out_startup() {
                                    359 ;	-----------------------------------------
                                    360 ;	 function start_tone_out_startup
                                    361 ;	-----------------------------------------
      0000CC                        362 _start_tone_out_startup:
                                    363 ;	main.c: 56: tone_out_ctr = 0;
      0000CC 25 13                  364 	clear	_tone_out_ctr+0
                                    365 ;	main.c: 57: tone_time = STARTUP_TONE_TIME;
                                    366 ;	main.c: 58: TM2B = STARTUP_BOUNDS;
      0000CE 0A 2F                  367 	mov a, #0x0a
      0000D0 A6 0B                  368 	mov  _tone_time+0, a
      0000D2 9F 01                  369 	mov.io	__tm2b, a
                                    370 ;	main.c: 59: TM2C |= TM2C_CLK_IHRC;
      0000D4 5C 1F                  371 	set1.io	__tm2c, #5
                                    372 ;	main.c: 60: }
      0000D6 7A 00                  373 	ret
                                    374 ;	main.c: 62: void start_tone_out_button() {
                                    375 ;	-----------------------------------------
                                    376 ;	 function start_tone_out_button
                                    377 ;	-----------------------------------------
      0000D8                        378 _start_tone_out_button:
                                    379 ;	main.c: 63: tone_out_ctr = 0;
      0000D8 25 13                  380 	clear	_tone_out_ctr+0
                                    381 ;	main.c: 64: tone_time = BUTTON_TONE_TIME;
                                    382 ;	main.c: 65: TM2B = BUTTON_BOUNDS;
      0000DA 05 2F                  383 	mov a, #0x05
      0000DC A6 0B                  384 	mov  _tone_time+0, a
      0000DE 9F 01                  385 	mov.io	__tm2b, a
                                    386 ;	main.c: 66: TM2C |= TM2C_CLK_IHRC;
      0000E0 5C 1F                  387 	set1.io	__tm2c, #5
                                    388 ;	main.c: 67: }
      0000E2 7A 00                  389 	ret
                                    390 ;	main.c: 69: void stop_tone_out() {
                                    391 ;	-----------------------------------------
                                    392 ;	 function stop_tone_out
                                    393 ;	-----------------------------------------
      0000E4                        394 _stop_tone_out:
                                    395 ;	main.c: 70: tone_time = 0;
      0000E4 26 13                  396 	clear	_tone_time+0
                                    397 ;	main.c: 71: TM2C &= 0x0F; //0 out the top 4 bits for clock source
      0000E6 DC 01                  398 	mov.io	a, __tm2c
      0000E8 0F 2C                  399 	and	a, #0x0f
      0000EA 9C 01                  400 	mov.io	__tm2c, a
                                    401 ;	main.c: 72: }
      0000EC 7A 00                  402 	ret
                                    403 ;	main.c: 74: void output_leds() 
                                    404 ;	-----------------------------------------
                                    405 ;	 function output_leds
                                    406 ;	-----------------------------------------
      0000EE                        407 _output_leds:
                                    408 ;	main.c: 110: __endasm;
      0000EE 9D 0F                  409 	mov	a, _bytes ;move our byte count into a
      0000F0 9F 0B                  410 	mov	_byte_ctr, a ;move a into our index counter
      0000F2 11 2F                  411 	mov	a, #(_pixel_buff) ;load the address of the array into a
      0000F4 80 0B                  412 	mov	p, a ;put that address into p (a mem location)
      0000F6                        413 00010$:
      0000F6 81 03                  414 	idxm	a, p ;load the byte data from the array into a
      0000F8 00 12                  415 	inc	p ;inc p to the next address
      0000FA 9E 0B                  416 	mov	_byte_t+0, a ;load the byte data into byte_t
      0000FC 08 2F                  417 	mov	a, #0x08 ;reset the bit count
      0000FE                        418 00011$:
                                    419 ;output	bit
      0000FE 50 1F                  420 	set1.io	__pa, #5 ;set the output pin high
      000100 DE 23                  421 	t1sn	_byte_t, #7 ;if the current MSB is 1, skip setting the pin low now
      000102 50 1D                  422 	set0.io	__pa, #5 ;set the output pin low
      000104 00 00                  423 	nop	;wait one cycle
      000106 50 1D                  424 	set0.io	__pa, #5 ;set the output pin low
      000108 9E 15                  425 	sl	_byte_t ;left-shift the data byte (the LEDs are MSB first)
      00010A 63 00                  426 	dzsn	a ;dec a and skip next instruction if 0
      00010C 7F 30                  427 	goto	00011$ ;jump back to 00011
      00010E 9F 11                  428 	dzsn	_byte_ctr ;dec our index counter and skip the goto if 0
      000110 7B 30                  429 	goto	00010$ ;goto the next byte
                                    430 ;	main.c: 111: }
      000112 7A 00                  431 	ret
                                    432 ;	main.c: 113: void update_pattern() 
                                    433 ;	-----------------------------------------
                                    434 ;	 function update_pattern
                                    435 ;	-----------------------------------------
      000114                        436 _update_pattern:
                                    437 ;	main.c: 118: switch (pattern_index)
      000114 A3 0F                  438 	mov	a, _pattern_index+0
      000116 00 2B                  439 	cneqsn	a, #0x00
      000118 92 30                  440 	goto	00101$
      00011A                        441 00169$:
      00011A 01 2B                  442 	cneqsn	a, #0x01
      00011C A0 30                  443 	goto	00102$
      00011E                        444 00171$:
      00011E 02 2B                  445 	cneqsn	a, #0x02
      000120 B8 30                  446 	goto	00103$
      000122                        447 00173$:
      000122 CF 30                  448 	goto	00104$
                                    449 ;	main.c: 120: case 0:            
      000124                        450 00101$:
                                    451 ;	main.c: 121: copy_to_buff(off_color, LED_COUNT);            
      000124 0E 2F                  452 	mov	a, #(_off_color + 0)
      000126 BB 0B                  453 	mov	___memcpy_PARM_2+0, a
      000128 3C 13                  454 	clear	___memcpy_PARM_2+1
      00012A 27 2F                  455 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      00012C B9 0B                  456 	mov	___memcpy_PARM_1+0, a
      00012E 3A 13                  457 	clear	___memcpy_PARM_1+1
      000130 03 2F                  458 	mov	a, #0x03
      000132 BD 0B                  459 	mov	___memcpy_PARM_3+0, a
      000134 3E 13                  460 	clear	___memcpy_PARM_3+1
      000136 65 39                  461 	call	___memcpy
      000138 04 2F                  462 	mov	a, #0x04
      00013A AA 0B                  463 	mov	_copy_to_buff_PARM_2+0, a
      00013C 40 30                  464 	goto	_copy_to_buff
                                    465 ;	main.c: 122: return;         
      00013E 7A 00                  466 	ret
                                    467 ;	main.c: 123: case 1:
      000140                        468 00102$:
                                    469 ;	main.c: 124: copy_to_buff(blue_color, LED_COUNT);
      000140 05 2F                  470 	mov	a, #(_blue_color + 0)
      000142 BB 0B                  471 	mov	___memcpy_PARM_2+0, a
      000144 3C 13                  472 	clear	___memcpy_PARM_2+1
      000146 27 2F                  473 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000148 B9 0B                  474 	mov	___memcpy_PARM_1+0, a
      00014A 3A 13                  475 	clear	___memcpy_PARM_1+1
      00014C 03 2F                  476 	mov	a, #0x03
      00014E BD 0B                  477 	mov	___memcpy_PARM_3+0, a
      000150 3E 13                  478 	clear	___memcpy_PARM_3+1
      000152 65 39                  479 	call	___memcpy
      000154 04 2F                  480 	mov	a, #0x04
      000156 AA 0B                  481 	mov	_copy_to_buff_PARM_2+0, a
      000158 40 38                  482 	call	_copy_to_buff
                                    483 ;	main.c: 125: bright = bright_blue_color;
      00015A 2D 2F                  484 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      00015C B9 0B                  485 	mov	___memcpy_PARM_1+0, a
      00015E 3A 13                  486 	clear	___memcpy_PARM_1+1
      000160 0B 2F                  487 	mov	a, #(_bright_blue_color + 0)
      000162 BB 0B                  488 	mov	___memcpy_PARM_2+0, a
      000164 3C 13                  489 	clear	___memcpy_PARM_2+1
      000166 03 2F                  490 	mov	a, #0x03
      000168 BD 0B                  491 	mov	___memcpy_PARM_3+0, a
      00016A 3E 13                  492 	clear	___memcpy_PARM_3+1
      00016C 65 39                  493 	call	___memcpy
                                    494 ;	main.c: 126: break;            
      00016E CF 30                  495 	goto	00104$
                                    496 ;	main.c: 127: case 2:
      000170                        497 00103$:
                                    498 ;	main.c: 128: copy_to_buff(orange_color, LED_COUNT);
      000170 02 2F                  499 	mov	a, #(_orange_color + 0)
      000172 BB 0B                  500 	mov	___memcpy_PARM_2+0, a
      000174 3C 13                  501 	clear	___memcpy_PARM_2+1
      000176 27 2F                  502 	mov	a, #(_copy_to_buff_PARM_1 + 0)
      000178 B9 0B                  503 	mov	___memcpy_PARM_1+0, a
      00017A 3A 13                  504 	clear	___memcpy_PARM_1+1
      00017C 03 2F                  505 	mov	a, #0x03
      00017E BD 0B                  506 	mov	___memcpy_PARM_3+0, a
      000180 3E 13                  507 	clear	___memcpy_PARM_3+1
      000182 65 39                  508 	call	___memcpy
      000184 04 2F                  509 	mov	a, #0x04
      000186 AA 0B                  510 	mov	_copy_to_buff_PARM_2+0, a
      000188 40 38                  511 	call	_copy_to_buff
                                    512 ;	main.c: 129: bright = bright_orange_color;
      00018A 2D 2F                  513 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      00018C B9 0B                  514 	mov	___memcpy_PARM_1+0, a
      00018E 3A 13                  515 	clear	___memcpy_PARM_1+1
      000190 08 2F                  516 	mov	a, #(_bright_orange_color + 0)
      000192 BB 0B                  517 	mov	___memcpy_PARM_2+0, a
      000194 3C 13                  518 	clear	___memcpy_PARM_2+1
      000196 03 2F                  519 	mov	a, #0x03
      000198 BD 0B                  520 	mov	___memcpy_PARM_3+0, a
      00019A 3E 13                  521 	clear	___memcpy_PARM_3+1
      00019C 65 39                  522 	call	___memcpy
                                    523 ;	main.c: 131: }
      00019E                        524 00104$:
                                    525 ;	main.c: 133: pattern_step++;
      00019E A4 0F                  526 	mov	a, _pattern_step+0
      0001A0 01 28                  527 	add	a, #0x01
      0001A2 A4 0B                  528 	mov	_pattern_step+0, a
                                    529 ;	main.c: 135: switch (pattern_step)
      0001A4 A4 0F                  530 	mov	a, _pattern_step+0
      0001A6 01 2B                  531 	cneqsn	a, #0x01
      0001A8 E0 30                  532 	goto	00105$
      0001AA                        533 00175$:
      0001AA 03 2B                  534 	cneqsn	a, #0x03
      0001AC EB 30                  535 	goto	00106$
      0001AE                        536 00177$:
      0001AE 04 2B                  537 	cneqsn	a, #0x04
      0001B0 F6 30                  538 	goto	00107$
      0001B2                        539 00179$:
      0001B2 06 2B                  540 	cneqsn	a, #0x06
      0001B4 01 31                  541 	goto	00109$
      0001B6                        542 00181$:
      0001B6 07 2B                  543 	cneqsn	a, #0x07
      0001B8 01 31                  544 	goto	00109$
      0001BA                        545 00183$:
      0001BA 0A 2B                  546 	cneqsn	a, #0x0a
      0001BC 0C 31                  547 	goto	00110$
      0001BE                        548 00185$:
      0001BE 7A 00                  549 	ret
                                    550 ;	main.c: 137: case 1:
      0001C0                        551 00105$:
                                    552 ;	main.c: 138: pixel_buff[0] = bright;
      0001C0 11 2F                  553 	mov	a, #(_pixel_buff + 0)
      0001C2 B9 0B                  554 	mov	___memcpy_PARM_1+0, a
      0001C4 3A 13                  555 	clear	___memcpy_PARM_1+1
      0001C6 2D 2F                  556 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001C8 BB 0B                  557 	mov	___memcpy_PARM_2+0, a
      0001CA 3C 13                  558 	clear	___memcpy_PARM_2+1
      0001CC 03 2F                  559 	mov	a, #0x03
      0001CE BD 0B                  560 	mov	___memcpy_PARM_3+0, a
      0001D0 3E 13                  561 	clear	___memcpy_PARM_3+1
      0001D2 65 31                  562 	goto	___memcpy
                                    563 ;	main.c: 139: break;
      0001D4 7A 00                  564 	ret
                                    565 ;	main.c: 140: case 3:
      0001D6                        566 00106$:
                                    567 ;	main.c: 141: pixel_buff[1] = bright;
      0001D6 14 2F                  568 	mov	a, #(_pixel_buff + 3)
      0001D8 B9 0B                  569 	mov	___memcpy_PARM_1+0, a
      0001DA 3A 13                  570 	clear	___memcpy_PARM_1+1
      0001DC 2D 2F                  571 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001DE BB 0B                  572 	mov	___memcpy_PARM_2+0, a
      0001E0 3C 13                  573 	clear	___memcpy_PARM_2+1
      0001E2 03 2F                  574 	mov	a, #0x03
      0001E4 BD 0B                  575 	mov	___memcpy_PARM_3+0, a
      0001E6 3E 13                  576 	clear	___memcpy_PARM_3+1
      0001E8 65 31                  577 	goto	___memcpy
                                    578 ;	main.c: 142: break;    
      0001EA 7A 00                  579 	ret
                                    580 ;	main.c: 143: case 4:
      0001EC                        581 00107$:
                                    582 ;	main.c: 144: pixel_buff[2] = bright;
      0001EC 17 2F                  583 	mov	a, #(_pixel_buff + 6)
      0001EE B9 0B                  584 	mov	___memcpy_PARM_1+0, a
      0001F0 3A 13                  585 	clear	___memcpy_PARM_1+1
      0001F2 2D 2F                  586 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      0001F4 BB 0B                  587 	mov	___memcpy_PARM_2+0, a
      0001F6 3C 13                  588 	clear	___memcpy_PARM_2+1
      0001F8 03 2F                  589 	mov	a, #0x03
      0001FA BD 0B                  590 	mov	___memcpy_PARM_3+0, a
      0001FC 3E 13                  591 	clear	___memcpy_PARM_3+1
      0001FE 65 31                  592 	goto	___memcpy
                                    593 ;	main.c: 145: break;   
      000200 7A 00                  594 	ret
                                    595 ;	main.c: 147: case 7:
      000202                        596 00109$:
                                    597 ;	main.c: 148: pixel_buff[3] = bright;
      000202 1A 2F                  598 	mov	a, #(_pixel_buff + 9)
      000204 B9 0B                  599 	mov	___memcpy_PARM_1+0, a
      000206 3A 13                  600 	clear	___memcpy_PARM_1+1
      000208 2D 2F                  601 	mov	a, #(_update_pattern_bright_10000_19 + 0)
      00020A BB 0B                  602 	mov	___memcpy_PARM_2+0, a
      00020C 3C 13                  603 	clear	___memcpy_PARM_2+1
      00020E 03 2F                  604 	mov	a, #0x03
      000210 BD 0B                  605 	mov	___memcpy_PARM_3+0, a
      000212 3E 13                  606 	clear	___memcpy_PARM_3+1
      000214 65 31                  607 	goto	___memcpy
                                    608 ;	main.c: 149: break;                
      000216 7A 00                  609 	ret
                                    610 ;	main.c: 150: case 10:
      000218                        611 00110$:
                                    612 ;	main.c: 151: pattern_step = 0;
      000218 24 13                  613 	clear	_pattern_step+0
                                    614 ;	main.c: 153: } 
                                    615 ;	main.c: 156: }
      00021A 7A 00                  616 	ret
                                    617 ;	main.c: 158: void main(void) {
                                    618 ;	-----------------------------------------
                                    619 ;	 function main
                                    620 ;	-----------------------------------------
      00021C                        621 _main:
                                    622 ;	main.c: 160: __disgint();
      00021C 79 00                  623 	disgint
                                    624 ;	main.c: 161: CLKMD |= 0x10;           //First enable IHRC
      00021E 03 1F                  625 	set1.io	__clkmd, #4
                                    626 ;	main.c: 162: CLKMD = 0x34;           //Switch to IHRC/2 but leave ILRC on
      000220 34 2F                  627 	mov	a, #0x34
      000222 83 01                  628 	mov.io	__clkmd, a
                                    629 ;	main.c: 163: CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
      000224 43 1C                  630 	set0.io	__clkmd, #1
                                    631 ;	main.c: 164: PAC = LED_bm; //Pin 5 as out
      000226 20 2F                  632 	mov	a, #0x20
      000228 91 01                  633 	mov.io	__pac, a
                                    634 ;	main.c: 165: PAPL = BTN_bm; //Pull Pin 4 low internally
      00022A 10 2F                  635 	mov	a, #0x10
      00022C 93 01                  636 	mov.io	__papl, a
                                    637 ;	main.c: 166: PAC &= ~(BTN_bm); //Pin 4 as in
      00022E 11 1D                  638 	set0.io	__pac, #4
                                    639 ;	main.c: 167: PADIER |= BTN_bm; //Enable digital in
      000230 0D 1F                  640 	set1.io	__padier, #4
                                    641 ;	main.c: 170: INTEN = INTEN_TM3;
      000232 80 2F                  642 	mov	a, #0x80
      000234 84 01                  643 	mov.io	__inten, a
                                    644 ;	main.c: 173: TM3B = 10;
      000236 0A 2F                  645 	mov	a, #0x0a
      000238 B5 01                  646 	mov.io	__tm3b, a
                                    647 ;	main.c: 174: TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
      00023A 40 2F                  648 	mov	a, #0x40
      00023C B2 01                  649 	mov.io	__tm3c, a
                                    650 ;	main.c: 175: TM3S = TM3S_PRESCALE_DIV64; //should also start the timer
      00023E 60 2F                  651 	mov	a, #0x60
      000240 B4 01                  652 	mov.io	__tm3s, a
                                    653 ;	main.c: 177: TM2B = 10;
      000242 0A 2F                  654 	mov	a, #0x0a
      000244 9F 01                  655 	mov.io	__tm2b, a
                                    656 ;	main.c: 178: TM2C = TM2C_CLK_DISABLE | TM2C_OUT_PA3 | TM3C_MODE_PERIOD;
      000246 08 2F                  657 	mov	a, #0x08
      000248 9C 01                  658 	mov.io	__tm2c, a
                                    659 ;	main.c: 179: TM2S = TM2S_PRESCALE_DIV16;
      00024A 40 2F                  660 	mov	a, #0x40
      00024C 9E 01                  661 	mov.io	__tm2s, a
                                    662 ;	main.c: 181: __engint();
      00024E 78 00                  663 	engint
                                    664 ;	main.c: 184: start_tone_out_startup();
      000250 66 38                  665 	call	_start_tone_out_startup
                                    666 ;	main.c: 186: while(1) ;
      000252                        667 00102$:
      000252 29 31                  668 	goto	00102$
                                    669 ;	main.c: 187: }
      000254 7A 00                  670 	ret
                                    671 ;	main.c: 189: void interrupt(void) __interrupt(0) {
                                    672 ;	-----------------------------------------
                                    673 ;	 function interrupt
                                    674 ;	-----------------------------------------
      000256                        675 _interrupt:
      000256 72 00                  676 	push	af
      000258 80 0F                  677 	mov	a, p
      00025A 72 00                  678 	push	af
                                    679 ;	main.c: 191: if( INTRQ & INTRQ_TM3 ) //Timer3 interrupt request
      00025C C5 1B                  680 	t1sn.io	__intrq, #7
      00025E 61 31                  681 	goto	00116$
      000260                        682 00160$:
                                    683 ;	main.c: 194: if (PA & BTN_bm) {
      000260 10 1B                  684 	t1sn.io	__pa, #4
      000262 4B 31                  685 	goto	00106$
      000264                        686 00161$:
                                    687 ;	main.c: 196: if (!button_down)
      000264 A1 0F                  688 	mov	a, _button_down+0
      000266 00 2A                  689 	ceqsn	a, #0x00
      000268 4D 31                  690 	goto	00107$
      00026A                        691 00162$:
                                    692 ;	main.c: 198: button_ctr++;
      00026A A0 0F                  693 	mov	a, _button_ctr+0
      00026C 01 28                  694 	add	a, #0x01
      00026E A0 0B                  695 	mov	_button_ctr+0, a
                                    696 ;	main.c: 200: if (button_ctr == BTN_DEBOUNCE_DELAY)
      000270 A0 0F                  697 	mov	a, _button_ctr+0
      000272 05 2A                  698 	ceqsn	a, #0x05
      000274 4D 31                  699 	goto	00107$
      000276                        700 00163$:
                                    701 ;	main.c: 202: button_down = 1;
      000276 01 2F                  702 	mov	a, #0x01
      000278 A1 0B                  703 	mov	_button_down+0, a
                                    704 ;	main.c: 203: pattern_index = (pattern_index + 1) % 3;      
      00027A A3 0F                  705 	mov	a, _pattern_index+0
      00027C 01 28                  706 	add	a, #0x01
      00027E B0 0B                  707 	mov	__modsint_PARM_1+0, a
      000280 00 2F                  708 	mov	a, #0x00
      000282 60 00                  709 	addc	a
      000284 B1 0B                  710 	mov	__modsint_PARM_1+1, a
      000286 03 2F                  711 	mov	a, #0x03
      000288 B2 0B                  712 	mov	__modsint_PARM_2+0, a
      00028A 33 13                  713 	clear	__modsint_PARM_2+1
      00028C 8E 39                  714 	call	__modsint
      00028E A3 0B                  715 	mov	_pattern_index+0, a
                                    716 ;	main.c: 204: pattern_step = 0;     
      000290 24 13                  717 	clear	_pattern_step+0
                                    718 ;	main.c: 205: start_tone_out_button();  
      000292 6C 38                  719 	call	_start_tone_out_button
      000294 4D 31                  720 	goto	00107$
      000296                        721 00106$:
                                    722 ;	main.c: 214: button_ctr = 0;
      000296 20 13                  723 	clear	_button_ctr+0
                                    724 ;	main.c: 215: button_down = 0;
      000298 21 13                  725 	clear	_button_down+0
      00029A                        726 00107$:
                                    727 ;	main.c: 218: pattern_count++;
      00029A A2 0F                  728 	mov	a, _pattern_count+0
      00029C 01 28                  729 	add	a, #0x01
      00029E A2 0B                  730 	mov	_pattern_count+0, a
                                    731 ;	main.c: 220: if (pattern_count == PATTERN_UPDATE_DELAY) 
      0002A0 A2 0F                  732 	mov	a, _pattern_count+0
      0002A2 32 2A                  733 	ceqsn	a, #0x32
      0002A4 56 31                  734 	goto	00109$
      0002A6                        735 00164$:
                                    736 ;	main.c: 222: update_pattern();
      0002A6 8A 38                  737 	call	_update_pattern
                                    738 ;	main.c: 223: output_leds();
      0002A8 77 38                  739 	call	_output_leds
                                    740 ;	main.c: 224: pattern_count = 0;
      0002AA 22 13                  741 	clear	_pattern_count+0
      0002AC                        742 00109$:
                                    743 ;	main.c: 227: if (tone_time) {
      0002AC A6 0F                  744 	mov	a, _tone_time+0
      0002AE 00 2B                  745 	cneqsn	a, #0x00
      0002B0 60 31                  746 	goto	00113$
      0002B2                        747 00165$:
                                    748 ;	main.c: 228: tone_out_ctr++;
      0002B2 A5 0F                  749 	mov	a, _tone_out_ctr+0
      0002B4 01 28                  750 	add	a, #0x01
      0002B6 A5 0B                  751 	mov	_tone_out_ctr+0, a
                                    752 ;	main.c: 230: if (tone_out_ctr >= tone_time) {
      0002B8 A5 0F                  753 	mov	a, _tone_out_ctr+0
      0002BA A6 0C                  754 	sub	a, _tone_time+0
                                    755 ;	main.c: 231: stop_tone_out();
      0002BC 40 1A                  756 	t1sn.io	f, c
      0002BE 72 38                  757 	call	_stop_tone_out
      0002C0                        758 00113$:
                                    759 ;	main.c: 237: INTRQ &= ~INTRQ_TM3; //Clear interrupt flag
      0002C0 C5 1D                  760 	set0.io	__intrq, #7
      0002C2                        761 00116$:
                                    762 ;	main.c: 240: }
      0002C2 73 00                  763 	pop	af
      0002C4 80 0B                  764 	mov	p, a
      0002C6 73 00                  765 	pop	af
      0002C8 7B 00                  766 	reti
                                    767 	.area CODE
                                    768 	.area CONST
                                    769 	.area CABS (ABS)
