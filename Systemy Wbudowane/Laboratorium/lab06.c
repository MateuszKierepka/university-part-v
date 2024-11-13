#include <avr/io.>
#include <util/delay.h>
#include <avr.interrupt.h>

#define LCD_PORT PORTA
#define LCD_DDR DDRA
#define RS PA0
#define EN PA1
#define F_CPU 1000000UL

volatile uint8_t aktualna_poz_x = 0;
volatile uint8_t aktualna_poz_y = 0;

const uint8_t custom_char0[] = {
    0b00000,
    0b01110,
    0b10001,
    0b10001,
    0b10001,
    0b01110,
    0b00000,
    0b00000
};

const uint8_t custom_char1[] = {
    0b00000,
    0b01110,
    0b11111,
    0b11111,
    0b11111,
    0b01110,
    0b00000,
    0b00000
};

const uint8_t custom_char2[] = {
    0b00000,
    0b11111,
    0b11111,
    0b11111,
    0b11111,
    0b11111,
    0b00000,
    0b00000
};

void LCD_Command(unsigned char komenda){ // wysylanie instrukcji do sterownika wyswietlacza LCD
    LCD_PORT = komenda & (0xF0); // w interfejsie 4-bitowym sterownika LCD, do transmisji wykorzystujemy tylko górną połowę bajtu (bity 7-4), ignorując dolną połowę (bity 3-0)
    LCD_PORT &= ~(1 << RS); //  następny bajt będzie traktowany jako komenda, a nie dane
    LCD_PORT |= (1 << EN); // uaktywnienie transmisji
    _delay_ms(1);
    LCD_PORT &= ~(1 << EN);

    _delay_ms(5);

    LCD_PORT = komenda << 4; // powtarza czynnosci co wczesniej, przesuwajac bajt komenda o 4 bity w lewo
    LCD_PORT &= ~(1 << RS);
    LCD_PORT |= (1 << EN);
    _delay_ms(1);
    LCD_PORT &= ~(1 << EN);
    _delay_ms(5);
}

void LCD_Char(unsigned char znak){ // wysylanie pojedynczego znaku na wyswietlacz LCD
    LCD_PORT = znak & (0xF0);
    LCD_PORT |= (1 << RS);
    LCD_PORT |= (1 << EN);
    _delay_ms(1);
    LCD_PORT &= ~(1 << EN);

    _delay_ms(5);

    LCD_PORT = znak << 4;
    LCD_PORT |= (1 << RS);
    LCD_PORT |= (1 << EN);
    _delay_ms(1);
    LCD_PORT &= ~(1 << EN);
    _delay_ms(5);

    aktualna_poz_x++;
}

void LCD_Init(void){ // inicjalizacja wyswietlacza LCD
    LCD_DDR = 0xff;
    _delay_ms(20);

    LCD_Command(0x33); // inicjalizacja wyswietlacza w trybie 8-bitowym
    _delay_ms(5);
    LCD_Command(0x32); // przelaczenie wyswietlacza w tryb 4-bitowy
    _delay_ms(5);
    LCD_Command(0x28); // konfiguracja wyswietlacza: interfejs 4-bitowy, wyswietlanie w 2 liniach, czcionka 5x7 pikseli
    _delay_ms(5);
    
    // inaczej niz hubert
    LCD_Command(0x0C); // wlaczenie wyswietlacza
    _delay_ms(5);
    LCD_Command(0x01); // wyczyszczenie wyswietlacza
    _delay_ms(5);
    LCD_Command(0x06); // ustawienie trybu zapisu
    _delay_ms(5);

    // hubert
    // LCD_Command(0x0E);
	// _delay_ms(5);
	// LCD_Clear();
	// _delay_ms(5);
	// LCD_Command(0x06);
	// _delay_ms(5);
}

void LCD_String(char *str){ // wyswietlenie ciagu znakow na wyswietlaczu LCD
    while(*str){
        LCD_Char(*str++); // wysylanie kolejnych znakow
    }
}

// hubert 
// void LCD_String(char *str) {
// 	for(int i=0; *str!='\0'; i++) {
// 		LCD_Char(*str);
// 		str++;
// 	}
// }

void LCD_Clear{ // wyczyszczenie calego wyswietlacza LCD
    LCD_Command(0x01);
    _delay_ms(5);
    aktualna_poz_x = 0;
    aktualna_poz_y = 0;
}

void set_kursor_LCD(uint8_t x, uint8_t y){
    uint8_t address;

    // inaczej niz hubert
    if(y == 1){
        address = 0x80 + x - 1; 
    } else if( y == 2){
        address = 0xC0 + x - 1;
    }
    // 0x80 i 0xC0 sa stalymi offsetami ktore wskazuja poczatek pierwszego i drugiego wiersza
    LCD_Command(address);
    aktualna_poz_x = x - 1;
    aktualna_poz_y = y;
}

// hubert 
// void kursor_LCD(uint8_t x, uint8_t y) {
// 	uint8_t address;
// 	if (y == 1) {
// 		address = 0x00 + x;
// 	} else if (y == 2) {
// 		address = 0x40 + x;
// 	}
// 	LCD_Command(0x80 | address);
// 	curr_x_pos = x;
// 	curr_y_pos = y;
// }

void LCDclear_y(uint8_t y){
    uint8_t temp_x = aktualna_poz_x;
    uint8_t temp_y = aktualna_poz_y;
    set_kursor_LCD(y, aktualna_poz_y);
    for(uint8_t i=y-1; i < 16; i++){
        LCD_Char(' ');
    }
    set_kursor_LCD(temp_x+1, temp_y);
}

void create_custom_chars(void){
    LCD_Command(0x40);
    
    for(uint8_t i=0; i<8; i++){
        LCD_Char(custom_char0[i]);
    }

    for(uint8_t i=0; i<8; i++){
        LCD_Char(custom_char1[i]);
    }

    for(uint8_t i=0; i<8; i++){
        LCD_Char(custom_char2[i]);
    }
}

uint8_t scan_keypad(void){ // jesli zostanie wykryty wcisniety klawisz, oblicza jego numer i go zwraca
    uint8_t row, col, keycode = 0;

    DDRB = 0xF0;
    PORTB = 0x0F;

    for(row=0; row<4; row++){
        PORTB = ~(0x10 << row);
        _delay_ms(1);

        col = PINB & 0x0F;
        if(col != 0x0F){
            for(uint8_t i =0; i<4; i++){
                if(!(col & (1 << i))){
                    keycode = row * 4 + i + 1;
                    break;
                }
            }
            break;
        }
    }
    return keycode;
}

int main(void){
    uint8_t key, animation_state = 0;
    uint32_t animation_timer = 0;

    LCD_Init();
    create_custom_chars();

    set_kursor_LCD(1, 1);
    LCD_String("Kierepka M");
    set_kursor_LCD(1, 2);
    LCD_String("Przycisk nr: ")
    while(1){
        key = scan_keypad();
        if(key){
            set_kursor_LCD(13, 2);
            if(key < 10){
                LCD_Char('0');
                LCD_Char(key + '0');
            } else{
                LCD_Char((key / 10) + '0');
                LCD_Char((key % 10) + '0');
            }
            _delay_ms(200);
        }
        if(animation_timer++ >= 400){
            animation_timer = 0;
            set_kursor_LCD(16, 1);
            LCD_Char(animation_state);
            animation_state = (animation_state + 1) % 3;
        }
        _delay_ms(1);
    }
    return 0;
}