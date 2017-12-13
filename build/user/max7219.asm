;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module max7219
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memset
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _matrix
	.globl _MaxMatrix
	.globl _setCommand
	.globl _Init
	.globl _setIntensity
	.globl _Clear
	.globl _Screen
	.globl _setDot
	.globl _setColumn
	.globl _setRow
	.globl _DrawEx
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_matrix::
	.ds 86
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/max7219.c: 7: static void delay_ms(uint8_t x)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	push	a
;	user/max7219.c: 9: while(x--);
	ld	a, (0x04, sp)
00101$:
	ld	(0x01, sp), a
	dec	a
	tnz	(0x01, sp)
	jrne	00101$
	pop	a
	ret
;	user/max7219.c: 12: void MaxMatrix(GPIO_TypeDef* port, uint8_t data, uint8_t cs, uint8_t clk, uint8_t numLed)
;	-----------------------------------------
;	 function MaxMatrix
;	-----------------------------------------
_MaxMatrix:
	pushw	x
;	user/max7219.c: 14: matrix.port = port;
	ldw	x, #_matrix+0
	ldw	y, (0x05, sp)
	ldw	(x), y
;	user/max7219.c: 15: matrix.data = data;
	ldw	x, #_matrix+0
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	incw	x
	incw	x
	ld	a, (0x07, sp)
	ld	(x), a
;	user/max7219.c: 16: matrix.cs = cs;
	ldw	x, (0x01, sp)
	ld	a, (0x08, sp)
	ld	(0x0003, x), a
;	user/max7219.c: 17: matrix.clk = clk;
	ldw	x, (0x01, sp)
	ld	a, (0x09, sp)
	ld	(0x0004, x), a
;	user/max7219.c: 18: matrix.maxLed =  numLed;
	ldw	x, (0x01, sp)
	ld	a, (0x0a, sp)
	ld	(0x0005, x), a
;	user/max7219.c: 19: memset(matrix.buffer, 0x00, sizeof(matrix.buffer));
	ldw	x, (0x01, sp)
	addw	x, #0x0006
	push	#0x50
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #8
	ret
;	user/max7219.c: 22: static void Max7219_Write_Byte(uint8_t dat)
;	-----------------------------------------
;	 function Max7219_Write_Byte
;	-----------------------------------------
_Max7219_Write_Byte:
	sub	sp, #6
;	user/max7219.c: 26: dsent = dat;
	ld	a, (0x09, sp)
	ld	(0x02, sp), a
;	user/max7219.c: 27: for(cnt=0; cnt<8; cnt++)
	ldw	x, #_matrix+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	addw	x, #0x0004
	ldw	(0x05, sp), x
	clr	(0x01, sp)
00105$:
;	user/max7219.c: 29: GPIO_WriteLow(matrix.port, matrix.clk);
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
	ldw	x, (0x03, sp)
	ldw	x, (x)
;	user/max7219.c: 31: GPIO_WriteHigh(matrix.port, matrix.data);
	ldw	y, (0x03, sp)
	ld	a, (0x2, y)
;	user/max7219.c: 30: if(dsent&0x80)
	tnz	(0x02, sp)
	jrpl	00102$
;	user/max7219.c: 31: GPIO_WriteHigh(matrix.port, matrix.data);
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
	jra	00103$
