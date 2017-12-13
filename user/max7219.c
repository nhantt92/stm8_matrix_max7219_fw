#include "max7219.h"
#include "stm8s_spi.h"
#include <string.h>

MaxMatrix_Struct matrix;

static void delay_ms(uint8_t x)
{
	while(x--);
}

void MaxMatrix(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed)
{
	matrix.port = port;
	matrix.data = data;
	matrix.cs = cs;
	matrix.clk = clk;
	matrix.maxLed =  numLed;
	memset(matrix.buffer, 0x00, sizeof(matrix.buffer));
}

static void Max7219_Write_Byte(uint8_t dat)
{
	uint8_t cnt;
	uint8_t dsent;
	dsent = dat;
	for(cnt=0; cnt<8; cnt++)
	{
		GPIO_WriteLow(matrix.port, matrix.clk);
		if(dsent&0x80)
			GPIO_WriteHigh(matrix.port, matrix.data);
		else
			GPIO_WriteLow(matrix.port, matrix.data);
		GPIO_WriteHigh(matrix.port, matrix.clk);
		dsent <<= 1;
	}
}

void setCommand(uint8_t command, uint8_t value)
{
	uint8_t i;
	GPIO_WriteLow(matrix.port, matrix.cs);
	for(i = 0; i < matrix.maxLed; i++)
	{
		Max7219_Write_Byte(command);
		Max7219_Write_Byte(value);
	}
	GPIO_WriteLow(matrix.port, matrix.cs);
	GPIO_WriteHigh(matrix.port, matrix.cs);
}

void Init(void)
{
	GPIO_Init(matrix.port, matrix.data|matrix.cs|matrix.clk, GPIO_MODE_OUT_PP_HIGH_FAST);
	setCommand(SCANLIMIT, 0x07); //scanf 8digit
	setCommand(DECODEMODE, 0x00); //use led matrix, not decode digit
	setCommand(SHUTDOWN, 0x01); // normal operator
	setCommand(DISPLAYTEST, 0x00); //no display test
	Clear();
	setCommand(INTENSITY, 0x04); // brightness 9/32
}

void setIntensity(uint8_t intensity)
{
	setCommand(INTENSITY, intensity);
}

void Clear(void)
{
	memset(matrix.buffer, 0x00, sizeof(matrix.buffer));
}

void Screen(void)
{
	uint8_t i, j, col;
	for(i = 0; i < 8; i++)
	{	
		col = i;
		GPIO_WriteLow(matrix.port, matrix.cs);
		for(j = 0; j < matrix.maxLed; j++)
		{
			Max7219_Write_Byte(i+1);
			Max7219_Write_Byte(matrix.buffer[col]);
			col += 8;
		}
		GPIO_WriteLow(matrix.port, matrix.cs);
		GPIO_WriteHigh(matrix.port, matrix.cs);
	}
}

void setDot(uint8_t col, uint8_t row, uint8_t value)
{
	uint8_t offset, val;
	uint8_t n = (matrix.maxLed - 1) - (col / 8);
	offset = (n*8 + row);
	val = 0x01 << (col%8);
	if(row < 0 || row > 7 || col < 0 || col > matrix.maxLed*8) return;
	if(value)
		matrix.buffer[offset] |= val;
	else
		matrix.buffer[offset] &= ~val;
}

void setColumn(uint8_t col, uint8_t value)
{	
	uint8_t val, row;
	if(col < 0 || col > matrix.maxLed*8) return;
	for(row = 0; row < 8; row++)
	{
		val = value >> (7-row);
		setDot(col, row, val);
	}
}

void setRow(uint8_t row, uint8_t value)
{
	uint8_t offset, i;
	if(row < 0 || row > 7) return;
	for(i = 0; i < matrix.maxLed; i++)
	{
		offset = (i*8)+row;
		matrix.buffer[offset] = value;
	}
}


void DrawEx(uint8_t scrollCnt, uint16_t *data)
{
	uint16_t mask;
	uint16_t dataGet;
	uint8_t cntR;
	uint8_t cntC;
	Clear();
	for(cntC = 0; cntC < matrix.maxLed*8; cntC++)
	{
		dataGet = data[cntC+scrollCnt];
		mask = 0x0001;
		for(cntR = 0; cntR<8; cntR++)
		{
			if(dataGet&mask)
				setDot(cntC, 8 - cntR -1, 1);
			else
				setDot(cntC, 8 - cntR -1, 0);
			mask <<=1;
		}
	}
}

/* SPI
// void Max7219_Init(uint8_t numled)
// {
// 	uint8_t i;
// 	GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);
//	}
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
*/

