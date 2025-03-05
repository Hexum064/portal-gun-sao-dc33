#include <stdint.h>
#include <stdio.h>
#include "easypdk/pdk.h" 

#include "easypdk/pfc161.h"


#define LED_bm 0x20
#define BTN_bm 0x10
#define BTN_DEBOUNCE_DELAY 5
#define PATTERN_UPDATE_DELAY 50
#define LED_COUNT 4
#define STARTUP_TONE_TIME 10
#define BUTTON_TONE_TIME 5
#define STARTUP_BOUNDS 10
#define BUTTON_BOUNDS 5

typedef struct {
    uint8_t g;
    uint8_t r;    
    uint8_t b;
} color_t;


color_t orange_color = {.r=64, .g=16, .b=0};
color_t blue_color = {.r=0, .g=0, .b=128};
color_t bright_orange_color = {.r=80, .g=32, .b=16};
color_t bright_blue_color = {.r=16, .g=16, .b=128};
color_t off_color = {.r=0, .g=0, .b=0};

volatile color_t pixel_buff[LED_COUNT];


volatile uint8_t bytes = LED_COUNT * 3;
volatile uint8_t byte_t = 0;    
 
volatile uint8_t byte_ctr = 0;
volatile uint8_t button_ctr = 0;
volatile uint8_t button_down = 0;
volatile uint8_t pattern_count = 0;
volatile uint8_t pattern_index = 0;
volatile uint8_t pattern_step = 0;
volatile uint8_t tone_out_ctr = 0;
volatile uint8_t tone_time = 0;


void copy_to_buff(color_t pixel, uint8_t len) {
    for (uint8_t i = 0; i < len ; i++) {
        pixel_buff[i].r = pixel.r;
        pixel_buff[i].g = pixel.g;
        pixel_buff[i].b = pixel.b;
    }
}

void start_tone_out_startup() {
    tone_out_ctr = 0;
    tone_time = STARTUP_TONE_TIME;
    TM2B = STARTUP_BOUNDS;
    TM2C |= TM2C_CLK_IHRC;
}

void start_tone_out_button() {
    tone_out_ctr = 0;
    tone_time = BUTTON_TONE_TIME;
    TM2B = BUTTON_BOUNDS;
    TM2C |= TM2C_CLK_IHRC;
}

void stop_tone_out() {
    tone_time = 0;
    TM2C &= 0x0F; //0 out the top 4 bits for clock source
}

void output_leds() 
{
    __asm

        mov a, _bytes           ;move our byte count into a
        mov _byte_ctr, a        ;move a into our index counter

        mov	a, #(_pixel_buff)   ;load the address of the array into a
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

    color_t bright;

    switch (pattern_index)
    {
        case 0:            
            copy_to_buff(off_color, LED_COUNT);            
            return;         
        case 1:
            copy_to_buff(blue_color, LED_COUNT);
            bright = bright_blue_color;
            break;            
        case 2:
            copy_to_buff(orange_color, LED_COUNT);
            bright = bright_orange_color;
            break;
    }

    pattern_step++;

    switch (pattern_step)
    {
        case 1:
            pixel_buff[0] = bright;
            break;
        case 3:
            pixel_buff[1] = bright;
            break;    
        case 4:
            pixel_buff[2] = bright;
            break;   
        case 6:
        case 7:
            pixel_buff[3] = bright;
            break;                
        case 10:
            pattern_step = 0;
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
    INTEN = INTEN_TM3;
    
    //Timer 3 using ILRC (64kHz) with a prescaler of 64 and a bound of 10 should give a 10ms period
    TM3B = 10;
    TM3C = TM3C_CLK_ILRC | TM3C_OUT_DISABLE | TM3C_MODE_PERIOD;
    TM3S = TM3S_PRESCALE_DIV64; //should also start the timer

    TM2B = 10;
    TM2C = TM2C_CLK_DISABLE | TM2C_OUT_PA3 | TM3C_MODE_PERIOD;
    TM2S = TM2S_PRESCALE_DIV16;

    __engint();

    
    start_tone_out_startup();

    while(1) ;
}

void interrupt(void) __interrupt(0) {

    if( INTRQ & INTRQ_TM3 ) //Timer3 interrupt request
    {

        if (PA & BTN_bm) {
            
            if (!button_down)
            {
                button_ctr++;

                if (button_ctr == BTN_DEBOUNCE_DELAY)
                {
                    button_down = 1;
                    pattern_index = (pattern_index + 1) % 3;      
                    pattern_step = 0;     
                    start_tone_out_button();  
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

        if (tone_time) {
            tone_out_ctr++;

            if (tone_out_ctr >= tone_time) {
                stop_tone_out();
            }
        }



        INTRQ &= ~INTRQ_TM3; //Clear interrupt flag
    }   

}