00102$:
;	user/max7219.c: 33: GPIO_WriteLow(matrix.port, matrix.data);
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
00103$:
;	user/max7219.c: 34: GPIO_WriteHigh(matrix.port, matrix.clk);
	ldw	x, (0x05, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/max7219.c: 35: dsent <<= 1;
	sll	(0x02, sp)
;	user/max7219.c: 27: for(cnt=0; cnt<8; cnt++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
	addw	sp, #6
	ret
;	user/max7219.c: 39: void setCommand(uint8_t command, uint8_t value)
;	-----------------------------------------
;	 function setCommand
;	-----------------------------------------
_setCommand:
	sub	sp, #7
;	user/max7219.c: 42: GPIO_WriteLow(matrix.port, matrix.cs);
	ldw	x, #_matrix+0
	ldw	(0x02, sp), x
	ldw	x, (0x02, sp)
	addw	x, #0x0003
	ldw	(0x04, sp), x
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 43: for(i = 0; i < matrix.maxLed; i++)
	ldw	y, (0x02, sp)
	ldw	(0x06, sp), y
	clr	(0x01, sp)
00103$:
	ldw	x, (0x06, sp)
	ld	a, (0x5, x)
	cp	a, (0x01, sp)
	jrule	00101$
;	user/max7219.c: 45: Max7219_Write_Byte(command);
	ld	a, (0x0a, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 46: Max7219_Write_Byte(value);
	ld	a, (0x0b, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 43: for(i = 0; i < matrix.maxLed; i++)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	user/max7219.c: 48: GPIO_WriteLow(matrix.port, matrix.cs);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 49: GPIO_WriteHigh(matrix.port, matrix.cs);
	ldw	x, (0x04, sp)
	ld	a, (x)
	ldw	x, (0x02, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #10
	ret
;	user/max7219.c: 52: void Init(void)
;	-----------------------------------------
;	 function Init
;	-----------------------------------------
_Init:
	sub	sp, #4
;	user/max7219.c: 54: GPIO_Init(matrix.port, matrix.data|matrix.cs|matrix.clk, GPIO_MODE_OUT_PP_HIGH_FAST);
	ldw	x, #_matrix+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	ld	a, (0x2, x)
	ld	(0x02, sp), a
	ldw	x, (0x03, sp)
	ld	a, (0x3, x)
	or	a, (0x02, sp)
	ld	(0x01, sp), a
	ldw	x, (0x03, sp)
	ld	a, (0x4, x)
	or	a, (0x01, sp)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	#0xf0
	push	a
	pushw	x
	call	_GPIO_Init
	addw	sp, #4
;	user/max7219.c: 55: setCommand(SCANLIMIT, 0x07); //scanf 8digit
	push	#0x07
	push	#0x0b
	call	_setCommand
	popw	x
;	user/max7219.c: 56: setCommand(DECODEMODE, 0x00); //use led matrix, not decode digit
	push	#0x00
	push	#0x09
	call	_setCommand
	popw	x
;	user/max7219.c: 57: setCommand(SHUTDOWN, 0x01); // normal operator
	push	#0x01
	push	#0x0c
	call	_setCommand
	popw	x
;	user/max7219.c: 58: setCommand(DISPLAYTEST, 0x00); //no display test
	push	#0x00
	push	#0x0f
	call	_setCommand
	popw	x
;	user/max7219.c: 59: Clear();
	call	_Clear
;	user/max7219.c: 60: setCommand(INTENSITY, 0x04); // brightness 9/32
	push	#0x04
	push	#0x0a
	call	_setCommand
	addw	sp, #6
	ret
;	user/max7219.c: 63: void setIntensity(uint8_t intensity)
;	-----------------------------------------
;	 function setIntensity
;	-----------------------------------------
_setIntensity:
;	user/max7219.c: 65: setCommand(INTENSITY, intensity);
	ld	a, (0x03, sp)
	push	a
	push	#0x0a
	call	_setCommand
	popw	x
	ret
;	user/max7219.c: 68: void Clear(void)
;	-----------------------------------------
;	 function Clear
;	-----------------------------------------
_Clear:
;	user/max7219.c: 70: memset(matrix.buffer, 0x00, sizeof(matrix.buffer));
	ldw	x, #_matrix+6
	push	#0x50
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #6
	ret
;	user/max7219.c: 73: void Screen(void)
;	-----------------------------------------
;	 function Screen
;	-----------------------------------------
_Screen:
	sub	sp, #13
;	user/max7219.c: 76: for(i = 0; i < 8; i++)
	ldw	x, #_matrix+0
	ldw	(0x03, sp), x
	ldw	x, (0x03, sp)
	addw	x, #0x0003
	ldw	(0x0b, sp), x
	clr	(0x02, sp)
00106$:
;	user/max7219.c: 79: GPIO_WriteLow(matrix.port, matrix.cs);
	ldw	x, (0x0b, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 80: for(j = 0; j < matrix.maxLed; j++)
	ld	a, (0x02, sp)
	inc	a
	ld	(0x05, sp), a
	ld	a, (0x05, sp)
	ld	(0x08, sp), a
	ldw	x, (0x03, sp)
	addw	x, #0x0006
	ldw	(0x06, sp), x
	ldw	y, (0x03, sp)
	ldw	(0x09, sp), y
	ld	a, (0x02, sp)
	ld	(0x0d, sp), a
	clr	(0x01, sp)
00104$:
	ldw	x, (0x09, sp)
	ld	a, (0x5, x)
	cp	a, (0x01, sp)
	jrule	00101$
;	user/max7219.c: 82: Max7219_Write_Byte(i+1);
	ld	a, (0x08, sp)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 83: Max7219_Write_Byte(matrix.buffer[col]);
	clrw	x
	ld	a, (0x0d, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_Max7219_Write_Byte
	pop	a
;	user/max7219.c: 84: col += 8;
	ld	a, (0x0d, sp)
	add	a, #0x08
	ld	(0x0d, sp), a
;	user/max7219.c: 80: for(j = 0; j < matrix.maxLed; j++)
	inc	(0x01, sp)
	jra	00104$
00101$:
;	user/max7219.c: 86: GPIO_WriteLow(matrix.port, matrix.cs);
	ldw	x, (0x0b, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 87: GPIO_WriteHigh(matrix.port, matrix.cs);
	ldw	x, (0x0b, sp)
	ld	a, (x)
	ldw	x, (0x03, sp)
	ldw	x, (x)
	push	a
	pushw	x
	call	_GPIO_WriteHigh
	addw	sp, #3
;	user/max7219.c: 76: for(i = 0; i < 8; i++)
	ld	a, (0x05, sp)
	ld	(0x02, sp), a
	ld	a, (0x05, sp)
	cp	a, #0x08
	jrc	00106$
	addw	sp, #13
	ret
;	user/max7219.c: 91: void setDot(uint8_t col, uint8_t row, uint8_t value)
;	-----------------------------------------
;	 function setDot
;	-----------------------------------------
_setDot:
	sub	sp, #7
;	user/max7219.c: 94: uint8_t n = (matrix.maxLed - 1) - (col / 8);
	ldw	x, #_matrix+0
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, (0x5, x)
	ld	xl, a
	dec	a
	ld	xh, a
	ld	a, (0x0a, sp)
	srl	a
	srl	a
	srl	a
	ld	(0x03, sp), a
	ld	a, xh
	sub	a, (0x03, sp)
;	user/max7219.c: 95: offset = (n*8 + row);
	sll	a
	sll	a
	sll	a
	add	a, (0x0b, sp)
	ld	(0x01, sp), a
;	user/max7219.c: 96: val = 0x01 << (col%8);
	ld	a, (0x0a, sp)
	and	a, #0x07
	exg	a, yl
	ld	a, #0x01
	exg	a, yl
	tnz	a
	jreq	00120$
00119$:
	exg	a, yl
	sll	a
	exg	a, yl
	dec	a
	jrne	00119$
00120$:
;	user/max7219.c: 97: if(row < 0 || row > 7 || col < 0 || col > matrix.maxLed*8) return;
	ld	a, (0x0b, sp)
	cp	a, #0x07
	jrugt	00109$
	clr	a
	ld	xh, a
	sllw	x
	sllw	x
	sllw	x
	ld	a, (0x0a, sp)
	ld	(0x05, sp), a
	clr	(0x04, sp)
	cpw	x, (0x04, sp)
	jrslt	00109$
;	user/max7219.c: 99: matrix.buffer[offset] |= val;
	ldw	x, (0x06, sp)
	addw	x, #0x0006
	ld	a, xl
	add	a, (0x01, sp)
	rlwa	x
	adc	a, #0x00
	ld	xh, a
	ld	a, (x)
;	user/max7219.c: 98: if(value)
	tnz	(0x0c, sp)
	jreq	00107$
;	user/max7219.c: 99: matrix.buffer[offset] |= val;
	pushw	y
	or	a, (2, sp)
	popw	y
	ld	(x), a
	jra	00109$
00107$:
;	user/max7219.c: 101: matrix.buffer[offset] &= ~val;
	push	a
	ld	a, yl
	cpl	a
	ld	(0x03, sp), a
	pop	a
	and	a, (0x02, sp)
	ld	(x), a
00109$:
	addw	sp, #7
	ret
;	user/max7219.c: 104: void setColumn(uint8_t col, uint8_t value)
;	-----------------------------------------
;	 function setColumn
;	-----------------------------------------
_setColumn:
	sub	sp, #5
;	user/max7219.c: 107: if(col < 0 || col > matrix.maxLed*8) return;
	ldw	x, #_matrix+5
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	ld	a, (0x08, sp)
	ld	(0x03, sp), a
	clr	(0x02, sp)
	cpw	x, (0x02, sp)
;	user/max7219.c: 108: for(row = 0; row < 8; row++)
	jrslt	00107$
	clr	(0x01, sp)
00105$:
;	user/max7219.c: 110: val = value >> (7-row);
	ld	a, (0x01, sp)
	ld	(0x05, sp), a
	clr	(0x04, sp)
	ldw	x, #0x0007
	subw	x, (0x04, sp)
	ld	a, (0x09, sp)
	push	a
	ld	a, xl
	tnz	a
	jreq	00120$
00119$:
	srl	(1, sp)
	dec	a
	jrne	00119$
00120$:
	ld	a, (0x02, sp)
	push	a
	ld	a, (0x0a, sp)
	push	a
	call	_setDot
	addw	sp, #3
;	user/max7219.c: 108: for(row = 0; row < 8; row++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x08
	jrc	00105$
00107$:
	addw	sp, #5
	ret
;	user/max7219.c: 115: void setRow(uint8_t row, uint8_t value)
;	-----------------------------------------
;	 function setRow
;	-----------------------------------------
_setRow:
	sub	sp, #5
;	user/max7219.c: 118: if(row < 0 || row > 7) return;
	ld	a, (0x08, sp)
	cp	a, #0x07
;	user/max7219.c: 119: for(i = 0; i < matrix.maxLed; i++)
	jrugt	00108$
	ldw	x, #_matrix+0
	ldw	(0x02, sp), x
	ldw	y, (0x02, sp)
	clr	(0x01, sp)
00106$:
	ld	a, (0x5, y)
	cp	a, (0x01, sp)
	jrule	00108$
;	user/max7219.c: 121: offset = (i*8)+row;
	ld	a, (0x01, sp)
	sll	a
	sll	a
	sll	a
	add	a, (0x08, sp)
;	user/max7219.c: 122: matrix.buffer[offset] = value;
	ldw	x, (0x02, sp)
	addw	x, #0x0006
	ldw	(0x04, sp), x
	clrw	x
	ld	xl, a
	addw	x, (0x04, sp)
	ld	a, (0x09, sp)
	ld	(x), a
;	user/max7219.c: 119: for(i = 0; i < matrix.maxLed; i++)
	inc	(0x01, sp)
	jra	00106$
00108$:
	addw	sp, #5
	ret
;	user/max7219.c: 126: void DrawEx(uint8_t scrollCnt, uint16_t *data)
;	-----------------------------------------
;	 function DrawEx
;	-----------------------------------------
_DrawEx:
	sub	sp, #12
;	user/max7219.c: 133: Clear();
	call	_Clear
;	user/max7219.c: 134: for(cntC = 0; cntC < matrix.maxLed*8; cntC++)
	ldw	x, #_matrix+5
	ldw	(0x0b, sp), x
	clr	(0x04, sp)
00109$:
	ldw	x, (0x0b, sp)
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x09, sp), x
	ld	a, (0x04, sp)
	ld	(0x08, sp), a
	clr	(0x07, sp)
	ldw	x, (0x07, sp)
	cpw	x, (0x09, sp)
	jrsge	00111$
;	user/max7219.c: 136: dataGet = data[cntC+scrollCnt];
	clrw	x
	ld	a, (0x0f, sp)
	ld	xl, a
	addw	x, (0x07, sp)
	sllw	x
	addw	x, (0x10, sp)
	ldw	x, (x)
	ldw	(0x01, sp), x
;	user/max7219.c: 137: mask = 0x0001;
	ldw	x, #0x0001
	ldw	(0x05, sp), x
;	user/max7219.c: 138: for(cntR = 0; cntR<8; cntR++)
	clr	(0x03, sp)
00106$:
;	user/max7219.c: 141: setDot(cntC, 8 - cntR -1, 1);
	ld	a, #0x07
	sub	a, (0x03, sp)
;	user/max7219.c: 140: if(dataGet&mask)
	push	a
	ld	a, (0x03, sp)
	and	a, (0x07, sp)
	ld	xl, a
	ld	a, (0x02, sp)
	and	a, (0x06, sp)
	ld	xh, a
	pop	a
	tnzw	x
	jreq	00102$
;	user/max7219.c: 141: setDot(cntC, 8 - cntR -1, 1);
	push	#0x01
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_setDot
	addw	sp, #3
	jra	00103$
00102$:
;	user/max7219.c: 143: setDot(cntC, 8 - cntR -1, 0);
	push	#0x00
	push	a
	ld	a, (0x06, sp)
	push	a
	call	_setDot
	addw	sp, #3
00103$:
;	user/max7219.c: 144: mask <<=1;
	ldw	x, (0x05, sp)
	sllw	x
	ldw	(0x05, sp), x
;	user/max7219.c: 138: for(cntR = 0; cntR<8; cntR++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00106$
;	user/max7219.c: 134: for(cntC = 0; cntC < matrix.maxLed*8; cntC++)
	inc	(0x04, sp)
	jra	00109$
00111$:
	addw	sp, #12
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
