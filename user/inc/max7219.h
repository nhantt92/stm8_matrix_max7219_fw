#include "stm8s.h"

#define CS_pin GPIO_PIN_4
#define CS_port GPIOC

#define NOP 0x00
#define DIG0 0x01
#define DIG1 0x02
#define DIG2 0x03
#define DIG3 0x04
#define DIG4 0x05
#define DIG5 0x06
#define DIG6 0x07
#define DIG7 0x08
#define DECODEMODE 0x09
#define INTENSITY 0x0A
#define SCANLIMIT 0x0B
#define SHUTDOWN 0x0C
#define DISPLAYTEST 0x0F

typedef struct 
{
	uint16_t col;
	uint8_t row;
	uint8_t maxLed;
	uint8_t buf[8]; // 1 led 2 byte; 4 led 8 byte
	uint8_t dat[32]; // 1 led 8 col, 4 led 32 col
}MAX7219_STRUCT;

void Max7219_Init(void);
void Max7219_Write(unsigned char addr, unsigned char value);
