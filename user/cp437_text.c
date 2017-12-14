#include "cp437_text.h"
#include "max7219.h"
#include "cp437font.h"
#include <String.h>
#include "timerTick.h"
TEXT text;

void TEXT_Init(void)
{
	text.scrollCnt = 0;
  	text.change = 0;
  	memset((uint8_t*)text.data, 0, sizeof(text.data));
  	TIMER_InitTime(&text.tick);
}

uint16_t TEXT_GetStringLen(uint8_t *str)
{
  uint16_t charLen = 0;
  uint16_t charCnt = 0;
  while(str[charLen])
  {
    if(str[charLen] <= 0x7F)
      charLen++;
    else
    {
      charLen+=2;
    }
    charCnt++;
  }
  return charCnt;
}



void TEXT_GetStringToBuff(uint8_t *str)
{
	uint16_t charLen = 0;
  	uint8_t charW = 8;
  	uint16_t offSet;
  	uint8_t add;
  	uint16_t textInc;
  	uint8_t buff[8];
  	text.dataLen = matrix.maxLed*8;
  	while(str[charLen])
  	{
  		if(str[charLen] <= 32)
      		//offSet = (str[charLen] - 0x20) + 0;
      		//add = 1;
      		textInc = 32;
    	else if(str[charLen] > 128)
    	{
    		textInc = 128;
    	}
    	else
    		textInc = str[charLen];
      	for(charW=0;charW<8;charW++)
    	{
    		buff[charW] = cp437_font[textInc*8+charW];
		}
		for (add = 0; add < 8; add++)
		{
			text.data[offSet+add] = buff[add];
		}
		charLen++;
		offSet +=8;
	}
}

void TEXT_Manage(void)
{
	uint8_t buff[8] = "nhantt92";
	TEXT_GetStringToBuff(buff);
	// uint8_t add;
	// for(add=0;add<32;add++)
 //    {
 //    	text.data[add] = cp437_font[65*8+add];
	// }
	if(TIMER_CheckTimeMS(&text.tick, 800) == 0)
	{
		DrawEx(text.scrollCnt, text.data);
		Screen();
	}
	if(++text.scrollCnt >= 50)
    {
    	text.scrollCnt = 0;
    }
}


// void setCharWidth(uint8_t setCharWidth)
// {
// 	text.charWidth = setCharWidth;
// }

// void setTextAlignment(uint8_t setTextAlignment)
// {
// 	text.textAlignment = setTextAlignment;
// 	calculateTextAlignmentOffset();
// }

// void calculateTextAlignmentOffset(void)
// {
// 	switch(text.textAlignment){
// 		case TEXT_ALIGN_LEFT:
// 			text.textAlignmentOffset = 0;
// 			break;
// 		case TEXT_ALIGN_LEFT_END:
// 			text.textAlignmentOffset = matrix.maxLed * 8;
// 			break;
// 		case TEXT_ALIGN_RIGHT:
// 			text.textAlignmentOffset = text.mytext.length() * text.charWidth - matrix.maxLed*8;
// 			break;
// 		case TEXT_ALIGN_RIGHT_END:
// 			text.textAlignmentOffset = - text.mytext.length() * text.charWidth;
// 			break;
// 	}
// }

// void setText(String text)
// {
// 	text.mytext = text;
// 	text.textAlignmentOffset = 0;
// 	calculateTextAlignmentOffset();
// }

// void drawText(String text)
// {
// 	char letter;
// 	int8_t position = 0;
// 	uint8_t i;
// 	for(i = 0; i < text.mytext.length(); i++)
// 	{
// 		letter = text.mytext.charArt(i);
// 	}
// }