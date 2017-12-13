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
      000075                         31 _timeGet::
      000075                         32 	.ds 2
      000077                         33 _timeBack::
      000077                         34 	.ds 2
      000079                         35 _timeTickMs::
      000079                         36 	.ds 4
      00007D                         37 _timeTickUs::
      00007D                         38 	.ds 1
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
      00891C                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 19: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      00891C 4B 01            [ 1]   69 	push	#0x01
      00891E 4B 04            [ 1]   70 	push	#0x04
      008920 CD 8A 99         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008923 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 20: TIM4_DeInit(); 
      008924 CD 8D F9         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008927 4B C8            [ 1]   76 	push	#0xc8
      008929 4B 04            [ 1]   77 	push	#0x04
      00892B CD 8E 12         [ 4]   78 	call	_TIM4_TimeBaseInit
      00892E 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 23: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      00892F 4B 01            [ 1]   81 	push	#0x01
      008931 CD 8E 42         [ 4]   82 	call	_TIM4_ClearFlag
      008934 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 24: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008935 4B 01            [ 1]   85 	push	#0x01
      008937 4B 01            [ 1]   86 	push	#0x01
      008939 CD 8E 24         [ 4]   87 	call	_TIM4_ITConfig
      00893C 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 25: TIM4_Cmd(ENABLE);    // Enable TIM4 
      00893D 4B 01            [ 1]   90 	push	#0x01
      00893F CD 8E 1F         [ 4]   91 	call	_TIM4_Cmd
      008942 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 26: timeTickMs = 0;
      008943 5F               [ 1]   94 	clrw	x
      008944 CF 00 7B         [ 2]   95 	ldw	_timeTickMs+2, x
      008947 CF 00 79         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 27: timeTickUs = 0;
      00894A 72 5F 00 7D      [ 1]   98 	clr	_timeTickUs+0
      00894E 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 30: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      00894F                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 32: timeTickUs++;
      00894F 72 5C 00 7D      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 33: if(timeTickUs%5 == 0){
      008953 5F               [ 1]  108 	clrw	x
      008954 C6 00 7D         [ 1]  109 	ld	a, _timeTickUs+0
      008957 97               [ 1]  110 	ld	xl, a
      008958 A6 05            [ 1]  111 	ld	a, #0x05
      00895A 62               [ 2]  112 	div	x, a
      00895B 4D               [ 1]  113 	tnz	a
      00895C 27 01            [ 1]  114 	jreq	00109$
      00895E 81               [ 4]  115 	ret
      00895F                        116 00109$:
                                    117 ;	user/timerTick.c: 34: timeTickMs++;
      00895F CE 00 7B         [ 2]  118 	ldw	x, _timeTickMs+2
      008962 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008965 C6 00 7A         [ 1]  120 	ld	a, _timeTickMs+1
      008968 A9 00            [ 1]  121 	adc	a, #0x00
      00896A 90 97            [ 1]  122 	ld	yl, a
      00896C C6 00 79         [ 1]  123 	ld	a, _timeTickMs+0
      00896F A9 00            [ 1]  124 	adc	a, #0x00
      008971 90 95            [ 1]  125 	ld	yh, a
      008973 CF 00 7B         [ 2]  126 	ldw	_timeTickMs+2, x
      008976 90 CF 00 79      [ 2]  127 	ldw	_timeTickMs+0, y
      00897A 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 38: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      00897B                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 40: pTime->timeMS = timeTickMs;
      00897B 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      00897D 5C               [ 2]  136 	incw	x
      00897E 5C               [ 2]  137 	incw	x
      00897F 90 CE 00 7B      [ 2]  138 	ldw	y, _timeTickMs+2
      008983 EF 02            [ 2]  139 	ldw	(0x2, x), y
      008985 90 CE 00 79      [ 2]  140 	ldw	y, _timeTickMs+0
      008989 FF               [ 2]  141 	ldw	(x), y
      00898A 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 43: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      00898B                        147 _TIMER_CheckTimeUS:
      00898B 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 45: timeGet = TIM4_GetCounter();
      00898D CD 8E 2F         [ 4]  150 	call	_TIM4_GetCounter
      008990 5F               [ 1]  151 	clrw	x
      008991 97               [ 1]  152 	ld	xl, a
      008992 CF 00 75         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 46: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008995 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008997 17 01            [ 2]  156 	ldw	(0x01, sp), y
      008999 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      00899B FE               [ 2]  158 	ldw	x, (x)
      00899C 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      00899E 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      0089A0 C3 00 75         [ 2]  161 	cpw	x, _timeGet+0
      0089A3 24 0A            [ 1]  162 	jrnc	00105$
      0089A5 CE 00 75         [ 2]  163 	ldw	x, _timeGet+0
      0089A8 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      0089AB 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      0089AD 24 14            [ 1]  166 	jrnc	00101$
      0089AF                        167 00105$:
      0089AF 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      0089B1 C3 00 75         [ 2]  169 	cpw	x, _timeGet+0
      0089B4 23 17            [ 2]  170 	jrule	00102$
      0089B6 CE 00 75         [ 2]  171 	ldw	x, _timeGet+0
      0089B9 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      0089BC 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      0089BF 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      0089C1 25 0A            [ 1]  175 	jrc	00102$
      0089C3                        176 00101$:
                                    177 ;	user/timerTick.c: 47: pTime->timeUS = timeGet;
      0089C3 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      0089C5 90 CE 00 75      [ 2]  179 	ldw	y, _timeGet+0
      0089C9 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 48: return 0;
      0089CA 4F               [ 1]  182 	clr	a
      0089CB 20 02            [ 2]  183 	jra	00106$
      0089CD                        184 00102$:
                                    185 ;	user/timerTick.c: 50: return 1;
      0089CD A6 01            [ 1]  186 	ld	a, #0x01
      0089CF                        187 00106$:
      0089CF 5B 04            [ 2]  188 	addw	sp, #4
      0089D1 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 53: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      0089D2                        194 _TIMER_CheckTimeMS:
      0089D2 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 55: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      0089D4 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      0089D6 5C               [ 2]  198 	incw	x
      0089D7 5C               [ 2]  199 	incw	x
      0089D8 1F 01            [ 2]  200 	ldw	(0x01, sp), x
      0089DA 1E 01            [ 2]  201 	ldw	x, (0x01, sp)
      0089DC E6 03            [ 1]  202 	ld	a, (0x3, x)
      0089DE 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      0089E0 E6 02            [ 1]  204 	ld	a, (0x2, x)
      0089E2 6B 09            [ 1]  205 	ld	(0x09, sp), a
      0089E4 FE               [ 2]  206 	ldw	x, (x)
      0089E5 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      0089E7 CE 00 7B         [ 2]  208 	ldw	x, _timeTickMs+2
      0089EA 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      0089ED C6 00 7A         [ 1]  210 	ld	a, _timeTickMs+1
      0089F0 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      0089F2 88               [ 1]  212 	push	a
      0089F3 C6 00 79         [ 1]  213 	ld	a, _timeTickMs+0
      0089F6 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      0089F8 6B 04            [ 1]  215 	ld	(0x04, sp), a
      0089FA 84               [ 1]  216 	pop	a
      0089FB 88               [ 1]  217 	push	a
      0089FC 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      0089FE 84               [ 1]  219 	pop	a
      0089FF 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008A01 7B 03            [ 1]  221 	ld	a, (0x03, sp)
      008A03 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008A05 4F               [ 1]  223 	clr	a
      008A06 49               [ 1]  224 	rlc	a
      008A07 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      008A09 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      008A0B C3 00 7B         [ 2]  227 	cpw	x, _timeTickMs+2
      008A0E 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      008A10 C2 00 7A         [ 1]  229 	sbc	a, _timeTickMs+1
      008A13 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      008A15 C2 00 79         [ 1]  231 	sbc	a, _timeTickMs+0
      008A18 24 04            [ 1]  232 	jrnc	00105$
      008A1A 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      008A1C 27 15            [ 1]  234 	jreq	00101$
      008A1E                        235 00105$:
      008A1E CE 00 7B         [ 2]  236 	ldw	x, _timeTickMs+2
      008A21 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      008A23 C6 00 7A         [ 1]  238 	ld	a, _timeTickMs+1
      008A26 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      008A28 C6 00 79         [ 1]  240 	ld	a, _timeTickMs+0
      008A2B 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      008A2D 24 14            [ 1]  242 	jrnc	00102$
      008A2F 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      008A31 26 10            [ 1]  244 	jrne	00102$
      008A33                        245 00101$:
                                    246 ;	user/timerTick.c: 56: pTime->timeMS = timeTickMs;
      008A33 1E 01            [ 2]  247 	ldw	x, (0x01, sp)
      008A35 90 CE 00 7B      [ 2]  248 	ldw	y, _timeTickMs+2
      008A39 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008A3B 90 CE 00 79      [ 2]  250 	ldw	y, _timeTickMs+0
      008A3F FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 57: return 0;
      008A40 4F               [ 1]  253 	clr	a
      008A41 20 02            [ 2]  254 	jra	00106$
      008A43                        255 00102$:
                                    256 ;	user/timerTick.c: 59: return 1;
      008A43 A6 01            [ 1]  257 	ld	a, #0x01
      008A45                        258 00106$:
      008A45 5B 0B            [ 2]  259 	addw	sp, #11
      008A47 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
