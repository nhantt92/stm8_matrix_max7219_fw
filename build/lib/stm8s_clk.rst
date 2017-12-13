                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HSIDivFactor
                                     12 	.globl _CLK_Config
                                     13 	.globl _CLK_PeripheralClockConfig
                                     14 	.globl _CLK_SYSCLKConfig
                                     15 	.globl _CLK_GetClockFreq
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/stm8s_clk.c: 15: void CLK_Config(void)
                                     45 ;	-----------------------------------------
                                     46 ;	 function CLK_Config
                                     47 ;	-----------------------------------------
      008A48                         48 _CLK_Config:
                                     49 ;	lib/stm8s_clk.c: 18: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008A48 35 01 50 C0      [ 1]   50 	mov	0x50c0+0, #0x01
                                     51 ;	lib/stm8s_clk.c: 19: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008A4C 35 00 50 C1      [ 1]   52 	mov	0x50c1+0, #0x00
                                     53 ;	lib/stm8s_clk.c: 20: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008A50 35 E1 50 C4      [ 1]   54 	mov	0x50c4+0, #0xe1
                                     55 ;	lib/stm8s_clk.c: 21: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008A54 35 00 50 C5      [ 1]   56 	mov	0x50c5+0, #0x00
                                     57 ;	lib/stm8s_clk.c: 22: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008A58 35 18 50 C6      [ 1]   58 	mov	0x50c6+0, #0x18
                                     59 ;	lib/stm8s_clk.c: 23: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008A5C 35 FF 50 C7      [ 1]   60 	mov	0x50c7+0, #0xff
                                     61 ;	lib/stm8s_clk.c: 24: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008A60 35 FF 50 CA      [ 1]   62 	mov	0x50ca+0, #0xff
                                     63 ;	lib/stm8s_clk.c: 25: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008A64 35 00 50 C8      [ 1]   64 	mov	0x50c8+0, #0x00
                                     65 ;	lib/stm8s_clk.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008A68 35 00 50 C9      [ 1]   66 	mov	0x50c9+0, #0x00
                                     67 ;	lib/stm8s_clk.c: 27: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008A6C                         68 00101$:
      008A6C AE 50 C9         [ 2]   69 	ldw	x, #0x50c9
      008A6F F6               [ 1]   70 	ld	a, (x)
      008A70 44               [ 1]   71 	srl	a
      008A71 25 F9            [ 1]   72 	jrc	00101$
                                     73 ;	lib/stm8s_clk.c: 29: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008A73 35 00 50 C9      [ 1]   74 	mov	0x50c9+0, #0x00
                                     75 ;	lib/stm8s_clk.c: 30: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008A77 35 00 50 CC      [ 1]   76 	mov	0x50cc+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 31: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008A7B 35 00 50 CD      [ 1]   78 	mov	0x50cd+0, #0x00
                                     79 ;	lib/stm8s_clk.c: 35: CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
      008A7F 72 10 50 C0      [ 1]   80 	bset	0x50c0, #0
                                     81 ;	lib/stm8s_clk.c: 42: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
      008A83 AE 50 C6         [ 2]   82 	ldw	x, #0x50c6
      008A86 F6               [ 1]   83 	ld	a, (x)
      008A87 A4 E7            [ 1]   84 	and	a, #0xe7
      008A89 F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/stm8s_clk.c: 43: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
      008A8A AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      008A8D F6               [ 1]   88 	ld	a, (x)
      008A8E AE 50 C6         [ 2]   89 	ldw	x, #0x50c6
      008A91 F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/stm8s_clk.c: 45: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
      008A92 4B 00            [ 1]   92 	push	#0x00
      008A94 CD 8A EF         [ 4]   93 	call	_CLK_SYSCLKConfig
      008A97 84               [ 1]   94 	pop	a
      008A98 81               [ 4]   95 	ret
                                     96 ;	lib/stm8s_clk.c: 48: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                     97 ;	-----------------------------------------
                                     98 ;	 function CLK_PeripheralClockConfig
                                     99 ;	-----------------------------------------
      008A99                        100 _CLK_PeripheralClockConfig:
      008A99 89               [ 2]  101 	pushw	x
                                    102 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008A9A 7B 05            [ 1]  103 	ld	a, (0x05, sp)
      008A9C A4 0F            [ 1]  104 	and	a, #0x0f
      008A9E 88               [ 1]  105 	push	a
      008A9F A6 01            [ 1]  106 	ld	a, #0x01
      008AA1 6B 03            [ 1]  107 	ld	(0x03, sp), a
      008AA3 84               [ 1]  108 	pop	a
      008AA4 4D               [ 1]  109 	tnz	a
      008AA5 27 05            [ 1]  110 	jreq	00125$
      008AA7                        111 00124$:
      008AA7 08 02            [ 1]  112 	sll	(0x02, sp)
      008AA9 4A               [ 1]  113 	dec	a
      008AAA 26 FB            [ 1]  114 	jrne	00124$
      008AAC                        115 00125$:
                                    116 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008AAC 7B 02            [ 1]  117 	ld	a, (0x02, sp)
      008AAE 43               [ 1]  118 	cpl	a
      008AAF 6B 01            [ 1]  119 	ld	(0x01, sp), a
                                    120 ;	lib/stm8s_clk.c: 50: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008AB1 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      008AB3 A5 10            [ 1]  122 	bcp	a, #0x10
      008AB5 26 1C            [ 1]  123 	jrne	00108$
                                    124 ;	lib/stm8s_clk.c: 52: if (NewState != DISABLE)
      008AB7 0D 06            [ 1]  125 	tnz	(0x06, sp)
      008AB9 27 0C            [ 1]  126 	jreq	00102$
                                    127 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008ABB AE 50 C7         [ 2]  128 	ldw	x, #0x50c7
      008ABE F6               [ 1]  129 	ld	a, (x)
      008ABF 1A 02            [ 1]  130 	or	a, (0x02, sp)
      008AC1 AE 50 C7         [ 2]  131 	ldw	x, #0x50c7
      008AC4 F7               [ 1]  132 	ld	(x), a
      008AC5 20 26            [ 2]  133 	jra	00110$
      008AC7                        134 00102$:
                                    135 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008AC7 AE 50 C7         [ 2]  136 	ldw	x, #0x50c7
      008ACA F6               [ 1]  137 	ld	a, (x)
      008ACB 14 01            [ 1]  138 	and	a, (0x01, sp)
      008ACD AE 50 C7         [ 2]  139 	ldw	x, #0x50c7
      008AD0 F7               [ 1]  140 	ld	(x), a
      008AD1 20 1A            [ 2]  141 	jra	00110$
      008AD3                        142 00108$:
                                    143 ;	lib/stm8s_clk.c: 65: if (NewState != DISABLE)
      008AD3 0D 06            [ 1]  144 	tnz	(0x06, sp)
      008AD5 27 0C            [ 1]  145 	jreq	00105$
                                    146 ;	lib/stm8s_clk.c: 68: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008AD7 AE 50 CA         [ 2]  147 	ldw	x, #0x50ca
      008ADA F6               [ 1]  148 	ld	a, (x)
      008ADB 1A 02            [ 1]  149 	or	a, (0x02, sp)
      008ADD AE 50 CA         [ 2]  150 	ldw	x, #0x50ca
      008AE0 F7               [ 1]  151 	ld	(x), a
      008AE1 20 0A            [ 2]  152 	jra	00110$
      008AE3                        153 00105$:
                                    154 ;	lib/stm8s_clk.c: 73: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008AE3 AE 50 CA         [ 2]  155 	ldw	x, #0x50ca
      008AE6 F6               [ 1]  156 	ld	a, (x)
      008AE7 14 01            [ 1]  157 	and	a, (0x01, sp)
      008AE9 AE 50 CA         [ 2]  158 	ldw	x, #0x50ca
      008AEC F7               [ 1]  159 	ld	(x), a
      008AED                        160 00110$:
      008AED 85               [ 2]  161 	popw	x
      008AEE 81               [ 4]  162 	ret
                                    163 ;	lib/stm8s_clk.c: 78: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    164 ;	-----------------------------------------
                                    165 ;	 function CLK_SYSCLKConfig
                                    166 ;	-----------------------------------------
      008AEF                        167 _CLK_SYSCLKConfig:
      008AEF 89               [ 2]  168 	pushw	x
                                    169 ;	lib/stm8s_clk.c: 80: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008AF0 0D 05            [ 1]  170 	tnz	(0x05, sp)
      008AF2 2B 19            [ 1]  171 	jrmi	00102$
                                    172 ;	lib/stm8s_clk.c: 82: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008AF4 AE 50 C6         [ 2]  173 	ldw	x, #0x50c6
      008AF7 F6               [ 1]  174 	ld	a, (x)
      008AF8 A4 E7            [ 1]  175 	and	a, #0xe7
      008AFA F7               [ 1]  176 	ld	(x), a
                                    177 ;	lib/stm8s_clk.c: 83: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008AFB AE 50 C6         [ 2]  178 	ldw	x, #0x50c6
      008AFE F6               [ 1]  179 	ld	a, (x)
      008AFF 6B 01            [ 1]  180 	ld	(0x01, sp), a
      008B01 7B 05            [ 1]  181 	ld	a, (0x05, sp)
      008B03 A4 18            [ 1]  182 	and	a, #0x18
      008B05 1A 01            [ 1]  183 	or	a, (0x01, sp)
      008B07 AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      008B0A F7               [ 1]  185 	ld	(x), a
      008B0B 20 17            [ 2]  186 	jra	00104$
      008B0D                        187 00102$:
                                    188 ;	lib/stm8s_clk.c: 87: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008B0D AE 50 C6         [ 2]  189 	ldw	x, #0x50c6
      008B10 F6               [ 1]  190 	ld	a, (x)
      008B11 A4 F8            [ 1]  191 	and	a, #0xf8
      008B13 F7               [ 1]  192 	ld	(x), a
                                    193 ;	lib/stm8s_clk.c: 88: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008B14 AE 50 C6         [ 2]  194 	ldw	x, #0x50c6
      008B17 F6               [ 1]  195 	ld	a, (x)
      008B18 6B 02            [ 1]  196 	ld	(0x02, sp), a
      008B1A 7B 05            [ 1]  197 	ld	a, (0x05, sp)
      008B1C A4 07            [ 1]  198 	and	a, #0x07
      008B1E 1A 02            [ 1]  199 	or	a, (0x02, sp)
      008B20 AE 50 C6         [ 2]  200 	ldw	x, #0x50c6
      008B23 F7               [ 1]  201 	ld	(x), a
      008B24                        202 00104$:
      008B24 85               [ 2]  203 	popw	x
      008B25 81               [ 4]  204 	ret
                                    205 ;	lib/stm8s_clk.c: 92: uint32_t CLK_GetClockFreq(void)
                                    206 ;	-----------------------------------------
                                    207 ;	 function CLK_GetClockFreq
                                    208 ;	-----------------------------------------
      008B26                        209 _CLK_GetClockFreq:
      008B26 52 07            [ 2]  210 	sub	sp, #7
                                    211 ;	lib/stm8s_clk.c: 99: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008B28 AE 50 C3         [ 2]  212 	ldw	x, #0x50c3
      008B2B F6               [ 1]  213 	ld	a, (x)
      008B2C 6B 01            [ 1]  214 	ld	(0x01, sp), a
                                    215 ;	lib/stm8s_clk.c: 100: if (clocksource == CLK_SOURCE_HSI)
      008B2E 7B 01            [ 1]  216 	ld	a, (0x01, sp)
      008B30 A1 E1            [ 1]  217 	cp	a, #0xe1
      008B32 26 2C            [ 1]  218 	jrne	00105$
                                    219 ;	lib/stm8s_clk.c: 102: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008B34 AE 50 C6         [ 2]  220 	ldw	x, #0x50c6
      008B37 F6               [ 1]  221 	ld	a, (x)
      008B38 A4 18            [ 1]  222 	and	a, #0x18
                                    223 ;	lib/stm8s_clk.c: 103: tmp = (uint8_t)(tmp >> 3);
      008B3A 44               [ 1]  224 	srl	a
      008B3B 44               [ 1]  225 	srl	a
      008B3C 44               [ 1]  226 	srl	a
                                    227 ;	lib/stm8s_clk.c: 104: presc = HSIDivFactor[tmp];
      008B3D AE 8B 7F         [ 2]  228 	ldw	x, #_HSIDivFactor+0
      008B40 1F 06            [ 2]  229 	ldw	(0x06, sp), x
      008B42 5F               [ 1]  230 	clrw	x
      008B43 97               [ 1]  231 	ld	xl, a
      008B44 72 FB 06         [ 2]  232 	addw	x, (0x06, sp)
      008B47 F6               [ 1]  233 	ld	a, (x)
                                    234 ;	lib/stm8s_clk.c: 105: clockfrequency = HSI_VALUE / presc;
      008B48 5F               [ 1]  235 	clrw	x
      008B49 97               [ 1]  236 	ld	xl, a
      008B4A 90 5F            [ 1]  237 	clrw	y
      008B4C 89               [ 2]  238 	pushw	x
      008B4D 90 89            [ 2]  239 	pushw	y
      008B4F 4B 00            [ 1]  240 	push	#0x00
      008B51 4B 24            [ 1]  241 	push	#0x24
      008B53 4B F4            [ 1]  242 	push	#0xf4
      008B55 4B 00            [ 1]  243 	push	#0x00
      008B57 CD 8E A5         [ 4]  244 	call	__divulong
      008B5A 5B 08            [ 2]  245 	addw	sp, #8
      008B5C 1F 04            [ 2]  246 	ldw	(0x04, sp), x
      008B5E 20 1A            [ 2]  247 	jra	00106$
      008B60                        248 00105$:
                                    249 ;	lib/stm8s_clk.c: 107: else if ( clocksource == CLK_SOURCE_LSI)
      008B60 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      008B62 A1 D2            [ 1]  251 	cp	a, #0xd2
      008B64 26 0B            [ 1]  252 	jrne	00102$
                                    253 ;	lib/stm8s_clk.c: 109: clockfrequency = LSI_VALUE;
      008B66 AE F4 00         [ 2]  254 	ldw	x, #0xf400
      008B69 1F 04            [ 2]  255 	ldw	(0x04, sp), x
      008B6B 90 AE 00 01      [ 2]  256 	ldw	y, #0x0001
      008B6F 20 09            [ 2]  257 	jra	00106$
      008B71                        258 00102$:
                                    259 ;	lib/stm8s_clk.c: 113: clockfrequency = HSE_VALUE;
      008B71 AE 24 00         [ 2]  260 	ldw	x, #0x2400
      008B74 1F 04            [ 2]  261 	ldw	(0x04, sp), x
      008B76 90 AE 00 F4      [ 2]  262 	ldw	y, #0x00f4
      008B7A                        263 00106$:
                                    264 ;	lib/stm8s_clk.c: 115: return((uint32_t)clockfrequency);
      008B7A 1E 04            [ 2]  265 	ldw	x, (0x04, sp)
      008B7C 5B 07            [ 2]  266 	addw	sp, #7
      008B7E 81               [ 4]  267 	ret
                                    268 	.area CODE
      008B7F                        269 _HSIDivFactor:
      008B7F 01                     270 	.db #0x01	; 1
      008B80 02                     271 	.db #0x02	; 2
      008B81 04                     272 	.db #0x04	; 4
      008B82 08                     273 	.db #0x08	; 8
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
