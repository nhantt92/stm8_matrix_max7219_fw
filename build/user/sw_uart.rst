                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module sw_uart
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _delaytest
                                     12 	.globl _Vcomdelay
                                     13 	.globl _GPIO_WriteLow
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_Init
                                     16 	.globl _sprintf
                                     17 	.globl _DELAYTIME
                                     18 	.globl _vcomstr
                                     19 	.globl _VCOM_Init
                                     20 	.globl _VCOM_puts
                                     21 	.globl _VCOM_TestSpeed
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
      000057                         26 _vcomstr::
      000057                         27 	.ds 30
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
      00087E                         32 _DELAYTIME::
      00087E                         33 	.ds 2
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 ;--------------------------------------------------------
                                     39 ; global & static initialisations
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
                                     42 	.area GSINIT
                                     43 	.area GSFINAL
                                     44 	.area GSINIT
                                     45 ;--------------------------------------------------------
                                     46 ; Home
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area HOME
                                     50 ;--------------------------------------------------------
                                     51 ; code
                                     52 ;--------------------------------------------------------
                                     53 	.area CODE
                                     54 ;	user/sw_uart.c: 15: void Vcomdelay(int dtime)
                                     55 ;	-----------------------------------------
                                     56 ;	 function Vcomdelay
                                     57 ;	-----------------------------------------
      0086A8                         58 _Vcomdelay:
      0086A8 1E 03            [ 2]   59 	ldw	x, (0x03, sp)
      0086AA                         60 00103$:
                                     61 ;	user/sw_uart.c: 18: for ( ; dtime >= 0; dtime--);
      0086AA 5D               [ 2]   62 	tnzw	x
      0086AB 2A 01            [ 1]   63 	jrpl	00116$
      0086AD 81               [ 4]   64 	ret
      0086AE                         65 00116$:
      0086AE 5A               [ 2]   66 	decw	x
      0086AF 20 F9            [ 2]   67 	jra	00103$
      0086B1 81               [ 4]   68 	ret
                                     69 ;	user/sw_uart.c: 21: void VCOM_Init(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function VCOM_Init
                                     72 ;	-----------------------------------------
      0086B2                         73 _VCOM_Init:
                                     74 ;	user/sw_uart.c: 23: GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0086B2 4B F0            [ 1]   75 	push	#0xf0
      0086B4 4B 20            [ 1]   76 	push	#0x20
      0086B6 4B 0F            [ 1]   77 	push	#0x0f
      0086B8 4B 50            [ 1]   78 	push	#0x50
      0086BA CD 8B 99         [ 4]   79 	call	_GPIO_Init
      0086BD 5B 04            [ 2]   80 	addw	sp, #4
                                     81 ;	user/sw_uart.c: 24: vTx_H();
      0086BF 4B 20            [ 1]   82 	push	#0x20
      0086C1 4B 0F            [ 1]   83 	push	#0x0f
      0086C3 4B 50            [ 1]   84 	push	#0x50
      0086C5 CD 8C 2D         [ 4]   85 	call	_GPIO_WriteHigh
      0086C8 5B 03            [ 2]   86 	addw	sp, #3
      0086CA 81               [ 4]   87 	ret
                                     88 ;	user/sw_uart.c: 28: void VCOM_puts(char *str)
                                     89 ;	-----------------------------------------
                                     90 ;	 function VCOM_puts
                                     91 ;	-----------------------------------------
      0086CB                         92 _VCOM_puts:
      0086CB 52 05            [ 2]   93 	sub	sp, #5
                                     94 ;	user/sw_uart.c: 32: disableInterrupts();
      0086CD 9B               [ 1]   95 	sim
                                     96 ;	user/sw_uart.c: 33: while ((c=*str) && maxlen--)
      0086CE AE 00 FF         [ 2]   97 	ldw	x, #0x00ff
      0086D1 1F 02            [ 2]   98 	ldw	(0x02, sp), x
      0086D3 16 08            [ 2]   99 	ldw	y, (0x08, sp)
      0086D5 17 04            [ 2]  100 	ldw	(0x04, sp), y
      0086D7                        101 00126$:
      0086D7 1E 04            [ 2]  102 	ldw	x, (0x04, sp)
      0086D9 F6               [ 1]  103 	ld	a, (x)
      0086DA 6B 01            [ 1]  104 	ld	(0x01, sp), a
      0086DC 4D               [ 1]  105 	tnz	a
      0086DD 26 03            [ 1]  106 	jrne	00176$
      0086DF CC 88 4C         [ 2]  107 	jp	00128$
      0086E2                        108 00176$:
      0086E2 1E 02            [ 2]  109 	ldw	x, (0x02, sp)
      0086E4 16 02            [ 2]  110 	ldw	y, (0x02, sp)
      0086E6 90 5A            [ 2]  111 	decw	y
      0086E8 17 02            [ 2]  112 	ldw	(0x02, sp), y
      0086EA 5D               [ 2]  113 	tnzw	x
      0086EB 26 03            [ 1]  114 	jrne	00177$
      0086ED CC 88 4C         [ 2]  115 	jp	00128$
      0086F0                        116 00177$:
                                    117 ;	user/sw_uart.c: 35: vTx_L();                                              // start bit
      0086F0 4B 20            [ 1]  118 	push	#0x20
      0086F2 4B 0F            [ 1]  119 	push	#0x0f
      0086F4 4B 50            [ 1]  120 	push	#0x50
      0086F6 CD 8C 34         [ 4]  121 	call	_GPIO_WriteLow
      0086F9 5B 03            [ 2]  122 	addw	sp, #3
                                    123 ;	user/sw_uart.c: 36: Vcomdelay(DELAYTIME);          
      0086FB CE 08 7E         [ 2]  124 	ldw	x, _DELAYTIME+0
      0086FE 89               [ 2]  125 	pushw	x
      0086FF CD 86 A8         [ 4]  126 	call	_Vcomdelay
      008702 85               [ 2]  127 	popw	x
                                    128 ;	user/sw_uart.c: 37: if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
      008703 7B 01            [ 1]  129 	ld	a, (0x01, sp)
      008705 44               [ 1]  130 	srl	a
      008706 24 0D            [ 1]  131 	jrnc	00102$
      008708 4B 20            [ 1]  132 	push	#0x20
      00870A 4B 0F            [ 1]  133 	push	#0x0f
      00870C 4B 50            [ 1]  134 	push	#0x50
      00870E CD 8C 2D         [ 4]  135 	call	_GPIO_WriteHigh
      008711 5B 03            [ 2]  136 	addw	sp, #3
      008713 20 0B            [ 2]  137 	jra	00103$
      008715                        138 00102$:
      008715 4B 20            [ 1]  139 	push	#0x20
      008717 4B 0F            [ 1]  140 	push	#0x0f
      008719 4B 50            [ 1]  141 	push	#0x50
      00871B CD 8C 34         [ 4]  142 	call	_GPIO_WriteLow
      00871E 5B 03            [ 2]  143 	addw	sp, #3
      008720                        144 00103$:
      008720 CE 08 7E         [ 2]  145 	ldw	x, _DELAYTIME+0
      008723 89               [ 2]  146 	pushw	x
      008724 CD 86 A8         [ 4]  147 	call	_Vcomdelay
      008727 85               [ 2]  148 	popw	x
                                    149 ;	user/sw_uart.c: 38: if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008728 7B 01            [ 1]  150 	ld	a, (0x01, sp)
      00872A A5 02            [ 1]  151 	bcp	a, #0x02
      00872C 27 0D            [ 1]  152 	jreq	00105$
      00872E 4B 20            [ 1]  153 	push	#0x20
      008730 4B 0F            [ 1]  154 	push	#0x0f
      008732 4B 50            [ 1]  155 	push	#0x50
      008734 CD 8C 2D         [ 4]  156 	call	_GPIO_WriteHigh
      008737 5B 03            [ 2]  157 	addw	sp, #3
      008739 20 0B            [ 2]  158 	jra	00106$
      00873B                        159 00105$:
      00873B 4B 20            [ 1]  160 	push	#0x20
      00873D 4B 0F            [ 1]  161 	push	#0x0f
      00873F 4B 50            [ 1]  162 	push	#0x50
      008741 CD 8C 34         [ 4]  163 	call	_GPIO_WriteLow
      008744 5B 03            [ 2]  164 	addw	sp, #3
      008746                        165 00106$:
      008746 CE 08 7E         [ 2]  166 	ldw	x, _DELAYTIME+0
      008749 89               [ 2]  167 	pushw	x
      00874A CD 86 A8         [ 4]  168 	call	_Vcomdelay
      00874D 85               [ 2]  169 	popw	x
                                    170 ;	user/sw_uart.c: 39: if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00874E 7B 01            [ 1]  171 	ld	a, (0x01, sp)
      008750 A5 04            [ 1]  172 	bcp	a, #0x04
      008752 27 0D            [ 1]  173 	jreq	00108$
      008754 4B 20            [ 1]  174 	push	#0x20
      008756 4B 0F            [ 1]  175 	push	#0x0f
      008758 4B 50            [ 1]  176 	push	#0x50
      00875A CD 8C 2D         [ 4]  177 	call	_GPIO_WriteHigh
      00875D 5B 03            [ 2]  178 	addw	sp, #3
      00875F 20 0B            [ 2]  179 	jra	00109$
      008761                        180 00108$:
      008761 4B 20            [ 1]  181 	push	#0x20
      008763 4B 0F            [ 1]  182 	push	#0x0f
      008765 4B 50            [ 1]  183 	push	#0x50
      008767 CD 8C 34         [ 4]  184 	call	_GPIO_WriteLow
      00876A 5B 03            [ 2]  185 	addw	sp, #3
      00876C                        186 00109$:
      00876C CE 08 7E         [ 2]  187 	ldw	x, _DELAYTIME+0
      00876F 89               [ 2]  188 	pushw	x
      008770 CD 86 A8         [ 4]  189 	call	_Vcomdelay
      008773 85               [ 2]  190 	popw	x
                                    191 ;	user/sw_uart.c: 40: if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008774 7B 01            [ 1]  192 	ld	a, (0x01, sp)
      008776 A5 08            [ 1]  193 	bcp	a, #0x08
      008778 27 0D            [ 1]  194 	jreq	00111$
      00877A 4B 20            [ 1]  195 	push	#0x20
      00877C 4B 0F            [ 1]  196 	push	#0x0f
      00877E 4B 50            [ 1]  197 	push	#0x50
      008780 CD 8C 2D         [ 4]  198 	call	_GPIO_WriteHigh
      008783 5B 03            [ 2]  199 	addw	sp, #3
      008785 20 0B            [ 2]  200 	jra	00112$
      008787                        201 00111$:
      008787 4B 20            [ 1]  202 	push	#0x20
      008789 4B 0F            [ 1]  203 	push	#0x0f
      00878B 4B 50            [ 1]  204 	push	#0x50
      00878D CD 8C 34         [ 4]  205 	call	_GPIO_WriteLow
      008790 5B 03            [ 2]  206 	addw	sp, #3
      008792                        207 00112$:
      008792 CE 08 7E         [ 2]  208 	ldw	x, _DELAYTIME+0
      008795 89               [ 2]  209 	pushw	x
      008796 CD 86 A8         [ 4]  210 	call	_Vcomdelay
      008799 85               [ 2]  211 	popw	x
                                    212 ;	user/sw_uart.c: 41: if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00879A 7B 01            [ 1]  213 	ld	a, (0x01, sp)
      00879C A5 10            [ 1]  214 	bcp	a, #0x10
      00879E 27 0D            [ 1]  215 	jreq	00114$
      0087A0 4B 20            [ 1]  216 	push	#0x20
      0087A2 4B 0F            [ 1]  217 	push	#0x0f
      0087A4 4B 50            [ 1]  218 	push	#0x50
      0087A6 CD 8C 2D         [ 4]  219 	call	_GPIO_WriteHigh
      0087A9 5B 03            [ 2]  220 	addw	sp, #3
      0087AB 20 0B            [ 2]  221 	jra	00115$
      0087AD                        222 00114$:
      0087AD 4B 20            [ 1]  223 	push	#0x20
      0087AF 4B 0F            [ 1]  224 	push	#0x0f
      0087B1 4B 50            [ 1]  225 	push	#0x50
      0087B3 CD 8C 34         [ 4]  226 	call	_GPIO_WriteLow
      0087B6 5B 03            [ 2]  227 	addw	sp, #3
      0087B8                        228 00115$:
      0087B8 CE 08 7E         [ 2]  229 	ldw	x, _DELAYTIME+0
      0087BB 89               [ 2]  230 	pushw	x
      0087BC CD 86 A8         [ 4]  231 	call	_Vcomdelay
      0087BF 85               [ 2]  232 	popw	x
                                    233 ;	user/sw_uart.c: 42: if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0087C0 7B 01            [ 1]  234 	ld	a, (0x01, sp)
      0087C2 A5 20            [ 1]  235 	bcp	a, #0x20
      0087C4 27 0D            [ 1]  236 	jreq	00117$
      0087C6 4B 20            [ 1]  237 	push	#0x20
      0087C8 4B 0F            [ 1]  238 	push	#0x0f
      0087CA 4B 50            [ 1]  239 	push	#0x50
      0087CC CD 8C 2D         [ 4]  240 	call	_GPIO_WriteHigh
      0087CF 5B 03            [ 2]  241 	addw	sp, #3
      0087D1 20 0B            [ 2]  242 	jra	00118$
      0087D3                        243 00117$:
      0087D3 4B 20            [ 1]  244 	push	#0x20
      0087D5 4B 0F            [ 1]  245 	push	#0x0f
      0087D7 4B 50            [ 1]  246 	push	#0x50
      0087D9 CD 8C 34         [ 4]  247 	call	_GPIO_WriteLow
      0087DC 5B 03            [ 2]  248 	addw	sp, #3
      0087DE                        249 00118$:
      0087DE CE 08 7E         [ 2]  250 	ldw	x, _DELAYTIME+0
      0087E1 89               [ 2]  251 	pushw	x
      0087E2 CD 86 A8         [ 4]  252 	call	_Vcomdelay
      0087E5 85               [ 2]  253 	popw	x
                                    254 ;	user/sw_uart.c: 43: if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0087E6 7B 01            [ 1]  255 	ld	a, (0x01, sp)
      0087E8 A5 40            [ 1]  256 	bcp	a, #0x40
      0087EA 27 0D            [ 1]  257 	jreq	00120$
      0087EC 4B 20            [ 1]  258 	push	#0x20
      0087EE 4B 0F            [ 1]  259 	push	#0x0f
      0087F0 4B 50            [ 1]  260 	push	#0x50
      0087F2 CD 8C 2D         [ 4]  261 	call	_GPIO_WriteHigh
      0087F5 5B 03            [ 2]  262 	addw	sp, #3
      0087F7 20 0B            [ 2]  263 	jra	00121$
      0087F9                        264 00120$:
      0087F9 4B 20            [ 1]  265 	push	#0x20
      0087FB 4B 0F            [ 1]  266 	push	#0x0f
      0087FD 4B 50            [ 1]  267 	push	#0x50
      0087FF CD 8C 34         [ 4]  268 	call	_GPIO_WriteLow
      008802 5B 03            [ 2]  269 	addw	sp, #3
      008804                        270 00121$:
      008804 CE 08 7E         [ 2]  271 	ldw	x, _DELAYTIME+0
      008807 89               [ 2]  272 	pushw	x
      008808 CD 86 A8         [ 4]  273 	call	_Vcomdelay
      00880B 85               [ 2]  274 	popw	x
                                    275 ;	user/sw_uart.c: 44: if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00880C 0D 01            [ 1]  276 	tnz	(0x01, sp)
      00880E 2A 0D            [ 1]  277 	jrpl	00123$
      008810 4B 20            [ 1]  278 	push	#0x20
      008812 4B 0F            [ 1]  279 	push	#0x0f
      008814 4B 50            [ 1]  280 	push	#0x50
      008816 CD 8C 2D         [ 4]  281 	call	_GPIO_WriteHigh
      008819 5B 03            [ 2]  282 	addw	sp, #3
      00881B 20 0B            [ 2]  283 	jra	00124$
      00881D                        284 00123$:
      00881D 4B 20            [ 1]  285 	push	#0x20
      00881F 4B 0F            [ 1]  286 	push	#0x0f
      008821 4B 50            [ 1]  287 	push	#0x50
      008823 CD 8C 34         [ 4]  288 	call	_GPIO_WriteLow
      008826 5B 03            [ 2]  289 	addw	sp, #3
      008828                        290 00124$:
      008828 CE 08 7E         [ 2]  291 	ldw	x, _DELAYTIME+0
      00882B 89               [ 2]  292 	pushw	x
      00882C CD 86 A8         [ 4]  293 	call	_Vcomdelay
      00882F 85               [ 2]  294 	popw	x
                                    295 ;	user/sw_uart.c: 45: vTx_H();                                             // stop bit    (1.5bit for sure)
      008830 4B 20            [ 1]  296 	push	#0x20
      008832 4B 0F            [ 1]  297 	push	#0x0f
      008834 4B 50            [ 1]  298 	push	#0x50
      008836 CD 8C 2D         [ 4]  299 	call	_GPIO_WriteHigh
      008839 5B 03            [ 2]  300 	addw	sp, #3
                                    301 ;	user/sw_uart.c: 46: Vcomdelay(DELAYTIME<<1);             
      00883B CE 08 7E         [ 2]  302 	ldw	x, _DELAYTIME+0
      00883E 58               [ 2]  303 	sllw	x
      00883F 89               [ 2]  304 	pushw	x
      008840 CD 86 A8         [ 4]  305 	call	_Vcomdelay
      008843 85               [ 2]  306 	popw	x
                                    307 ;	user/sw_uart.c: 47: str++;
      008844 1E 04            [ 2]  308 	ldw	x, (0x04, sp)
      008846 5C               [ 2]  309 	incw	x
      008847 1F 04            [ 2]  310 	ldw	(0x04, sp), x
      008849 CC 86 D7         [ 2]  311 	jp	00126$
      00884C                        312 00128$:
                                    313 ;	user/sw_uart.c: 49: enableInterrupts();
      00884C 9A               [ 1]  314 	rim
      00884D 5B 05            [ 2]  315 	addw	sp, #5
      00884F 81               [ 4]  316 	ret
                                    317 ;	user/sw_uart.c: 52: void delaytest(uint32_t x)
                                    318 ;	-----------------------------------------
                                    319 ;	 function delaytest
                                    320 ;	-----------------------------------------
      008850                        321 _delaytest:
      008850 52 10            [ 2]  322 	sub	sp, #16
                                    323 ;	user/sw_uart.c: 55: while(x--)
      008852 16 13            [ 2]  324 	ldw	y, (0x13, sp)
      008854 17 0D            [ 2]  325 	ldw	(0x0d, sp), y
      008856 16 15            [ 2]  326 	ldw	y, (0x15, sp)
      008858                        327 00102$:
      008858 17 07            [ 2]  328 	ldw	(0x07, sp), y
      00885A 1E 0D            [ 2]  329 	ldw	x, (0x0d, sp)
      00885C 1F 05            [ 2]  330 	ldw	(0x05, sp), x
      00885E 72 A2 00 01      [ 2]  331 	subw	y, #0x0001
      008862 7B 0E            [ 1]  332 	ld	a, (0x0e, sp)
      008864 A2 00            [ 1]  333 	sbc	a, #0x00
      008866 6B 0E            [ 1]  334 	ld	(0x0e, sp), a
      008868 7B 0D            [ 1]  335 	ld	a, (0x0d, sp)
      00886A A2 00            [ 1]  336 	sbc	a, #0x00
      00886C 6B 0D            [ 1]  337 	ld	(0x0d, sp), a
      00886E 1E 07            [ 2]  338 	ldw	x, (0x07, sp)
      008870 26 04            [ 1]  339 	jrne	00126$
      008872 1E 05            [ 2]  340 	ldw	x, (0x05, sp)
      008874 27 34            [ 1]  341 	jreq	00108$
      008876                        342 00126$:
      008876 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      008878 1F 0B            [ 2]  344 	ldw	(0x0b, sp), x
      00887A 1E 01            [ 2]  345 	ldw	x, (0x01, sp)
      00887C 1F 09            [ 2]  346 	ldw	(0x09, sp), x
      00887E                        347 00106$:
                                    348 ;	user/sw_uart.c: 57: for(;i<3000;i++);
      00887E 1E 0B            [ 2]  349 	ldw	x, (0x0b, sp)
      008880 A3 0B B8         [ 2]  350 	cpw	x, #0x0bb8
      008883 7B 0A            [ 1]  351 	ld	a, (0x0a, sp)
      008885 A2 00            [ 1]  352 	sbc	a, #0x00
      008887 7B 09            [ 1]  353 	ld	a, (0x09, sp)
      008889 A2 00            [ 1]  354 	sbc	a, #0x00
      00888B 24 CB            [ 1]  355 	jrnc	00102$
      00888D 1E 0B            [ 2]  356 	ldw	x, (0x0b, sp)
      00888F 1C 00 01         [ 2]  357 	addw	x, #0x0001
      008892 1F 0B            [ 2]  358 	ldw	(0x0b, sp), x
      008894 7B 0A            [ 1]  359 	ld	a, (0x0a, sp)
      008896 A9 00            [ 1]  360 	adc	a, #0x00
      008898 6B 0A            [ 1]  361 	ld	(0x0a, sp), a
      00889A 7B 09            [ 1]  362 	ld	a, (0x09, sp)
      00889C A9 00            [ 1]  363 	adc	a, #0x00
      00889E 6B 09            [ 1]  364 	ld	(0x09, sp), a
      0088A0 1E 0B            [ 2]  365 	ldw	x, (0x0b, sp)
      0088A2 1F 03            [ 2]  366 	ldw	(0x03, sp), x
      0088A4 1E 09            [ 2]  367 	ldw	x, (0x09, sp)
      0088A6 1F 01            [ 2]  368 	ldw	(0x01, sp), x
      0088A8 20 D4            [ 2]  369 	jra	00106$
      0088AA                        370 00108$:
      0088AA 5B 10            [ 2]  371 	addw	sp, #16
      0088AC 81               [ 4]  372 	ret
                                    373 ;	user/sw_uart.c: 61: void VCOM_TestSpeed(void)
                                    374 ;	-----------------------------------------
                                    375 ;	 function VCOM_TestSpeed
                                    376 ;	-----------------------------------------
      0088AD                        377 _VCOM_TestSpeed:
      0088AD 52 08            [ 2]  378 	sub	sp, #8
                                    379 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      0088AF                        380 00109$:
      0088AF AE 89 17         [ 2]  381 	ldw	x, #___str_0+0
      0088B2 1F 03            [ 2]  382 	ldw	(0x03, sp), x
      0088B4 AE 00 57         [ 2]  383 	ldw	x, #_vcomstr+0
      0088B7 1F 07            [ 2]  384 	ldw	(0x07, sp), x
      0088B9 16 07            [ 2]  385 	ldw	y, (0x07, sp)
      0088BB 17 05            [ 2]  386 	ldw	(0x05, sp), y
      0088BD AE 00 FA         [ 2]  387 	ldw	x, #0x00fa
      0088C0 1F 01            [ 2]  388 	ldw	(0x01, sp), x
      0088C2                        389 00105$:
                                    390 ;	user/sw_uart.c: 68: DELAYTIME = i;  
      0088C2 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      0088C4 C7 08 7F         [ 1]  392 	ld	_DELAYTIME+1, a
      0088C7 7B 01            [ 1]  393 	ld	a, (0x01, sp)
      0088C9 C7 08 7E         [ 1]  394 	ld	_DELAYTIME+0, a
                                    395 ;	user/sw_uart.c: 69: vTx_H();
      0088CC 4B 20            [ 1]  396 	push	#0x20
      0088CE 4B 0F            [ 1]  397 	push	#0x0f
      0088D0 4B 50            [ 1]  398 	push	#0x50
      0088D2 CD 8C 2D         [ 4]  399 	call	_GPIO_WriteHigh
      0088D5 5B 03            [ 2]  400 	addw	sp, #3
                                    401 ;	user/sw_uart.c: 70: delaytest(10000); 
      0088D7 4B 10            [ 1]  402 	push	#0x10
      0088D9 4B 27            [ 1]  403 	push	#0x27
      0088DB 5F               [ 1]  404 	clrw	x
      0088DC 89               [ 2]  405 	pushw	x
      0088DD CD 88 50         [ 4]  406 	call	_delaytest
      0088E0 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	user/sw_uart.c: 71: VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
      0088E2 16 03            [ 2]  409 	ldw	y, (0x03, sp)
      0088E4 1E 07            [ 2]  410 	ldw	x, (0x07, sp)
      0088E6 7B 02            [ 1]  411 	ld	a, (0x02, sp)
      0088E8 88               [ 1]  412 	push	a
      0088E9 7B 02            [ 1]  413 	ld	a, (0x02, sp)
      0088EB 88               [ 1]  414 	push	a
      0088EC 90 89            [ 2]  415 	pushw	y
      0088EE 89               [ 2]  416 	pushw	x
      0088EF CD 8E 9B         [ 4]  417 	call	_sprintf
      0088F2 5B 06            [ 2]  418 	addw	sp, #6
                                    419 ;	user/sw_uart.c: 72: VCOM_puts(vcomstr); 
      0088F4 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      0088F6 89               [ 2]  421 	pushw	x
      0088F7 CD 86 CB         [ 4]  422 	call	_VCOM_puts
      0088FA 85               [ 2]  423 	popw	x
                                    424 ;	user/sw_uart.c: 73: vTx_L(); 
      0088FB 4B 20            [ 1]  425 	push	#0x20
      0088FD 4B 0F            [ 1]  426 	push	#0x0f
      0088FF 4B 50            [ 1]  427 	push	#0x50
      008901 CD 8C 34         [ 4]  428 	call	_GPIO_WriteLow
      008904 5B 03            [ 2]  429 	addw	sp, #3
                                    430 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      008906 1E 01            [ 2]  431 	ldw	x, (0x01, sp)
      008908 5A               [ 2]  432 	decw	x
      008909 1F 01            [ 2]  433 	ldw	(0x01, sp), x
      00890B 1E 01            [ 2]  434 	ldw	x, (0x01, sp)
      00890D A3 00 01         [ 2]  435 	cpw	x, #0x0001
      008910 2E B0            [ 1]  436 	jrsge	00105$
      008912 20 9B            [ 2]  437 	jra	00109$
      008914 5B 08            [ 2]  438 	addw	sp, #8
      008916 81               [ 4]  439 	ret
                                    440 	.area CODE
      008917                        441 ___str_0:
      008917 56 43 4F 4D 20 61 74   442 	.ascii "VCOM at %d TESTING SPEED"
             20 25 64 20 54 45 53
             54 49 4E 47 20 53 50
             45 45 44
      00892F 0D                     443 	.db 0x0d
      008930 0A                     444 	.db 0x0a
      008931 00                     445 	.db 0x00
                                    446 	.area INITIALIZER
      009E53                        447 __xinit__DELAYTIME:
      009E53 00 E6                  448 	.dw #0x00e6
                                    449 	.area CABS (ABS)
