;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module max7219
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SPI_GetFlagStatus
	.globl _SPI_SendData
	.globl _GPIO_WriteLow
	.globl _GPIO_WriteHigh
	.globl _GPIO_Init
	.globl _Max7219_Init
	.globl _Max7219_Write
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
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
;	user/max7219.c: 4: static void delay_ms(uint8_t x)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	push	a
;	user/max7219.c: 6: while(x--);
	ld	a, (0x04, sp)
00101$:
	ld	(0x01, sp), a
	dec	a
	tnz	(0x01, sp)
	jrne	00101$
	pop	a
	ret
;	user/max7219.c: 9: void Max7219_Init(void)
;	-----------------------------------------
;	 function Max7219_Init
;	-----------------------------------------
_Max7219_Init:
;	user/max7219.c: 11: GPIO_Init(CS_port, CS_pin, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	user/max7219.c: 12: Max7219_Write(SHUTDOWN, 0x01); // Normal operation
	push	#0x01
	push	#0x0c
	call	_Max7219_Write
	popw	x
;	user/max7219.c: 13: Max7219_Write(DECODEMODE, 0x00); // No decode
	push	#0x00
	push	#0x09
	call	_Max7219_Write
	popw	x
;	user/max7219.c: 14: Max7219_Write(SCANLIMIT, 0x07); // scan 8 row
	push	#0x07
	push	#0x0b
	call	_Max7219_Write
	popw	x
;	user/max7219.c: 15: Max7219_Write(INTENSITY, 0x04); // brightness 9/32
	push	#0x04
	push	#0x0a
	call	_Max7219_Write
	popw	x
;	user/max7219.c: 16: Max7219_Write(DISPLAYTEST, 0x00);
	push	#0x00
	push	#0x0f
	call	_Max7219_Write
	popw	x
;	user/max7219.c: 17: delay_ms(100);
	push	#0x64
	call	_delay_ms
	pop	a
	ret
;	user/max7219.c: 19: void Max7219_Write(unsigned char addr, unsigned char value)
;	-----------------------------------------
;	 function Max7219_Write
;	-----------------------------------------
_Max7219_Write:
;	user/max7219.c: 21: while(SPI_GetFlagStatus(SPI_FLAG_BSY));
00101$:
	push	#0x80
	call	_SPI_GetFlagStatus
	addw	sp, #1
	tnz	a
	jrne	00101$
;	user/max7219.c: 22: GPIO_WriteLow(CS_port, CS_pin);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteLow
	addw	sp, #3
;	user/max7219.c: 23: SPI_SendData(addr);
	ld	a, (0x03, sp)
	push	a
	call	_SPI_SendData
	pop	a
;	user/max7219.c: 24: while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
00104$:
	push	#0x02
	call	_SPI_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00104$
;	user/max7219.c: 25: SPI_SendData(value);
	ld	a, (0x04, sp)
	push	a
	call	_SPI_SendData
	pop	a
;	user/max7219.c: 26: while(!SPI_GetFlagStatus(SPI_FLAG_TXE));
00107$:
	push	#0x02
	call	_SPI_GetFlagStatus
	addw	sp, #1
	tnz	a
	jreq	00107$
;	user/max7219.c: 27: GPIO_WriteHigh(CS_port, CS_pin);
	push	#0x10
	push	#0x0a
	push	#0x50
	call	_GPIO_WriteHigh
	addw	sp, #3
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
