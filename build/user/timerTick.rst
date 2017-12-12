                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      00001F                         31 _timeGet::
      00001F                         32 	.ds 2
      000021                         33 _timeBack::
      000021                         34 	.ds 2
      000023                         35 _timeTickMs::
      000023                         36 	.ds 4
      000027                         37 _timeTickUs::
      000027                         38 	.ds 1
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
      0086C5                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 19: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      0086C5 4B 01            [ 1]   69 	push	#0x01
      0086C7 4B 04            [ 1]   70 	push	#0x04
      0086C9 CD 88 42         [ 4]   71 	call	_CLK_PeripheralClockConfig
      0086CC 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 20: TIM4_DeInit(); 
      0086CD CD 8B A2         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 22: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      0086D0 4B C8            [ 1]   76 	push	#0xc8
      0086D2 4B 04            [ 1]   77 	push	#0x04
      0086D4 CD 8B BB         [ 4]   78 	call	_TIM4_TimeBaseInit
      0086D7 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 23: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      0086D8 4B 01            [ 1]   81 	push	#0x01
      0086DA CD 8B EB         [ 4]   82 	call	_TIM4_ClearFlag
      0086DD 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 24: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      0086DE 4B 01            [ 1]   85 	push	#0x01
      0086E0 4B 01            [ 1]   86 	push	#0x01
      0086E2 CD 8B CD         [ 4]   87 	call	_TIM4_ITConfig
      0086E5 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 25: TIM4_Cmd(ENABLE);    // Enable TIM4 
      0086E6 4B 01            [ 1]   90 	push	#0x01
      0086E8 CD 8B C8         [ 4]   91 	call	_TIM4_Cmd
      0086EB 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 26: timeTickMs = 0;
      0086EC 5F               [ 1]   94 	clrw	x
      0086ED CF 00 25         [ 2]   95 	ldw	_timeTickMs+2, x
      0086F0 CF 00 23         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 27: timeTickUs = 0;
      0086F3 72 5F 00 27      [ 1]   98 	clr	_timeTickUs+0
      0086F7 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 30: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      0086F8                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 32: timeTickUs++;
      0086F8 72 5C 00 27      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 33: if(timeTickUs%5 == 0){
      0086FC 5F               [ 1]  108 	clrw	x
      0086FD C6 00 27         [ 1]  109 	ld	a, _timeTickUs+0
      008700 97               [ 1]  110 	ld	xl, a
      008701 A6 05            [ 1]  111 	ld	a, #0x05
      008703 62               [ 2]  112 	div	x, a
      008704 4D               [ 1]  113 	tnz	a
      008705 27 01            [ 1]  114 	jreq	00109$
      008707 81               [ 4]  115 	ret
      008708                        116 00109$:
                                    117 ;	user/timerTick.c: 34: timeTickMs++;
      008708 CE 00 25         [ 2]  118 	ldw	x, _timeTickMs+2
      00870B 1C 00 01         [ 2]  119 	addw	x, #0x0001
      00870E C6 00 24         [ 1]  120 	ld	a, _timeTickMs+1
      008711 A9 00            [ 1]  121 	adc	a, #0x00
      008713 90 97            [ 1]  122 	ld	yl, a
      008715 C6 00 23         [ 1]  123 	ld	a, _timeTickMs+0
      008718 A9 00            [ 1]  124 	adc	a, #0x00
      00871A 90 95            [ 1]  125 	ld	yh, a
      00871C CF 00 25         [ 2]  126 	ldw	_timeTickMs+2, x
      00871F 90 CF 00 23      [ 2]  127 	ldw	_timeTickMs+0, y
      008723 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 38: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008724                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 40: pTime->timeMS = timeTickMs;
      008724 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008726 5C               [ 2]  136 	incw	x
      008727 5C               [ 2]  137 	incw	x
      008728 90 CE 00 25      [ 2]  138 	ldw	y, _timeTickMs+2
      00872C EF 02            [ 2]  139 	ldw	(0x2, x), y
      00872E 90 CE 00 23      [ 2]  140 	ldw	y, _timeTickMs+0
      008732 FF               [ 2]  141 	ldw	(x), y
      008733 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 43: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008734                        147 _TIMER_CheckTimeUS:
      008734 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 45: timeGet = TIM4_GetCounter();
      008736 CD 8B D8         [ 4]  150 	call	_TIM4_GetCounter
      008739 5F               [ 1]  151 	clrw	x
      00873A 97               [ 1]  152 	ld	xl, a
      00873B CF 00 1F         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 46: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      00873E 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008740 17 01            [ 2]  156 	ldw	(0x01, sp), y
      008742 1E 01            [ 2]  157 	ldw	x, (0x01, sp)
      008744 FE               [ 2]  158 	ldw	x, (x)
      008745 1F 03            [ 2]  159 	ldw	(0x03, sp), x
      008747 1E 03            [ 2]  160 	ldw	x, (0x03, sp)
      008749 C3 00 1F         [ 2]  161 	cpw	x, _timeGet+0
      00874C 24 0A            [ 1]  162 	jrnc	00105$
      00874E CE 00 1F         [ 2]  163 	ldw	x, _timeGet+0
      008751 72 F0 03         [ 2]  164 	subw	x, (0x03, sp)
      008754 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008756 24 14            [ 1]  166 	jrnc	00101$
      008758                        167 00105$:
      008758 1E 03            [ 2]  168 	ldw	x, (0x03, sp)
      00875A C3 00 1F         [ 2]  169 	cpw	x, _timeGet+0
      00875D 23 17            [ 2]  170 	jrule	00102$
      00875F CE 00 1F         [ 2]  171 	ldw	x, _timeGet+0
      008762 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008765 72 F0 03         [ 2]  173 	subw	x, (0x03, sp)
      008768 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      00876A 25 0A            [ 1]  175 	jrc	00102$
      00876C                        176 00101$:
                                    177 ;	user/timerTick.c: 47: pTime->timeUS = timeGet;
      00876C 1E 01            [ 2]  178 	ldw	x, (0x01, sp)
      00876E 90 CE 00 1F      [ 2]  179 	ldw	y, _timeGet+0
      008772 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 48: return 0;
      008773 4F               [ 1]  182 	clr	a
      008774 20 02            [ 2]  183 	jra	00106$
      008776                        184 00102$:
                                    185 ;	user/timerTick.c: 50: return 1;
      008776 A6 01            [ 1]  186 	ld	a, #0x01
      008778                        187 00106$:
      008778 5B 04            [ 2]  188 	addw	sp, #4
      00877A 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 53: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      00877B                        194 _TIMER_CheckTimeMS:
      00877B 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 55: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      00877D 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      00877F 5C               [ 2]  198 	incw	x
      008780 5C               [ 2]  199 	incw	x
      008781 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      008783 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      008785 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008787 6B 09            [ 1]  203 	ld	(0x09, sp), a
      008789 E6 02            [ 1]  204 	ld	a, (0x2, x)
      00878B 6B 08            [ 1]  205 	ld	(0x08, sp), a
      00878D FE               [ 2]  206 	ldw	x, (x)
      00878E 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008790 CE 00 25         [ 2]  208 	ldw	x, _timeTickMs+2
      008793 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      008796 C6 00 24         [ 1]  210 	ld	a, _timeTickMs+1
      008799 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      00879B 88               [ 1]  212 	push	a
      00879C C6 00 23         [ 1]  213 	ld	a, _timeTickMs+0
      00879F 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      0087A1 6B 03            [ 1]  215 	ld	(0x03, sp), a
      0087A3 84               [ 1]  216 	pop	a
      0087A4 88               [ 1]  217 	push	a
      0087A5 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      0087A7 84               [ 1]  219 	pop	a
      0087A8 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      0087AA 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      0087AC 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      0087AE 4F               [ 1]  223 	clr	a
      0087AF 49               [ 1]  224 	rlc	a
      0087B0 6B 01            [ 1]  225 	ld	(0x01, sp), a
      0087B2 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      0087B4 C3 00 25         [ 2]  227 	cpw	x, _timeTickMs+2
      0087B7 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      0087B9 C2 00 24         [ 1]  229 	sbc	a, _timeTickMs+1
      0087BC 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      0087BE C2 00 23         [ 1]  231 	sbc	a, _timeTickMs+0
      0087C1 24 04            [ 1]  232 	jrnc	00105$
      0087C3 0D 01            [ 1]  233 	tnz	(0x01, sp)
      0087C5 27 15            [ 1]  234 	jreq	00101$
      0087C7                        235 00105$:
      0087C7 CE 00 25         [ 2]  236 	ldw	x, _timeTickMs+2
      0087CA 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      0087CC C6 00 24         [ 1]  238 	ld	a, _timeTickMs+1
      0087CF 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      0087D1 C6 00 23         [ 1]  240 	ld	a, _timeTickMs+0
      0087D4 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      0087D6 24 14            [ 1]  242 	jrnc	00102$
      0087D8 0D 01            [ 1]  243 	tnz	(0x01, sp)
      0087DA 26 10            [ 1]  244 	jrne	00102$
      0087DC                        245 00101$:
                                    246 ;	user/timerTick.c: 56: pTime->timeMS = timeTickMs;
      0087DC 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      0087DE 90 CE 00 25      [ 2]  248 	ldw	y, _timeTickMs+2
      0087E2 EF 02            [ 2]  249 	ldw	(0x2, x), y
      0087E4 90 CE 00 23      [ 2]  250 	ldw	y, _timeTickMs+0
      0087E8 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 57: return 0;
      0087E9 4F               [ 1]  253 	clr	a
      0087EA 20 02            [ 2]  254 	jra	00106$
      0087EC                        255 00102$:
                                    256 ;	user/timerTick.c: 59: return 1;
      0087EC A6 01            [ 1]  257 	ld	a, #0x01
      0087EE                        258 00106$:
      0087EE 5B 0B            [ 2]  259 	addw	sp, #11
      0087F0 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
