;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay
	.globl _DrawEx
	.globl _Screen
	.globl _Init
	.globl _MaxMatrix
	.globl _CLK_Config
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 26: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/main.c: 28: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/main.c: 31: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #108
;	user/main.c: 34: const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	ldw	x, sp
	addw	x, #9
	ldw	(0x6b, sp), x
	ldw	x, (0x6b, sp)
	clr	(x)
	ldw	x, (0x6b, sp)
	incw	x
	clr	(x)
	ldw	x, (0x6b, sp)
	incw	x
	incw	x
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0003
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0004
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0005
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0006
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0007
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0008
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0009, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x04
	ld	(0x000a, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x08
	ld	(0x000b, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x08
	ld	(0x000c, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x04
	ld	(0x000d, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x000e, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x000f
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0010
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x0011, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x0012, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0013, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0014, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x0015, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x0016, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x0017
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0018
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x3c
	ld	(0x0019, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x001a, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x001b, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x001c, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x001d, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x24
	ld	(0x001e, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x001f
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0020
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0021, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x0022, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x0023, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x0024, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x2a
	ld	(0x0025, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x44
	ld	(0x0026, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x0027
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0028
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x3c
	ld	(0x0029, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x002a, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x002b, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x002c, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x002d, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x3c
	ld	(0x002e, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x002f
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0030
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7c
	ld	(0x0031, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0032, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0033, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0034, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0035, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7c
	ld	(0x0036, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x0037
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0038
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0039, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x003a, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x003b, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x1a
	ld	(0x003c, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x2a
	ld	(0x003d, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x44
	ld	(0x003e, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x003f
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0040
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0041, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0042, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x4a
	ld	(0x0043, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x4a
	ld	(0x0044, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x4a
	ld	(0x0045, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x42
	ld	(0x0046, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x0047
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0048
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x0049, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x04
	ld	(0x004a, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x08
	ld	(0x004b, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x10
	ld	(0x004c, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x20
	ld	(0x004d, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7e
	ld	(0x004e, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x004f
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0050
	clr	(x)
	ldw	x, (0x6b, sp)
	ld	a, #0x7c
	ld	(0x0051, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0052, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0053, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0054, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x12
	ld	(0x0055, x), a
	ldw	x, (0x6b, sp)
	ld	a, #0x7c
	ld	(0x0056, x), a
	ldw	x, (0x6b, sp)
	addw	x, #0x0057
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0058
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x0059
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005a
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005b
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005c
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005d
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005e
	clr	(x)
	ldw	x, (0x6b, sp)
	addw	x, #0x005f
	clr	(x)
;	user/main.c: 47: char smile[]={0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
	ldw	x, sp
	incw	x
	ldw	(0x69, sp), x
	ldw	x, (0x69, sp)
	ld	a, #0x01
	ld	(x), a
	ldw	x, (0x69, sp)
	incw	x
	ld	a, #0x01
	ld	(x), a
	ldw	x, (0x69, sp)
	incw	x
	incw	x
	ld	a, #0x01
	ld	(x), a
	ldw	x, (0x69, sp)
	ld	a, #0x01
	ld	(0x0003, x), a
	ldw	x, (0x69, sp)
	ld	a, #0x01
	ld	(0x0004, x), a
	ldw	x, (0x69, sp)
	ld	a, #0x01
	ld	(0x0005, x), a
	ldw	x, (0x69, sp)
	ld	a, #0x01
	ld	(0x0006, x), a
	ldw	x, (0x69, sp)
	addw	x, #0x0007
	ld	a, #0x01
	ld	(x), a
;	user/main.c: 48: CLK_Config();
	call	_CLK_Config
;	user/main.c: 51: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
	push	#0x04
	push	#0x20
	push	#0x10
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_MaxMatrix
	addw	sp, #6
;	user/main.c: 52: Init();
	call	_Init
;	user/main.c: 53: Screen();
	call	_Screen
;	user/main.c: 57: DrawEx(1, smile);
	ldw	x, (0x69, sp)
	pushw	x
	push	#0x01
	call	_DrawEx
	addw	sp, #3
;	user/main.c: 58: Screen();
	call	_Screen
;	user/main.c: 82: while(TRUE) 
00102$:
	jra	00102$
	addw	sp, #108
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
