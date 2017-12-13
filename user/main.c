/**
*******************************************
* @file     main.c
* @author   nhantt
* @version  V1.0.0
* @date     25-March-2017
* @brief    This file brief for save memory used build with SDCC
*********************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_gpio.h"
#include "stm8s_clk.h"
#include "stm8s_conf.h"
#include "sw_uart.h"
#include "max7219.h"
#include "stm8s_spi.h"
#include <string.h>

extern MaxMatrix_Struct matrix;
uint8_t scrollDelay = 75;
uint8_t buffertext[14] = {0};

void GPIO_setup(void); 
void SPI_setup(void);
void delay(uint16_t x)
{
    while(x--);
}

void printBuffer()
{
  uint8_t cnt, y;
  uint8_t x;
  for(cnt = 0; cnt<7; cnt++)
  {
    x = buffertext[cnt*2+1];
    y = x;
    setRow(3, cnt, y);
    x = buffertext[cnt*2];
    y = (x>>24);
    setRow(2, cnt, y);
    y = (x>>16);
    setRow(1, cnt, y);
    y = (x>>8);
    setRow(0, cnt, y);
  }
}

void main() 
{
  uint8_t i;
  const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    0x00, 0x7E, 0x04, 0x08, 0x08, 0x04, 0x7E, 0x00, //M 
                                    0x00, 0x42, 0x42, 0x7E, 0x7E, 0x42, 0x42, 0x00, //I 
                                    0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x24, 0x00, //C 
                                    0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00, //R 
                                    0x00, 0x3C, 0x42, 0x42, 0x42, 0x42, 0x3C, 0x00, //O 
                                    0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00, //A 
                                    0x00, 0x7E, 0x1A, 0x1A, 0x1A, 0x2A, 0x44, 0x00, //R 
                                    0x00, 0x7E, 0x7E, 0x4A, 0x4A, 0x4A, 0x42, 0x00, //E 
                                    0x00, 0x7E, 0x04, 0x08, 0x10, 0x20, 0x7E, 0x00, //N 
                                    0x00, 0x7C, 0x12, 0x12, 0x12, 0x12, 0x7C, 0x00, //A 
                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}; 
  //char smile[] = {0x3C, 0x43, 0x95, 0xA1, 0xA1, 0x95, 0x43, 0x3C};
  char smile[]={0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
  CLK_Config();
  // GPIO_setup(); 
  // SPI_setup(); 
  MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
  Init();
  Screen();
  //setColumn(31, 0x0f);
  //setRow(7,0xff);
  //setDot(6,0,1);
  //DrawEx(1, smile);
  Screen();
  //Screen();
  // memset(matrix.buffer, 0x01, sizeof(matrix.buffer));
  // for(i=0; i < 8; i++)
  // {
  //   col = i;
  //   for(j = 0; j < matrix.maxLed; j++)
  //   {
  //       Max7219_Write(i+1, matrix.buffer[col]);
  //       col +=8;
  //   }
  // }
    
  // }
  // for(i=0; i < sizeof(temp); i++)
  // {
  //   temp[i]=smile[i];
  // }
  // for(i=0;i<sizeof(smile);i++)
  // {
  //   Max7219_Write(i+1, temp[i]);
  // }
  //setColumn(0, 0xff);
  //setDot(7,7,1);
  while(TRUE) 
  {
    // for(i = 0; i < sizeof(temp); i++) 
    // {
    //   temp[i] = 0x00;
    // }
    // for(i = 0; i < sizeof(text); i++) 
    // {
    //   for(j = 0; j < sizeof(temp); j++) 
    //   {
    //     temp[j] = text[(i+j)];
    //     Max7219_Write((1+j), temp[j]);
    //     delay(50000);
    //   }
    // } 
  }
}

// void GPIO_setup(void) 
// {
//   GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)GPIO_PIN_5 | GPIO_PIN_6), GPIO_MODE_OUT_PP_HIGH_FAST);
// }
// void SPI_setup(void) 
// {
//   SPI_DeInit(); SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT ,0x00); 
//   SPI_Cmd(ENABLE);
// }
