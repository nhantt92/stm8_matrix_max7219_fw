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
#include "max7219.h"
#include "stm8s_spi.h"
#include <string.h>
#include "cp437_text.h"
#include "timerTick.h"
#include "stm8s_tim4.h"

void GPIO_setup(void); 
void SPI_setup(void);
void delay(uint16_t x)
{
    while(x--);
}

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIMER_Inc();
  IWDG_ReloadCounter();
}

void IWDG_Config(void)
{
  /* IWDG timeout equal to 500 ms (the timeout may varies due to LSI frequency dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  /* IWDG counter clock: LSI 128KHz/256 */
  IWDG_SetPrescaler(IWDG_Prescaler_256);
  //Set counter reload value to obtain 0.5s IWDG TimeOut.
  //Counter Reload Value = 0.5s/IWDG counter clock period
  //                       = 0.5s*LsiFreq/(256) 
  IWDG_SetReload(250);
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
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
  // const unsigned char smile[]={ 0x72, 0x49, 0x49, 0x49, 0x46, // 50 - '2'
  //  0x21, 0x41, 0x49, 0x4d, 0x33,  // 51 - '3'
  //  0x18, 0x14, 0x12, 0x7f, 0x10,  // 52 - '4'
  // 0x27, 0x45, 0x45, 0x45, 0x39,  // 53 - '5'
  //  0x3c, 0x4a, 0x49, 0x49, 0x31,  // 54 - '6'
  // 0x41, 0x21, 0x11, 0x09, 0x07,  // 55 - '7'
  //  0x36, 0x49, 0x49, 0x49, 0x36,  // 56 - '8'
  // 0x46, 0x49, 0x49, 0x29, 0x1e }; // 57 - '9'};
  CLK_Config();
  // GPIO_setup(); 
  // SPI_setup(); 
  MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
  Init();
  Screen();
  TEXT_Init();
  TIMER_Init();
  IWDG_Config();
  enableInterrupts();
  //TEXT_Manage();
  //setColumn(31, 0x0f);
  //setRow(7,0xff);
  //setDot(0,0,1);
  //DrawEx(0, smile);
  //Screen();
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
        TEXT_Manage();
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
