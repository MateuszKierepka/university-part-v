#define F_CPU 8000000UL // ustawienie częstotliwości zegara 8MHz
#define BAUDRATE 9600   // prędkość transmisji
#define BAUD_PRESCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1)

#include <avr/io.h>
#include <avr/interrupt.h>

void USART_Init(void) {
    UBRRH = (uint8_t)(BAUD_PRESCALLER >> 8);
    UBRRL = (uint8_t)(BAUD_PRESCALLER);

    UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE);
    
    UCSRC = (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0);
}

void USART_putchar(unsigned char data) {
    while (!(UCSRA & (1 << UDRE)));
    UDR = data;
}

void USART_putstring(char* str) {
    while (*str != '\0') {
        USART_putchar(*str);
        str++;
    }
}

void Timer0_Init(void) {
    TCCR0 = (1 << WGM01) | (1 << CS02) | (1 << CS00);
    OCR0 = 156; // Około 1 Hz przy 8 MHz
    TIMSK = (1 << OCIE0);
}

ISR(TIMER0_COMP_vect) {
    PORTA ^= (1 << PA0); // Przełącz stan LED_0
}

ISR(USART_RXC_vect) {
    char received_char = UDR;

    USART_putchar(received_char);
    
    if (received_char >= '1' && received_char <= '7') {
        uint8_t led = (1 << (received_char - '1' + 1));
        PORTA ^= led;
    } else if (received_char == 'c') {
        PORTA &= ~0xFE;
    } else if (received_char == 's') {
        PORTA |= 0xFE;
    } else {
        USART_putstring("Blad: nieznany znak\r\n");
    }
}

int main(void) {
    DDRA = 0xFF;
    PORTA = 0x00;

    USART_Init();
    Timer0_Init();

    sei();

    while (1) {}

    return 0;
}