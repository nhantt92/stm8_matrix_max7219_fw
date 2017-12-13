#include "stm8s.h"
#include "stm8s_gpio.h"

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
	GPIO_TypeDef* port;
	uint8_t data;
	uint8_t cs;
	uint8_t clk;
	uint8_t maxLed;
	uint8_t buffer[80]; // 10 led 80 byte
}MaxMatrix_Struct;

void MaxMatrix(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed);
void Init(void);
void Clear(void);
void Screen(void);
void setCommand(uint8_t command, uint8_t value);
void setIntensity(uint8_t intensity);
void setDot(uint8_t col, uint8_t row, uint8_t value);
void setColumn(uint8_t col, uint8_t value);
void setRow(uint8_t row, uint8_t value);
// void Max7219_Write(unsigned char addr, unsigned char value);  //SPI
void writeSprite(uint8_t x, uint8_t y, const uint8_t* sprite);
void shiftLeft(bool rotate, bool fill_zero);
void shiftRight(bool rotate, bool fill_zero);
void shiftUp(bool rotate);
void shiftDown(bool rotate);
void DrawEx(uint8_t scrollCnt, uint8_t *data);
