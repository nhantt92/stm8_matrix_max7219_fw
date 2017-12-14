#ifndef __CP437_TEXT_H
#define __CP437_TEXT_H

#include "stm8s.h"
#include "max7219.h"
#include <String.h>
#include "timerTick.h"

#define TEXT_ALIGN_LEFT          0 // Text is aligned to left side of the display
#define TEXT_ALIGN_LEFT_END      1 // Beginning of text is just outside the right end of the display
#define TEXT_ALIGN_RIGHT         2 // End of text is aligned to the right of the display
#define TEXT_ALIGN_RIGHT_END     3 // End of text is just outside the left side of the display

typedef struct TEXT_Struct
{	
	// uint8_t charWidth = 7;
	// uint8_t textAlignment = 0;
	// int8_t textAlignmentOffset = 0;
	uint8_t scrollCnt;
  	TIME tick;
  	uint16_t dataLen;
  	uint8_t data[200];
  	uint8_t change;
}TEXT;

void TEXT_Init(void);
uint16_t TEXT_GetStringLen(uint8_t *str);
void TEXT_GetStringToBuff(uint8_t *str);
void TEXT_Manage(void);


void setCharWidth(uint8_t setCharWidth);
void setTextAlignment(uint8_t setTextAlignment);
void calculateTextAlignmentOffset(void);
// void setText(String text);
// void drawText(String text);
/*Scroll the text to the right*/
void scrollTextRight(void);
/*Scroll the text to the left*/
void scrollTextLeft(void);
/* Oscilate the text between the two limits.*/
void oscillateText();

#endif