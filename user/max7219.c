#include "max7219.h"
#include "stm8s_spi.h"

static void delay_ms(uint8_t x)
{
	while(x--);
}

void Max7219_Init(void)
{
	GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	Max7219_Write(SHUTDOWN, 0x01); // Normal operation
	Max7219_Write(DECODEMODE, 0x00); // No decode
	Max7219_Write(SCANLIMIT, 0x07); // scan 8 row
	Max7219_Write(INTENSITY, 0x04); // brightness 9/32
	Max7219_Write(DISPLAYTEST, 0x00);
	delay_ms(100);
}
void Max7219_Write(unsigned char addr, unsigned char value)
{
	while(SPI_GetFlagStatus(SPI_FLAG_BSY));
	GPIO_WriteLow(CS_port, CS_pin);
	SPI_SendData(addr);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	SPI_SendData(value);
	while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
	GPIO_WriteHigh(CS_port, CS_pin);
}
