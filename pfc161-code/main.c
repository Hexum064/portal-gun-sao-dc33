#include <stdint.h>
#include <stdio.h>
#include "easypdk/pdk.h" 

#include "easypdk/pfc161.h"

// LED is placed on the PA4 pin (Port A, Bit 4) with a current sink configuration
#define LED_bm 0x20
#define BTN_bm 0x10
#define BTN_DEBOUNCE_DELAY 5
#define PATTERN_UPDATE_DELAY 50
// LED is active low (current sink), so define helpers for better readability below


//logic is switched because we are sinking the current (pin low turns leds on)
// #define LED_ON(p) (PA &= ~(LED_SHIFT(p)))
// #define LED_OFF(p) (PA |= (LED_SHIFT(p)))


// extern void test_func();
// #pragma preproc_asm -





volatile uint8_t r = 31;
volatile uint8_t g = 0;
volatile uint8_t b = 31;


// volatile uint8_t temp_r = 0;
// volatile uint8_t temp_g = 0;
// volatile uint8_t temp_b = 0;


//for now, 4 pixels as 3 bytes each

volatile uint8_t blue_pixels[] = {
    0,0,128,0,0,128,0,0,128,0,0,128
};

volatile uint8_t orange_pixels[] = {
    16,64,0,16,64,0,16,64,0,16,64,0
};

volatile uint8_t off_pixels[] = {
    0,0,0,0,0,0,0,0,0,0,0,0
};

volatile uint8_t bytes = 12;
volatile uint8_t byte_t = 0;    
volatile uint8_t * pixel_ptr = 0;  
volatile uint8_t byte_ctr = 0;
volatile uint8_t button_ctr = 0;
volatile uint8_t button_down = 0;
volatile uint8_t pattern_count = 0;
volatile uint8_t pattern_index = 0;
volatile uint8_t cnt = 0;
static     uint8_t tmp = 0;


void output_leds() 
{
    __asm

        mov a, _bytes           ;move our byte count into a
        mov _byte_ctr, a        ;move a into our index counter

        mov	a, _pixel_ptr       ;load the address of the array into a
        mov	p, a                ;put that address into p (a mem location)


00010$:


	
        idxm	a, p            ;load the byte data from the array into a
        inc p                   ;inc p to the next address

        
        mov	_byte_t+0, a        ;load the byte data into byte_t
        mov a, #0x08            ;reset the bit count
00011$:
        ;output bit
        set1.io __pa, #5        ;set the output pin high
        t1sn _byte_t, #7        ;if the current MSB is 1, skip setting the pin low now
        set0.io __pa, #5        ;set the output pin low
        nop                     ;wait one cycle
        set0.io __pa, #5        ;set the output pin low
        sl _byte_t              ;left-shift the data byte (the LEDs are MSB first)

        dzsn a                  ;dec a and skip next instruction if 0
        goto 00011$             ;jump back to 00011        
        

        dzsn _byte_ctr          ;dec our index counter and skip the goto if 0
        goto	00010$          ;goto the next byte
    __endasm;
}

void update_pattern() 
{
    //TODO: Move a bright led through the pattern for orange and blue
    switch (pattern_index)
    {
        case 0:
            pixel_ptr = off_pixels;
            break;            
        case 1:
            pixel_ptr = blue_pixels;
            break;            
        case 2:
            pixel_ptr = orange_pixels;
            break;
    }

}

void main(void) {
 
    __disgint();
    CLKMD |= 0x10;           //First enable IHRC
    CLKMD = 0x34;           //Switch to IHRC/2 but leave ILRC on
    CLKMD &= ~(CLKMD_ENABLE_WATCHDOG);
    PAC = LED_bm; //Pin 5 as out
    PAPL = BTN_bm; //Pull Pin 4 low internally
    PAC &= ~(BTN_bm); //Pin 4 as in
    PADIER |= BTN_bm; //Enable digital in

    //Enable the interrupt for TM2
    INTEN = INTEN_TM2;
    
    //Timer 2 using ILRC (64kHz) with a prescaler of 64 and a bound of 10 should give a 10ms period
    TM2B = 10;
    TM2C = TM2C_CLK_ILRC | TM2C_OUT_DISABLE | TM2C_MODE_PERIOD;
    TM2S = TM2S_PRESCALE_DIV64; //should also start the timer
    __engint();





    while(1);
}

void interrupt(void) __interrupt(0) {

    if( INTRQ & INTRQ_TM2 ) //Timer2 interrupt request?
    {

        if (PA & BTN_bm) {
            
            if (!button_down)
            {
                button_ctr++;

                if (button_ctr == BTN_DEBOUNCE_DELAY)
                {
                    button_down = 1;
                    pattern_index = (pattern_index + 1) % 3;             
                }

            }


        }
        else 
        {
            button_ctr = 0;
            button_down = 0;
        }

        pattern_count++;

        if (pattern_count == PATTERN_UPDATE_DELAY) 
        {
            update_pattern();
            output_leds();
            pattern_count = 0;
        }



        // cnt++;

        // if (cnt == 50) 
        // {
        //     if (tmp) {
        //         pixel_ptr = orange_pixels;
        //         tmp = 0;
        //     }
        //     else {
        //         pixel_ptr = blue_pixels;
        //         tmp = 1;
        //     }
    
        //     output_leds();
        //     cnt = 0;
        // }

        
        INTRQ &= ~INTRQ_TM2; //Clear interrupt flag
    }   

}


        // mov a, _bytes               ;move the total number of bytes into a
        // mov _byte_ctr, a            ;move a into the byte counter       
        
        // mov a, _pixel_data          ;move address of pixel_data into a
        // mov _pixel_ptr, a           ;move a into pixel_ptr

/*

        mov a, _g
        mov _temp_g, a
        mov a, _r
        mov _temp_r, a
        mov a, _b
        mov _temp_b, a
        mov a, #0x08               ;reset the bit count

00011$:
        ;output bit
        set1.io __pa, #4
        t1sn _temp_g, #7
        set0.io __pa, #4
        nop
        set0.io __pa, #4
        sl _temp_g              ;left-shift _temp

        dzsn a                  ;dec a and skip next instruction if 0
        goto 00011$             ;jump back to 00011

        mov a, #0x08               ;reset the bit count

00012$:
        ;output bit
        set1.io __pa, #4
        t1sn _temp_r, #7
        set0.io __pa, #4
        nop
        set0.io __pa, #4
        sl _temp_r              ;left-shift _temp

        dzsn a                  ;dec a and skip next instruction if 0
        goto 00012$             ;jump back to 00012

        mov a, #0x08               ;reset the bit count

00013$:
        ;output bit
        set1.io __pa, #4
        t1sn _temp_b, #7
        set0.io __pa, #4
        nop
        set0.io __pa, #4
        sl _temp_b              ;left-shift _temp

        dzsn a                  ;dec a and skip next instruction if 0
        goto 00013$             ;jump back to 00013


*/

// ;green 64
//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop        

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop      


//     ;red 0
//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop



                  

//  ;blue 64
//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 
//         nop
//         nop        

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop

//         set1.io __pa, #4
//         nop
//         nop
//         nop
//         set0.io __pa, #4
//         nop
//         nop
//         nop 