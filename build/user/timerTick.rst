                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000057                         31 _timeGet::
      000057                         32 	.ds 2
      000059                         33 _timeBack::
      000059                         34 	.ds 2
      00005B                         35 _timeTickMs::
      00005B                         36 	.ds 4
      00005F                         37 _timeTickUs::
      00005F                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 17: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008B87                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 19: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008B87 4B 01            [ 1]   69 	push	#0x01
      008B89 4B 04            [ 1]   70 	push	#0x04
      008B8B CD 8D 04         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008B8E 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 20: TIM4_DeInit(); 
      008B8F CD 90 64         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008B92 4B C8            [ 1]   76 	push	#0xc8
      008B94 4B 04            [ 1]   77 	push	#0x04
      008B96 CD 90 7D         [ 4]   78 	call	_TIM4_TimeBaseInit
      008B99 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 23: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008B9A 4B 01            [ 1]   81 	push	#0x01
      008B9C CD 90 AD         [ 4]   82 	call	_TIM4_ClearFlag
      008B9F 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 24: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008BA0 4B 01            [ 1]   85 	push	#0x01
      008BA2 4B 01            [ 1]   86 	push	#0x01
      008BA4 CD 90 8F         [ 4]   87 	call	_TIM4_ITConfig
      008BA7 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 25: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008BA8 4B 01            [ 1]   90 	push	#0x01
      008BAA CD 90 8A         [ 4]   91 	call	_TIM4_Cmd
      008BAD 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 26: timeTickMs = 0;
      008BAE 5F               [ 1]   94 	clrw	x
      008BAF CF 00 5D         [ 2]   95 	ldw	_timeTickMs+2, x
      008BB2 CF 00 5B         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 27: timeTickUs = 0;
      008BB5 72 5F 00 5F      [ 1]   98 	clr	_timeTickUs+0
      008BB9 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 30: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008BBA                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 32: timeTickUs++;
      008BBA 72 5C 00 5F      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 33: if(timeTickUs%5 == 0){
      008BBE 5F               [ 1]  108 	clrw	x
      008BBF C6 00 5F         [ 1]  109 	ld	a, _timeTickUs+0
      008BC2 97               [ 1]  110 	ld	xl, a
      008BC3 A6 05            [ 1]  111 	ld	a, #0x05
      008BC5 62               [ 2]  112 	div	x, a
      008BC6 4D               [ 1]  113 	tnz	a
      008BC7 27 01            [ 1]  114 	jreq	00109$
      008BC9 81               [ 4]  115 	ret
      008BCA                        116 00109$:
                                    117 ;	user/timerTick.c: 34: timeTickMs++;
      008BCA CE 00 5D         [ 2]  118 	ldw	x, _timeTickMs+2
      008BCD 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008BD0 C6 00 5C         [ 1]  120 	ld	a, _timeTickMs+1
      008BD3 A9 00            [ 1]  121 	adc	a, #0x00
      008BD5 90 97            [ 1]  122 	ld	yl, a
      008BD7 C6 00 5B         [ 1]  123 	ld	a, _timeTickMs+0
      008BDA A9 00            [ 1]  124 	adc	a, #0x00
      008BDC 90 95            [ 1]  125 	ld	yh, a
      008BDE CF 00 5D         [ 2]  126 	ldw	_timeTickMs+2, x
      008BE1 90 CF 00 5B      [ 2]  127 	ldw	_timeTickMs+0, y
      008BE5 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 38: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008BE6                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 40: pTime->timeMS = timeTickMs;
      008BE6 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008BE8 5C               [ 2]  136 	incw	x
      008BE9 5C               [ 2]  137 	incw	x
      008BEA 90 CE 00 5D      [ 2]  138 	ldw	y, _timeTickMs+2
      008BEE EF 02            [ 2]  139 	ldw	(0x2, x), y
      008BF0 90 CE 00 5B      [ 2]  140 	ldw	y, _timeTickMs+0
      008BF4 FF               [ 2]  141 	ldw	(x), y
      008BF5 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 43: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008BF6                        147 _TIMER_CheckTimeUS:
      008BF6 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 45: timeGet = TIM4_GetCounter();
      008BF8 CD 90 9A         [ 4]  150 	call	_TIM4_GetCounter
      008BFB 5F               [ 1]  151 	clrw	x
      008BFC 97               [ 1]  152 	ld	xl, a
      008BFD CF 00 57         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 46: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008C00 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008C02 17 01            [ 2]  156 	ldw	(0x01, sp), y
      008C04 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      008C06 FE               [ 2]  158 	ldw	x, (x)
      008C07 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      008C09 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      008C0B C3 00 57         [ 2]  161 	cpw	x, _timeGet+0
      008C0E 24 0A            [ 1]  162 	jrnc	00105$
      008C10 CE 00 57         [ 2]  163 	ldw	x, _timeGet+0
      008C13 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      008C16 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008C18 24 14            [ 1]  166 	jrnc	00101$
      008C1A                        167 00105$:
      008C1A 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      008C1C C3 00 57         [ 2]  169 	cpw	x, _timeGet+0
      008C1F 23 17            [ 2]  170 	jrule	00102$
      008C21 CE 00 57         [ 2]  171 	ldw	x, _timeGet+0
      008C24 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008C27 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      008C2A 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008C2C 25 0A            [ 1]  175 	jrc	00102$
      008C2E                        176 00101$:
                                    177 ;	user/timerTick.c: 47: pTime->timeUS = timeGet;
      008C2E 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      008C30 90 CE 00 57      [ 2]  179 	ldw	y, _timeGet+0
      008C34 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 48: return 0;
      008C35 4F               [ 1]  182 	clr	a
      008C36 20 02            [ 2]  183 	jra	00106$
      008C38                        184 00102$:
                                    185 ;	user/timerTick.c: 50: return 1;
      008C38 A6 01            [ 1]  186 	ld	a, #0x01
      008C3A                        187 00106$:
      008C3A 5B 04            [ 2]  188 	addw	sp, #4
      008C3C 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 53: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008C3D                        194 _TIMER_CheckTimeMS:
      008C3D 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 55: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008C3F 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008C41 5C               [ 2]  198 	incw	x
      008C42 5C               [ 2]  199 	incw	x
      008C43 1F 01            [ 2]  200 	ldw	(0x01, sp), x
      008C45 1E 01            [ 2]  201 	ldw	x, (0x01, sp)
      008C47 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008C49 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      008C4B E6 02            [ 1]  204 	ld	a, (0x2, x)
      008C4D 6B 09            [ 1]  205 	ld	(0x09, sp), a
      008C4F FE               [ 2]  206 	ldw	x, (x)
      008C50 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      008C52 CE 00 5D         [ 2]  208 	ldw	x, _timeTickMs+2
      008C55 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      008C58 C6 00 5C         [ 1]  210 	ld	a, _timeTickMs+1
      008C5B 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      008C5D 88               [ 1]  212 	push	a
      008C5E C6 00 5B         [ 1]  213 	ld	a, _timeTickMs+0
      008C61 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      008C63 6B 04            [ 1]  215 	ld	(0x04, sp), a
      008C65 84               [ 1]  216 	pop	a
      008C66 88               [ 1]  217 	push	a
      008C67 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008C69 84               [ 1]  219 	pop	a
      008C6A 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008C6C 7B 03            [ 1]  221 	ld	a, (0x03, sp)
      008C6E 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008C70 4F               [ 1]  223 	clr	a
      008C71 49               [ 1]  224 	rlc	a
      008C72 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      008C74 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      008C76 C3 00 5D         [ 2]  227 	cpw	x, _timeTickMs+2
      008C79 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      008C7B C2 00 5C         [ 1]  229 	sbc	a, _timeTickMs+1
      008C7E 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      008C80 C2 00 5B         [ 1]  231 	sbc	a, _timeTickMs+0
      008C83 24 04            [ 1]  232 	jrnc	00105$
      008C85 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      008C87 27 15            [ 1]  234 	jreq	00101$
      008C89                        235 00105$:
      008C89 CE 00 5D         [ 2]  236 	ldw	x, _timeTickMs+2
      008C8C 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      008C8E C6 00 5C         [ 1]  238 	ld	a, _timeTickMs+1
      008C91 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      008C93 C6 00 5B         [ 1]  240 	ld	a, _timeTickMs+0
      008C96 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      008C98 24 14            [ 1]  242 	jrnc	00102$
      008C9A 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      008C9C 26 10            [ 1]  244 	jrne	00102$
      008C9E                        245 00101$:
                                    246 ;	user/timerTick.c: 56: pTime->timeMS = timeTickMs;
      008C9E 1E 01            [ 2]  247 	ldw	x, (0x01, sp)
      008CA0 90 CE 00 5D      [ 2]  248 	ldw	y, _timeTickMs+2
      008CA4 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008CA6 90 CE 00 5B      [ 2]  250 	ldw	y, _timeTickMs+0
      008CAA FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 57: return 0;
      008CAB 4F               [ 1]  253 	clr	a
      008CAC 20 02            [ 2]  254 	jra	00106$
      008CAE                        255 00102$:
                                    256 ;	user/timerTick.c: 59: return 1;
      008CAE A6 01            [ 1]  257 	ld	a, #0x01
      008CB0                        258 00106$:
      008CB0 5B 0B            [ 2]  259 	addw	sp, #11
      008CB2 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
