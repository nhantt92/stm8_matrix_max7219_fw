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
      000129                         31 _timeGet::
      000129                         32 	.ds 2
      00012B                         33 _timeBack::
      00012B                         34 	.ds 2
      00012D                         35 _timeTickMs::
      00012D                         36 	.ds 4
      000131                         37 _timeTickUs::
      000131                         38 	.ds 1
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
                                     63 ;	user/timerTick.c: 18: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008FDC                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008FDC 4B 01            [ 1]   69 	push	#0x01
      008FDE 4B 04            [ 1]   70 	push	#0x04
      008FE0 CD 91 59         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008FE3 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008FE4 CD 94 B9         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008FE7 4B C8            [ 1]   76 	push	#0xc8
      008FE9 4B 04            [ 1]   77 	push	#0x04
      008FEB CD 94 D2         [ 4]   78 	call	_TIM4_TimeBaseInit
      008FEE 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008FEF 4B 01            [ 1]   81 	push	#0x01
      008FF1 CD 95 02         [ 4]   82 	call	_TIM4_ClearFlag
      008FF4 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008FF5 4B 01            [ 1]   85 	push	#0x01
      008FF7 4B 01            [ 1]   86 	push	#0x01
      008FF9 CD 94 E4         [ 4]   87 	call	_TIM4_ITConfig
      008FFC 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008FFD 4B 01            [ 1]   90 	push	#0x01
      008FFF CD 94 DF         [ 4]   91 	call	_TIM4_Cmd
      009002 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      009003 5F               [ 1]   94 	clrw	x
      009004 CF 01 2F         [ 2]   95 	ldw	_timeTickMs+2, x
      009007 CF 01 2D         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      00900A 72 5F 01 31      [ 1]   98 	clr	_timeTickUs+0
      00900E 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      00900F                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      00900F 72 5C 01 31      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      009013 5F               [ 1]  108 	clrw	x
      009014 C6 01 31         [ 1]  109 	ld	a, _timeTickUs+0
      009017 97               [ 1]  110 	ld	xl, a
      009018 A6 05            [ 1]  111 	ld	a, #0x05
      00901A 62               [ 2]  112 	div	x, a
      00901B 4D               [ 1]  113 	tnz	a
      00901C 27 01            [ 1]  114 	jreq	00109$
      00901E 81               [ 4]  115 	ret
      00901F                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      00901F CE 01 2F         [ 2]  118 	ldw	x, _timeTickMs+2
      009022 1C 00 01         [ 2]  119 	addw	x, #0x0001
      009025 C6 01 2E         [ 1]  120 	ld	a, _timeTickMs+1
      009028 A9 00            [ 1]  121 	adc	a, #0x00
      00902A 90 97            [ 1]  122 	ld	yl, a
      00902C C6 01 2D         [ 1]  123 	ld	a, _timeTickMs+0
      00902F A9 00            [ 1]  124 	adc	a, #0x00
      009031 90 95            [ 1]  125 	ld	yh, a
      009033 CF 01 2F         [ 2]  126 	ldw	_timeTickMs+2, x
      009036 90 CF 01 2D      [ 2]  127 	ldw	_timeTickMs+0, y
      00903A 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      00903B                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      00903B 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      00903D 5C               [ 2]  136 	incw	x
      00903E 5C               [ 2]  137 	incw	x
      00903F 90 CE 01 2F      [ 2]  138 	ldw	y, _timeTickMs+2
      009043 EF 02            [ 2]  139 	ldw	(0x2, x), y
      009045 90 CE 01 2D      [ 2]  140 	ldw	y, _timeTickMs+0
      009049 FF               [ 2]  141 	ldw	(x), y
      00904A 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      00904B                        147 _TIMER_CheckTimeUS:
      00904B 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      00904D CD 94 EF         [ 4]  150 	call	_TIM4_GetCounter
      009050 5F               [ 1]  151 	clrw	x
      009051 97               [ 1]  152 	ld	xl, a
      009052 CF 01 29         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      009055 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      009057 17 03            [ 2]  156 	ldw	(0x03, sp), y
      009059 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      00905B FE               [ 2]  158 	ldw	x, (x)
      00905C 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      00905E 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      009060 C3 01 29         [ 2]  161 	cpw	x, _timeGet+0
      009063 24 0A            [ 1]  162 	jrnc	00105$
      009065 CE 01 29         [ 2]  163 	ldw	x, _timeGet+0
      009068 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      00906B 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      00906D 24 14            [ 1]  166 	jrnc	00101$
      00906F                        167 00105$:
      00906F 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      009071 C3 01 29         [ 2]  169 	cpw	x, _timeGet+0
      009074 23 17            [ 2]  170 	jrule	00102$
      009076 CE 01 29         [ 2]  171 	ldw	x, _timeGet+0
      009079 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      00907C 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      00907F 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      009081 25 0A            [ 1]  175 	jrc	00102$
      009083                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      009083 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      009085 90 CE 01 29      [ 2]  179 	ldw	y, _timeGet+0
      009089 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      00908A 4F               [ 1]  182 	clr	a
      00908B 20 02            [ 2]  183 	jra	00106$
      00908D                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      00908D A6 01            [ 1]  186 	ld	a, #0x01
      00908F                        187 00106$:
      00908F 5B 04            [ 2]  188 	addw	sp, #4
      009091 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      009092                        194 _TIMER_CheckTimeMS:
      009092 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      009094 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      009096 5C               [ 2]  198 	incw	x
      009097 5C               [ 2]  199 	incw	x
      009098 1F 05            [ 2]  200 	ldw	(0x05, sp), x
      00909A 1E 05            [ 2]  201 	ldw	x, (0x05, sp)
      00909C E6 03            [ 1]  202 	ld	a, (0x3, x)
      00909E 6B 0A            [ 1]  203 	ld	(0x0a, sp), a
      0090A0 E6 02            [ 1]  204 	ld	a, (0x2, x)
      0090A2 6B 09            [ 1]  205 	ld	(0x09, sp), a
      0090A4 FE               [ 2]  206 	ldw	x, (x)
      0090A5 1F 07            [ 2]  207 	ldw	(0x07, sp), x
      0090A7 CE 01 2F         [ 2]  208 	ldw	x, _timeTickMs+2
      0090AA 72 F0 09         [ 2]  209 	subw	x, (0x09, sp)
      0090AD C6 01 2E         [ 1]  210 	ld	a, _timeTickMs+1
      0090B0 12 08            [ 1]  211 	sbc	a, (0x08, sp)
      0090B2 88               [ 1]  212 	push	a
      0090B3 C6 01 2D         [ 1]  213 	ld	a, _timeTickMs+0
      0090B6 12 08            [ 1]  214 	sbc	a, (0x08, sp)
      0090B8 6B 02            [ 1]  215 	ld	(0x02, sp), a
      0090BA 84               [ 1]  216 	pop	a
      0090BB 88               [ 1]  217 	push	a
      0090BC 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      0090BE 84               [ 1]  219 	pop	a
      0090BF 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      0090C1 7B 01            [ 1]  221 	ld	a, (0x01, sp)
      0090C3 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      0090C5 4F               [ 1]  223 	clr	a
      0090C6 49               [ 1]  224 	rlc	a
      0090C7 6B 0B            [ 1]  225 	ld	(0x0b, sp), a
      0090C9 1E 09            [ 2]  226 	ldw	x, (0x09, sp)
      0090CB C3 01 2F         [ 2]  227 	cpw	x, _timeTickMs+2
      0090CE 7B 08            [ 1]  228 	ld	a, (0x08, sp)
      0090D0 C2 01 2E         [ 1]  229 	sbc	a, _timeTickMs+1
      0090D3 7B 07            [ 1]  230 	ld	a, (0x07, sp)
      0090D5 C2 01 2D         [ 1]  231 	sbc	a, _timeTickMs+0
      0090D8 24 04            [ 1]  232 	jrnc	00105$
      0090DA 0D 0B            [ 1]  233 	tnz	(0x0b, sp)
      0090DC 27 15            [ 1]  234 	jreq	00101$
      0090DE                        235 00105$:
      0090DE CE 01 2F         [ 2]  236 	ldw	x, _timeTickMs+2
      0090E1 13 09            [ 2]  237 	cpw	x, (0x09, sp)
      0090E3 C6 01 2E         [ 1]  238 	ld	a, _timeTickMs+1
      0090E6 12 08            [ 1]  239 	sbc	a, (0x08, sp)
      0090E8 C6 01 2D         [ 1]  240 	ld	a, _timeTickMs+0
      0090EB 12 07            [ 1]  241 	sbc	a, (0x07, sp)
      0090ED 24 14            [ 1]  242 	jrnc	00102$
      0090EF 0D 0B            [ 1]  243 	tnz	(0x0b, sp)
      0090F1 26 10            [ 1]  244 	jrne	00102$
      0090F3                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      0090F3 1E 05            [ 2]  247 	ldw	x, (0x05, sp)
      0090F5 90 CE 01 2F      [ 2]  248 	ldw	y, _timeTickMs+2
      0090F9 EF 02            [ 2]  249 	ldw	(0x2, x), y
      0090FB 90 CE 01 2D      [ 2]  250 	ldw	y, _timeTickMs+0
      0090FF FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      009100 4F               [ 1]  253 	clr	a
      009101 20 02            [ 2]  254 	jra	00106$
      009103                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      009103 A6 01            [ 1]  257 	ld	a, #0x01
      009105                        258 00106$:
      009105 5B 0B            [ 2]  259 	addw	sp, #11
      009107 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
