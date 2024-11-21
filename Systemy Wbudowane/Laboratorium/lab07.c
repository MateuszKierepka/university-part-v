#define F_CPU 8000000UL // ustawienie częstotliwości zegara 8MHz
#define BAUDRATE 9600 // określenie prędkości przesyłania
#define BAUD_PRESCALLER (((F_CPU / (BAUDRATE * 16UL))) - 1) // wyznaczenie zawartości rejestru UBRR

#include <avr/io.h>

void USART_Init(void) {
    // Ustawienie baud rate
    UBRRH = (uint8_t)(BAUD_PRESCALLER>>8);
    UBRRL = (uint8_t)(BAUD_PRESCALLER);
    
    // Włączenie nadajnika
    UCSRB = (1<<TXEN);
    
    // Ustawienie formatu ramki: 8 bitów danych, brak kontroli parzystości, 1 bit stopu
    UCSRC = (1<<URSEL) | (1<<UCSZ1) | (1<<UCSZ0);
}

void USART_putchar(unsigned char data) {
    // Czekaj aż bufor nadawczy będzie pusty
    while (!(UCSRA & (1<<UDRE)));
    
    // Wyślij dane
    UDR = data;
}

void USART_putstring(char* str) {
    // Wyślij kolejne znaki ciągu, aż do napotkania końca stringa
    while (*str != '\0') {
        USART_putchar(*str);
        str++;
    }
}

int main(void) {
    // Inicjalizacja USART
    USART_Init();
    
    USART_putstring("Mateusz Kierepka");
    
    while(1); // Zatrzymaj program
    
    return 0;
}