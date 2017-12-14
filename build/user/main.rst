                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _delay
                                     14 	.globl _TEXT_Manage
                                     15 	.globl _TEXT_Init
                                     16 	.globl _TIMER_Inc
                                     17 	.globl _TIMER_Init
                                     18 	.globl _Screen
                                     19 	.globl _Init
                                     20 	.globl _MaxMatrix
                                     21 	.globl _TIM4_ClearITPendingBit
                                     22 	.globl _IWDG_Enable
                                     23 	.globl _IWDG_ReloadCounter
                                     24 	.globl _IWDG_SetReload
                                     25 	.globl _IWDG_SetPrescaler
                                     26 	.globl _IWDG_WriteAccessCmd
                                     27 	.globl _CLK_Config
                                     28 	.globl _IWDG_Config
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; Stack segment in internal ram 
                                     39 ;--------------------------------------------------------
                                     40 	.area	SSEG
      00958D                         41 __start__stack:
      00958D                         42 	.ds	1
                                     43 
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 ;--------------------------------------------------------
                                     49 ; interrupt vector 
                                     50 ;--------------------------------------------------------
                                     51 	.area HOME
      008000                         52 __interrupt_vect:
      008000 82 00 80 83             53 	int s_GSINIT ;reset
      008004 82 00 00 00             54 	int 0x0000 ;trap
      008008 82 00 00 00             55 	int 0x0000 ;int0
      00800C 82 00 00 00             56 	int 0x0000 ;int1
      008010 82 00 00 00             57 	int 0x0000 ;int2
      008014 82 00 00 00             58 	int 0x0000 ;int3
      008018 82 00 00 00             59 	int 0x0000 ;int4
      00801C 82 00 00 00             60 	int 0x0000 ;int5
      008020 82 00 00 00             61 	int 0x0000 ;int6
      008024 82 00 00 00             62 	int 0x0000 ;int7
      008028 82 00 00 00             63 	int 0x0000 ;int8
      00802C 82 00 00 00             64 	int 0x0000 ;int9
      008030 82 00 00 00             65 	int 0x0000 ;int10
      008034 82 00 00 00             66 	int 0x0000 ;int11
      008038 82 00 00 00             67 	int 0x0000 ;int12
      00803C 82 00 00 00             68 	int 0x0000 ;int13
      008040 82 00 00 00             69 	int 0x0000 ;int14
      008044 82 00 00 00             70 	int 0x0000 ;int15
      008048 82 00 00 00             71 	int 0x0000 ;int16
      00804C 82 00 00 00             72 	int 0x0000 ;int17
      008050 82 00 00 00             73 	int 0x0000 ;int18
      008054 82 00 00 00             74 	int 0x0000 ;int19
      008058 82 00 00 00             75 	int 0x0000 ;int20
      00805C 82 00 00 00             76 	int 0x0000 ;int21
      008060 82 00 00 00             77 	int 0x0000 ;int22
      008064 82 00 8A 10             78 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             79 	int 0x0000 ;int24
      00806C 82 00 00 00             80 	int 0x0000 ;int25
      008070 82 00 00 00             81 	int 0x0000 ;int26
      008074 82 00 00 00             82 	int 0x0000 ;int27
      008078 82 00 00 00             83 	int 0x0000 ;int28
      00807C 82 00 00 00             84 	int 0x0000 ;int29
                                     85 ;--------------------------------------------------------
                                     86 ; global & static initialisations
                                     87 ;--------------------------------------------------------
                                     88 	.area HOME
                                     89 	.area GSINIT
                                     90 	.area GSFINAL
                                     91 	.area GSINIT
      008083                         92 __sdcc_gs_init_startup:
      008083                         93 __sdcc_init_data:
                                     94 ; stm8_genXINIT() start
      008083 AE 01 31         [ 2]   95 	ldw x, #l_DATA
      008086 27 07            [ 1]   96 	jreq	00002$
      008088                         97 00001$:
      008088 72 4F 00 00      [ 1]   98 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   99 	decw x
      00808D 26 F9            [ 1]  100 	jrne	00001$
      00808F                        101 00002$:
      00808F AE 00 00         [ 2]  102 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  103 	jreq	00004$
      008094                        104 00003$:
      008094 D6 95 8C         [ 1]  105 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 01 31         [ 1]  106 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  107 	decw	x
      00809B 26 F7            [ 1]  108 	jrne	00003$
      00809D                        109 00004$:
                                    110 ; stm8_genXINIT() end
                                    111 	.area GSFINAL
      00809D CC 80 80         [ 2]  112 	jp	__sdcc_program_startup
                                    113 ;--------------------------------------------------------
                                    114 ; Home
                                    115 ;--------------------------------------------------------
                                    116 	.area HOME
                                    117 	.area HOME
      008080                        118 __sdcc_program_startup:
      008080 CC 8A 36         [ 2]  119 	jp	_main
                                    120 ;	return from main will return to caller
                                    121 ;--------------------------------------------------------
                                    122 ; code
                                    123 ;--------------------------------------------------------
                                    124 	.area CODE
                                    125 ;	user/main.c: 26: void delay(uint16_t x)
                                    126 ;	-----------------------------------------
                                    127 ;	 function delay
                                    128 ;	-----------------------------------------
      008A04                        129 _delay:
      008A04 89               [ 2]  130 	pushw	x
                                    131 ;	user/main.c: 28: while(x--);
      008A05 1E 05            [ 2]  132 	ldw	x, (0x05, sp)
      008A07                        133 00101$:
      008A07 1F 01            [ 2]  134 	ldw	(0x01, sp), x
      008A09 5A               [ 2]  135 	decw	x
      008A0A 16 01            [ 2]  136 	ldw	y, (0x01, sp)
      008A0C 26 F9            [ 1]  137 	jrne	00101$
      008A0E 85               [ 2]  138 	popw	x
      008A0F 81               [ 4]  139 	ret
                                    140 ;	user/main.c: 31: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    141 ;	-----------------------------------------
                                    142 ;	 function TIM4_UPD_OVF_IRQHandler
                                    143 ;	-----------------------------------------
      008A10                        144 _TIM4_UPD_OVF_IRQHandler:
      008A10 62               [ 2]  145 	div	x, a
                                    146 ;	user/main.c: 33: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      008A11 4B 01            [ 1]  147 	push	#0x01
      008A13 CD 95 0A         [ 4]  148 	call	_TIM4_ClearITPendingBit
      008A16 84               [ 1]  149 	pop	a
                                    150 ;	user/main.c: 34: TIMER_Inc();
      008A17 CD 90 0F         [ 4]  151 	call	_TIMER_Inc
                                    152 ;	user/main.c: 35: IWDG_ReloadCounter();
      008A1A CD 93 33         [ 4]  153 	call	_IWDG_ReloadCounter
      008A1D 80               [11]  154 	iret
                                    155 ;	user/main.c: 38: void IWDG_Config(void)
                                    156 ;	-----------------------------------------
                                    157 ;	 function IWDG_Config
                                    158 ;	-----------------------------------------
      008A1E                        159 _IWDG_Config:
                                    160 ;	user/main.c: 42: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      008A1E 4B 55            [ 1]  161 	push	#0x55
      008A20 CD 93 1E         [ 4]  162 	call	_IWDG_WriteAccessCmd
      008A23 84               [ 1]  163 	pop	a
                                    164 ;	user/main.c: 44: IWDG_SetPrescaler(IWDG_Prescaler_256);
      008A24 4B 06            [ 1]  165 	push	#0x06
      008A26 CD 93 25         [ 4]  166 	call	_IWDG_SetPrescaler
      008A29 84               [ 1]  167 	pop	a
                                    168 ;	user/main.c: 48: IWDG_SetReload(250);
      008A2A 4B FA            [ 1]  169 	push	#0xfa
      008A2C CD 93 2C         [ 4]  170 	call	_IWDG_SetReload
      008A2F 84               [ 1]  171 	pop	a
                                    172 ;	user/main.c: 50: IWDG_ReloadCounter();
      008A30 CD 93 33         [ 4]  173 	call	_IWDG_ReloadCounter
                                    174 ;	user/main.c: 52: IWDG_Enable();
      008A33 CC 93 38         [ 2]  175 	jp	_IWDG_Enable
                                    176 ;	user/main.c: 56: void main() 
                                    177 ;	-----------------------------------------
                                    178 ;	 function main
                                    179 ;	-----------------------------------------
      008A36                        180 _main:
      008A36 52 62            [ 2]  181 	sub	sp, #98
                                    182 ;	user/main.c: 59: const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      008A38 96               [ 1]  183 	ldw	x, sp
      008A39 5C               [ 2]  184 	incw	x
      008A3A 1F 61            [ 2]  185 	ldw	(0x61, sp), x
      008A3C 1E 61            [ 2]  186 	ldw	x, (0x61, sp)
      008A3E 7F               [ 1]  187 	clr	(x)
      008A3F 1E 61            [ 2]  188 	ldw	x, (0x61, sp)
      008A41 5C               [ 2]  189 	incw	x
      008A42 7F               [ 1]  190 	clr	(x)
      008A43 1E 61            [ 2]  191 	ldw	x, (0x61, sp)
      008A45 5C               [ 2]  192 	incw	x
      008A46 5C               [ 2]  193 	incw	x
      008A47 7F               [ 1]  194 	clr	(x)
      008A48 1E 61            [ 2]  195 	ldw	x, (0x61, sp)
      008A4A 1C 00 03         [ 2]  196 	addw	x, #0x0003
      008A4D 7F               [ 1]  197 	clr	(x)
      008A4E 1E 61            [ 2]  198 	ldw	x, (0x61, sp)
      008A50 1C 00 04         [ 2]  199 	addw	x, #0x0004
      008A53 7F               [ 1]  200 	clr	(x)
      008A54 1E 61            [ 2]  201 	ldw	x, (0x61, sp)
      008A56 1C 00 05         [ 2]  202 	addw	x, #0x0005
      008A59 7F               [ 1]  203 	clr	(x)
      008A5A 1E 61            [ 2]  204 	ldw	x, (0x61, sp)
      008A5C 1C 00 06         [ 2]  205 	addw	x, #0x0006
      008A5F 7F               [ 1]  206 	clr	(x)
      008A60 1E 61            [ 2]  207 	ldw	x, (0x61, sp)
      008A62 1C 00 07         [ 2]  208 	addw	x, #0x0007
      008A65 7F               [ 1]  209 	clr	(x)
      008A66 1E 61            [ 2]  210 	ldw	x, (0x61, sp)
      008A68 1C 00 08         [ 2]  211 	addw	x, #0x0008
      008A6B 7F               [ 1]  212 	clr	(x)
      008A6C 1E 61            [ 2]  213 	ldw	x, (0x61, sp)
      008A6E A6 7E            [ 1]  214 	ld	a, #0x7e
      008A70 E7 09            [ 1]  215 	ld	(0x0009, x), a
      008A72 1E 61            [ 2]  216 	ldw	x, (0x61, sp)
      008A74 A6 04            [ 1]  217 	ld	a, #0x04
      008A76 E7 0A            [ 1]  218 	ld	(0x000a, x), a
      008A78 1E 61            [ 2]  219 	ldw	x, (0x61, sp)
      008A7A A6 08            [ 1]  220 	ld	a, #0x08
      008A7C E7 0B            [ 1]  221 	ld	(0x000b, x), a
      008A7E 1E 61            [ 2]  222 	ldw	x, (0x61, sp)
      008A80 A6 08            [ 1]  223 	ld	a, #0x08
      008A82 E7 0C            [ 1]  224 	ld	(0x000c, x), a
      008A84 1E 61            [ 2]  225 	ldw	x, (0x61, sp)
      008A86 A6 04            [ 1]  226 	ld	a, #0x04
      008A88 E7 0D            [ 1]  227 	ld	(0x000d, x), a
      008A8A 1E 61            [ 2]  228 	ldw	x, (0x61, sp)
      008A8C A6 7E            [ 1]  229 	ld	a, #0x7e
      008A8E E7 0E            [ 1]  230 	ld	(0x000e, x), a
      008A90 1E 61            [ 2]  231 	ldw	x, (0x61, sp)
      008A92 1C 00 0F         [ 2]  232 	addw	x, #0x000f
      008A95 7F               [ 1]  233 	clr	(x)
      008A96 1E 61            [ 2]  234 	ldw	x, (0x61, sp)
      008A98 1C 00 10         [ 2]  235 	addw	x, #0x0010
      008A9B 7F               [ 1]  236 	clr	(x)
      008A9C 1E 61            [ 2]  237 	ldw	x, (0x61, sp)
      008A9E A6 42            [ 1]  238 	ld	a, #0x42
      008AA0 E7 11            [ 1]  239 	ld	(0x0011, x), a
      008AA2 1E 61            [ 2]  240 	ldw	x, (0x61, sp)
      008AA4 A6 42            [ 1]  241 	ld	a, #0x42
      008AA6 E7 12            [ 1]  242 	ld	(0x0012, x), a
      008AA8 1E 61            [ 2]  243 	ldw	x, (0x61, sp)
      008AAA A6 7E            [ 1]  244 	ld	a, #0x7e
      008AAC E7 13            [ 1]  245 	ld	(0x0013, x), a
      008AAE 1E 61            [ 2]  246 	ldw	x, (0x61, sp)
      008AB0 A6 7E            [ 1]  247 	ld	a, #0x7e
      008AB2 E7 14            [ 1]  248 	ld	(0x0014, x), a
      008AB4 1E 61            [ 2]  249 	ldw	x, (0x61, sp)
      008AB6 A6 42            [ 1]  250 	ld	a, #0x42
      008AB8 E7 15            [ 1]  251 	ld	(0x0015, x), a
      008ABA 1E 61            [ 2]  252 	ldw	x, (0x61, sp)
      008ABC A6 42            [ 1]  253 	ld	a, #0x42
      008ABE E7 16            [ 1]  254 	ld	(0x0016, x), a
      008AC0 1E 61            [ 2]  255 	ldw	x, (0x61, sp)
      008AC2 1C 00 17         [ 2]  256 	addw	x, #0x0017
      008AC5 7F               [ 1]  257 	clr	(x)
      008AC6 1E 61            [ 2]  258 	ldw	x, (0x61, sp)
      008AC8 1C 00 18         [ 2]  259 	addw	x, #0x0018
      008ACB 7F               [ 1]  260 	clr	(x)
      008ACC 1E 61            [ 2]  261 	ldw	x, (0x61, sp)
      008ACE A6 3C            [ 1]  262 	ld	a, #0x3c
      008AD0 E7 19            [ 1]  263 	ld	(0x0019, x), a
      008AD2 1E 61            [ 2]  264 	ldw	x, (0x61, sp)
      008AD4 A6 42            [ 1]  265 	ld	a, #0x42
      008AD6 E7 1A            [ 1]  266 	ld	(0x001a, x), a
      008AD8 1E 61            [ 2]  267 	ldw	x, (0x61, sp)
      008ADA A6 42            [ 1]  268 	ld	a, #0x42
      008ADC E7 1B            [ 1]  269 	ld	(0x001b, x), a
      008ADE 1E 61            [ 2]  270 	ldw	x, (0x61, sp)
      008AE0 A6 42            [ 1]  271 	ld	a, #0x42
      008AE2 E7 1C            [ 1]  272 	ld	(0x001c, x), a
      008AE4 1E 61            [ 2]  273 	ldw	x, (0x61, sp)
      008AE6 A6 42            [ 1]  274 	ld	a, #0x42
      008AE8 E7 1D            [ 1]  275 	ld	(0x001d, x), a
      008AEA 1E 61            [ 2]  276 	ldw	x, (0x61, sp)
      008AEC A6 24            [ 1]  277 	ld	a, #0x24
      008AEE E7 1E            [ 1]  278 	ld	(0x001e, x), a
      008AF0 1E 61            [ 2]  279 	ldw	x, (0x61, sp)
      008AF2 1C 00 1F         [ 2]  280 	addw	x, #0x001f
      008AF5 7F               [ 1]  281 	clr	(x)
      008AF6 1E 61            [ 2]  282 	ldw	x, (0x61, sp)
      008AF8 1C 00 20         [ 2]  283 	addw	x, #0x0020
      008AFB 7F               [ 1]  284 	clr	(x)
      008AFC 1E 61            [ 2]  285 	ldw	x, (0x61, sp)
      008AFE A6 7E            [ 1]  286 	ld	a, #0x7e
      008B00 E7 21            [ 1]  287 	ld	(0x0021, x), a
      008B02 1E 61            [ 2]  288 	ldw	x, (0x61, sp)
      008B04 A6 1A            [ 1]  289 	ld	a, #0x1a
      008B06 E7 22            [ 1]  290 	ld	(0x0022, x), a
      008B08 1E 61            [ 2]  291 	ldw	x, (0x61, sp)
      008B0A A6 1A            [ 1]  292 	ld	a, #0x1a
      008B0C E7 23            [ 1]  293 	ld	(0x0023, x), a
      008B0E 1E 61            [ 2]  294 	ldw	x, (0x61, sp)
      008B10 A6 1A            [ 1]  295 	ld	a, #0x1a
      008B12 E7 24            [ 1]  296 	ld	(0x0024, x), a
      008B14 1E 61            [ 2]  297 	ldw	x, (0x61, sp)
      008B16 A6 2A            [ 1]  298 	ld	a, #0x2a
      008B18 E7 25            [ 1]  299 	ld	(0x0025, x), a
      008B1A 1E 61            [ 2]  300 	ldw	x, (0x61, sp)
      008B1C A6 44            [ 1]  301 	ld	a, #0x44
      008B1E E7 26            [ 1]  302 	ld	(0x0026, x), a
      008B20 1E 61            [ 2]  303 	ldw	x, (0x61, sp)
      008B22 1C 00 27         [ 2]  304 	addw	x, #0x0027
      008B25 7F               [ 1]  305 	clr	(x)
      008B26 1E 61            [ 2]  306 	ldw	x, (0x61, sp)
      008B28 1C 00 28         [ 2]  307 	addw	x, #0x0028
      008B2B 7F               [ 1]  308 	clr	(x)
      008B2C 1E 61            [ 2]  309 	ldw	x, (0x61, sp)
      008B2E A6 3C            [ 1]  310 	ld	a, #0x3c
      008B30 E7 29            [ 1]  311 	ld	(0x0029, x), a
      008B32 1E 61            [ 2]  312 	ldw	x, (0x61, sp)
      008B34 A6 42            [ 1]  313 	ld	a, #0x42
      008B36 E7 2A            [ 1]  314 	ld	(0x002a, x), a
      008B38 1E 61            [ 2]  315 	ldw	x, (0x61, sp)
      008B3A A6 42            [ 1]  316 	ld	a, #0x42
      008B3C E7 2B            [ 1]  317 	ld	(0x002b, x), a
      008B3E 1E 61            [ 2]  318 	ldw	x, (0x61, sp)
      008B40 A6 42            [ 1]  319 	ld	a, #0x42
      008B42 E7 2C            [ 1]  320 	ld	(0x002c, x), a
      008B44 1E 61            [ 2]  321 	ldw	x, (0x61, sp)
      008B46 A6 42            [ 1]  322 	ld	a, #0x42
      008B48 E7 2D            [ 1]  323 	ld	(0x002d, x), a
      008B4A 1E 61            [ 2]  324 	ldw	x, (0x61, sp)
      008B4C A6 3C            [ 1]  325 	ld	a, #0x3c
      008B4E E7 2E            [ 1]  326 	ld	(0x002e, x), a
      008B50 1E 61            [ 2]  327 	ldw	x, (0x61, sp)
      008B52 1C 00 2F         [ 2]  328 	addw	x, #0x002f
      008B55 7F               [ 1]  329 	clr	(x)
      008B56 1E 61            [ 2]  330 	ldw	x, (0x61, sp)
      008B58 1C 00 30         [ 2]  331 	addw	x, #0x0030
      008B5B 7F               [ 1]  332 	clr	(x)
      008B5C 1E 61            [ 2]  333 	ldw	x, (0x61, sp)
      008B5E A6 7C            [ 1]  334 	ld	a, #0x7c
      008B60 E7 31            [ 1]  335 	ld	(0x0031, x), a
      008B62 1E 61            [ 2]  336 	ldw	x, (0x61, sp)
      008B64 A6 12            [ 1]  337 	ld	a, #0x12
      008B66 E7 32            [ 1]  338 	ld	(0x0032, x), a
      008B68 1E 61            [ 2]  339 	ldw	x, (0x61, sp)
      008B6A A6 12            [ 1]  340 	ld	a, #0x12
      008B6C E7 33            [ 1]  341 	ld	(0x0033, x), a
      008B6E 1E 61            [ 2]  342 	ldw	x, (0x61, sp)
      008B70 A6 12            [ 1]  343 	ld	a, #0x12
      008B72 E7 34            [ 1]  344 	ld	(0x0034, x), a
      008B74 1E 61            [ 2]  345 	ldw	x, (0x61, sp)
      008B76 A6 12            [ 1]  346 	ld	a, #0x12
      008B78 E7 35            [ 1]  347 	ld	(0x0035, x), a
      008B7A 1E 61            [ 2]  348 	ldw	x, (0x61, sp)
      008B7C A6 7C            [ 1]  349 	ld	a, #0x7c
      008B7E E7 36            [ 1]  350 	ld	(0x0036, x), a
      008B80 1E 61            [ 2]  351 	ldw	x, (0x61, sp)
      008B82 1C 00 37         [ 2]  352 	addw	x, #0x0037
      008B85 7F               [ 1]  353 	clr	(x)
      008B86 1E 61            [ 2]  354 	ldw	x, (0x61, sp)
      008B88 1C 00 38         [ 2]  355 	addw	x, #0x0038
      008B8B 7F               [ 1]  356 	clr	(x)
      008B8C 1E 61            [ 2]  357 	ldw	x, (0x61, sp)
      008B8E A6 7E            [ 1]  358 	ld	a, #0x7e
      008B90 E7 39            [ 1]  359 	ld	(0x0039, x), a
      008B92 1E 61            [ 2]  360 	ldw	x, (0x61, sp)
      008B94 A6 1A            [ 1]  361 	ld	a, #0x1a
      008B96 E7 3A            [ 1]  362 	ld	(0x003a, x), a
      008B98 1E 61            [ 2]  363 	ldw	x, (0x61, sp)
      008B9A A6 1A            [ 1]  364 	ld	a, #0x1a
      008B9C E7 3B            [ 1]  365 	ld	(0x003b, x), a
      008B9E 1E 61            [ 2]  366 	ldw	x, (0x61, sp)
      008BA0 A6 1A            [ 1]  367 	ld	a, #0x1a
      008BA2 E7 3C            [ 1]  368 	ld	(0x003c, x), a
      008BA4 1E 61            [ 2]  369 	ldw	x, (0x61, sp)
      008BA6 A6 2A            [ 1]  370 	ld	a, #0x2a
      008BA8 E7 3D            [ 1]  371 	ld	(0x003d, x), a
      008BAA 1E 61            [ 2]  372 	ldw	x, (0x61, sp)
      008BAC A6 44            [ 1]  373 	ld	a, #0x44
      008BAE E7 3E            [ 1]  374 	ld	(0x003e, x), a
      008BB0 1E 61            [ 2]  375 	ldw	x, (0x61, sp)
      008BB2 1C 00 3F         [ 2]  376 	addw	x, #0x003f
      008BB5 7F               [ 1]  377 	clr	(x)
      008BB6 1E 61            [ 2]  378 	ldw	x, (0x61, sp)
      008BB8 1C 00 40         [ 2]  379 	addw	x, #0x0040
      008BBB 7F               [ 1]  380 	clr	(x)
      008BBC 1E 61            [ 2]  381 	ldw	x, (0x61, sp)
      008BBE A6 7E            [ 1]  382 	ld	a, #0x7e
      008BC0 E7 41            [ 1]  383 	ld	(0x0041, x), a
      008BC2 1E 61            [ 2]  384 	ldw	x, (0x61, sp)
      008BC4 A6 7E            [ 1]  385 	ld	a, #0x7e
      008BC6 E7 42            [ 1]  386 	ld	(0x0042, x), a
      008BC8 1E 61            [ 2]  387 	ldw	x, (0x61, sp)
      008BCA A6 4A            [ 1]  388 	ld	a, #0x4a
      008BCC E7 43            [ 1]  389 	ld	(0x0043, x), a
      008BCE 1E 61            [ 2]  390 	ldw	x, (0x61, sp)
      008BD0 A6 4A            [ 1]  391 	ld	a, #0x4a
      008BD2 E7 44            [ 1]  392 	ld	(0x0044, x), a
      008BD4 1E 61            [ 2]  393 	ldw	x, (0x61, sp)
      008BD6 A6 4A            [ 1]  394 	ld	a, #0x4a
      008BD8 E7 45            [ 1]  395 	ld	(0x0045, x), a
      008BDA 1E 61            [ 2]  396 	ldw	x, (0x61, sp)
      008BDC A6 42            [ 1]  397 	ld	a, #0x42
      008BDE E7 46            [ 1]  398 	ld	(0x0046, x), a
      008BE0 1E 61            [ 2]  399 	ldw	x, (0x61, sp)
      008BE2 1C 00 47         [ 2]  400 	addw	x, #0x0047
      008BE5 7F               [ 1]  401 	clr	(x)
      008BE6 1E 61            [ 2]  402 	ldw	x, (0x61, sp)
      008BE8 1C 00 48         [ 2]  403 	addw	x, #0x0048
      008BEB 7F               [ 1]  404 	clr	(x)
      008BEC 1E 61            [ 2]  405 	ldw	x, (0x61, sp)
      008BEE A6 7E            [ 1]  406 	ld	a, #0x7e
      008BF0 E7 49            [ 1]  407 	ld	(0x0049, x), a
      008BF2 1E 61            [ 2]  408 	ldw	x, (0x61, sp)
      008BF4 A6 04            [ 1]  409 	ld	a, #0x04
      008BF6 E7 4A            [ 1]  410 	ld	(0x004a, x), a
      008BF8 1E 61            [ 2]  411 	ldw	x, (0x61, sp)
      008BFA A6 08            [ 1]  412 	ld	a, #0x08
      008BFC E7 4B            [ 1]  413 	ld	(0x004b, x), a
      008BFE 1E 61            [ 2]  414 	ldw	x, (0x61, sp)
      008C00 A6 10            [ 1]  415 	ld	a, #0x10
      008C02 E7 4C            [ 1]  416 	ld	(0x004c, x), a
      008C04 1E 61            [ 2]  417 	ldw	x, (0x61, sp)
      008C06 A6 20            [ 1]  418 	ld	a, #0x20
      008C08 E7 4D            [ 1]  419 	ld	(0x004d, x), a
      008C0A 1E 61            [ 2]  420 	ldw	x, (0x61, sp)
      008C0C A6 7E            [ 1]  421 	ld	a, #0x7e
      008C0E E7 4E            [ 1]  422 	ld	(0x004e, x), a
      008C10 1E 61            [ 2]  423 	ldw	x, (0x61, sp)
      008C12 1C 00 4F         [ 2]  424 	addw	x, #0x004f
      008C15 7F               [ 1]  425 	clr	(x)
      008C16 1E 61            [ 2]  426 	ldw	x, (0x61, sp)
      008C18 1C 00 50         [ 2]  427 	addw	x, #0x0050
      008C1B 7F               [ 1]  428 	clr	(x)
      008C1C 1E 61            [ 2]  429 	ldw	x, (0x61, sp)
      008C1E A6 7C            [ 1]  430 	ld	a, #0x7c
      008C20 E7 51            [ 1]  431 	ld	(0x0051, x), a
      008C22 1E 61            [ 2]  432 	ldw	x, (0x61, sp)
      008C24 A6 12            [ 1]  433 	ld	a, #0x12
      008C26 E7 52            [ 1]  434 	ld	(0x0052, x), a
      008C28 1E 61            [ 2]  435 	ldw	x, (0x61, sp)
      008C2A A6 12            [ 1]  436 	ld	a, #0x12
      008C2C E7 53            [ 1]  437 	ld	(0x0053, x), a
      008C2E 1E 61            [ 2]  438 	ldw	x, (0x61, sp)
      008C30 A6 12            [ 1]  439 	ld	a, #0x12
      008C32 E7 54            [ 1]  440 	ld	(0x0054, x), a
      008C34 1E 61            [ 2]  441 	ldw	x, (0x61, sp)
      008C36 A6 12            [ 1]  442 	ld	a, #0x12
      008C38 E7 55            [ 1]  443 	ld	(0x0055, x), a
      008C3A 1E 61            [ 2]  444 	ldw	x, (0x61, sp)
      008C3C A6 7C            [ 1]  445 	ld	a, #0x7c
      008C3E E7 56            [ 1]  446 	ld	(0x0056, x), a
      008C40 1E 61            [ 2]  447 	ldw	x, (0x61, sp)
      008C42 1C 00 57         [ 2]  448 	addw	x, #0x0057
      008C45 7F               [ 1]  449 	clr	(x)
      008C46 1E 61            [ 2]  450 	ldw	x, (0x61, sp)
      008C48 1C 00 58         [ 2]  451 	addw	x, #0x0058
      008C4B 7F               [ 1]  452 	clr	(x)
      008C4C 1E 61            [ 2]  453 	ldw	x, (0x61, sp)
      008C4E 1C 00 59         [ 2]  454 	addw	x, #0x0059
      008C51 7F               [ 1]  455 	clr	(x)
      008C52 1E 61            [ 2]  456 	ldw	x, (0x61, sp)
      008C54 1C 00 5A         [ 2]  457 	addw	x, #0x005a
      008C57 7F               [ 1]  458 	clr	(x)
      008C58 1E 61            [ 2]  459 	ldw	x, (0x61, sp)
      008C5A 1C 00 5B         [ 2]  460 	addw	x, #0x005b
      008C5D 7F               [ 1]  461 	clr	(x)
      008C5E 1E 61            [ 2]  462 	ldw	x, (0x61, sp)
      008C60 1C 00 5C         [ 2]  463 	addw	x, #0x005c
      008C63 7F               [ 1]  464 	clr	(x)
      008C64 1E 61            [ 2]  465 	ldw	x, (0x61, sp)
      008C66 1C 00 5D         [ 2]  466 	addw	x, #0x005d
      008C69 7F               [ 1]  467 	clr	(x)
      008C6A 1E 61            [ 2]  468 	ldw	x, (0x61, sp)
      008C6C 1C 00 5E         [ 2]  469 	addw	x, #0x005e
      008C6F 7F               [ 1]  470 	clr	(x)
      008C70 1E 61            [ 2]  471 	ldw	x, (0x61, sp)
      008C72 1C 00 5F         [ 2]  472 	addw	x, #0x005f
      008C75 7F               [ 1]  473 	clr	(x)
                                    474 ;	user/main.c: 80: CLK_Config();
      008C76 CD 91 08         [ 4]  475 	call	_CLK_Config
                                    476 ;	user/main.c: 83: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
      008C79 4B 04            [ 1]  477 	push	#0x04
      008C7B 4B 20            [ 1]  478 	push	#0x20
      008C7D 4B 10            [ 1]  479 	push	#0x10
      008C7F 4B 40            [ 1]  480 	push	#0x40
      008C81 4B 0A            [ 1]  481 	push	#0x0a
      008C83 4B 50            [ 1]  482 	push	#0x50
      008C85 CD 8C AE         [ 4]  483 	call	_MaxMatrix
      008C88 5B 06            [ 2]  484 	addw	sp, #6
                                    485 ;	user/main.c: 84: Init();
      008C8A CD 8D 94         [ 4]  486 	call	_Init
                                    487 ;	user/main.c: 85: Screen();
      008C8D CD 8E 04         [ 4]  488 	call	_Screen
                                    489 ;	user/main.c: 86: TEXT_Init();
      008C90 CD 80 A0         [ 4]  490 	call	_TEXT_Init
                                    491 ;	user/main.c: 87: TIMER_Init();
      008C93 CD 8F DC         [ 4]  492 	call	_TIMER_Init
                                    493 ;	user/main.c: 88: IWDG_Config();
      008C96 CD 8A 1E         [ 4]  494 	call	_IWDG_Config
                                    495 ;	user/main.c: 89: enableInterrupts();
      008C99 9A               [ 1]  496 	rim
                                    497 ;	user/main.c: 119: while(TRUE) 
      008C9A                        498 00102$:
                                    499 ;	user/main.c: 121: TEXT_Manage();
      008C9A CD 81 94         [ 4]  500 	call	_TEXT_Manage
      008C9D 20 FB            [ 2]  501 	jra	00102$
      008C9F 5B 62            [ 2]  502 	addw	sp, #98
      008CA1 81               [ 4]  503 	ret
                                    504 	.area CODE
                                    505 	.area INITIALIZER
                                    506 	.area CABS (ABS)
