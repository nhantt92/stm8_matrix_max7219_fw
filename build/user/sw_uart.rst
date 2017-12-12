                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      000001                         26 _vcomstr::
      000001                         27 	.ds 30
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area INITIALIZED
      000028                         32 _DELAYTIME::
      000028                         33 	.ds 2
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
      00843B                         58 _Vcomdelay:
      00843B 1E 03            [ 2]   59 	ldw	x, (0x03, sp)
      00843D                         60 00103$:
                                     61 ;	user/sw_uart.c: 18: for ( ; dtime >= 0; dtime--);
      00843D 5D               [ 2]   62 	tnzw	x
      00843E 2A 01            [ 1]   63 	jrpl	00116$
      008440 81               [ 4]   64 	ret
      008441                         65 00116$:
      008441 5A               [ 2]   66 	decw	x
      008442 20 F9            [ 2]   67 	jra	00103$
      008444 81               [ 4]   68 	ret
                                     69 ;	user/sw_uart.c: 21: void VCOM_Init(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function VCOM_Init
                                     72 ;	-----------------------------------------
      008445                         73 _VCOM_Init:
                                     74 ;	user/sw_uart.c: 23: GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      008445 4B F0            [ 1]   75 	push	#0xf0
      008447 4B 20            [ 1]   76 	push	#0x20
      008449 4B 0F            [ 1]   77 	push	#0x0f
      00844B 4B 50            [ 1]   78 	push	#0x50
      00844D CD 89 2C         [ 4]   79 	call	_GPIO_Init
      008450 5B 04            [ 2]   80 	addw	sp, #4
                                     81 ;	user/sw_uart.c: 24: vTx_H();
      008452 4B 20            [ 1]   82 	push	#0x20
      008454 4B 0F            [ 1]   83 	push	#0x0f
      008456 4B 50            [ 1]   84 	push	#0x50
      008458 CD 89 C0         [ 4]   85 	call	_GPIO_WriteHigh
      00845B 5B 03            [ 2]   86 	addw	sp, #3
      00845D 81               [ 4]   87 	ret
                                     88 ;	user/sw_uart.c: 28: void VCOM_puts(char *str)
                                     89 ;	-----------------------------------------
                                     90 ;	 function VCOM_puts
                                     91 ;	-----------------------------------------
      00845E                         92 _VCOM_puts:
      00845E 52 05            [ 2]   93 	sub	sp, #5
                                     94 ;	user/sw_uart.c: 32: disableInterrupts();
      008460 9B               [ 1]   95 	sim
                                     96 ;	user/sw_uart.c: 33: while ((c=*str) && maxlen--)
      008461 AE 00 FF         [ 2]   97 	ldw	x, #0x00ff
      008464 1F 01            [ 2]   98 	ldw	(0x01, sp), x
      008466 16 08            [ 2]   99 	ldw	y, (0x08, sp)
      008468 17 04            [ 2]  100 	ldw	(0x04, sp), y
      00846A                        101 00126$:
      00846A 1E 04            [ 2]  102 	ldw	x, (0x04, sp)
      00846C F6               [ 1]  103 	ld	a, (x)
      00846D 6B 03            [ 1]  104 	ld	(0x03, sp), a
      00846F 4D               [ 1]  105 	tnz	a
      008470 26 03            [ 1]  106 	jrne	00176$
      008472 CC 85 DF         [ 2]  107 	jp	00128$
      008475                        108 00176$:
      008475 1E 01            [ 2]  109 	ldw	x, (0x01, sp)
      008477 16 01            [ 2]  110 	ldw	y, (0x01, sp)
      008479 90 5A            [ 2]  111 	decw	y
      00847B 17 01            [ 2]  112 	ldw	(0x01, sp), y
      00847D 5D               [ 2]  113 	tnzw	x
      00847E 26 03            [ 1]  114 	jrne	00177$
      008480 CC 85 DF         [ 2]  115 	jp	00128$
      008483                        116 00177$:
                                    117 ;	user/sw_uart.c: 35: vTx_L();                                              // start bit
      008483 4B 20            [ 1]  118 	push	#0x20
      008485 4B 0F            [ 1]  119 	push	#0x0f
      008487 4B 50            [ 1]  120 	push	#0x50
      008489 CD 89 C7         [ 4]  121 	call	_GPIO_WriteLow
      00848C 5B 03            [ 2]  122 	addw	sp, #3
                                    123 ;	user/sw_uart.c: 36: Vcomdelay(DELAYTIME);          
      00848E CE 00 28         [ 2]  124 	ldw	x, _DELAYTIME+0
      008491 89               [ 2]  125 	pushw	x
      008492 CD 84 3B         [ 4]  126 	call	_Vcomdelay
      008495 85               [ 2]  127 	popw	x
                                    128 ;	user/sw_uart.c: 37: if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
      008496 7B 03            [ 1]  129 	ld	a, (0x03, sp)
      008498 44               [ 1]  130 	srl	a
      008499 24 0D            [ 1]  131 	jrnc	00102$
      00849B 4B 20            [ 1]  132 	push	#0x20
      00849D 4B 0F            [ 1]  133 	push	#0x0f
      00849F 4B 50            [ 1]  134 	push	#0x50
      0084A1 CD 89 C0         [ 4]  135 	call	_GPIO_WriteHigh
      0084A4 5B 03            [ 2]  136 	addw	sp, #3
      0084A6 20 0B            [ 2]  137 	jra	00103$
      0084A8                        138 00102$:
      0084A8 4B 20            [ 1]  139 	push	#0x20
      0084AA 4B 0F            [ 1]  140 	push	#0x0f
      0084AC 4B 50            [ 1]  141 	push	#0x50
      0084AE CD 89 C7         [ 4]  142 	call	_GPIO_WriteLow
      0084B1 5B 03            [ 2]  143 	addw	sp, #3
      0084B3                        144 00103$:
      0084B3 CE 00 28         [ 2]  145 	ldw	x, _DELAYTIME+0
      0084B6 89               [ 2]  146 	pushw	x
      0084B7 CD 84 3B         [ 4]  147 	call	_Vcomdelay
      0084BA 85               [ 2]  148 	popw	x
                                    149 ;	user/sw_uart.c: 38: if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0084BB 7B 03            [ 1]  150 	ld	a, (0x03, sp)
      0084BD A5 02            [ 1]  151 	bcp	a, #0x02
      0084BF 27 0D            [ 1]  152 	jreq	00105$
      0084C1 4B 20            [ 1]  153 	push	#0x20
      0084C3 4B 0F            [ 1]  154 	push	#0x0f
      0084C5 4B 50            [ 1]  155 	push	#0x50
      0084C7 CD 89 C0         [ 4]  156 	call	_GPIO_WriteHigh
      0084CA 5B 03            [ 2]  157 	addw	sp, #3
      0084CC 20 0B            [ 2]  158 	jra	00106$
      0084CE                        159 00105$:
      0084CE 4B 20            [ 1]  160 	push	#0x20
      0084D0 4B 0F            [ 1]  161 	push	#0x0f
      0084D2 4B 50            [ 1]  162 	push	#0x50
      0084D4 CD 89 C7         [ 4]  163 	call	_GPIO_WriteLow
      0084D7 5B 03            [ 2]  164 	addw	sp, #3
      0084D9                        165 00106$:
      0084D9 CE 00 28         [ 2]  166 	ldw	x, _DELAYTIME+0
      0084DC 89               [ 2]  167 	pushw	x
      0084DD CD 84 3B         [ 4]  168 	call	_Vcomdelay
      0084E0 85               [ 2]  169 	popw	x
                                    170 ;	user/sw_uart.c: 39: if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0084E1 7B 03            [ 1]  171 	ld	a, (0x03, sp)
      0084E3 A5 04            [ 1]  172 	bcp	a, #0x04
      0084E5 27 0D            [ 1]  173 	jreq	00108$
      0084E7 4B 20            [ 1]  174 	push	#0x20
      0084E9 4B 0F            [ 1]  175 	push	#0x0f
      0084EB 4B 50            [ 1]  176 	push	#0x50
      0084ED CD 89 C0         [ 4]  177 	call	_GPIO_WriteHigh
      0084F0 5B 03            [ 2]  178 	addw	sp, #3
      0084F2 20 0B            [ 2]  179 	jra	00109$
      0084F4                        180 00108$:
      0084F4 4B 20            [ 1]  181 	push	#0x20
      0084F6 4B 0F            [ 1]  182 	push	#0x0f
      0084F8 4B 50            [ 1]  183 	push	#0x50
      0084FA CD 89 C7         [ 4]  184 	call	_GPIO_WriteLow
      0084FD 5B 03            [ 2]  185 	addw	sp, #3
      0084FF                        186 00109$:
      0084FF CE 00 28         [ 2]  187 	ldw	x, _DELAYTIME+0
      008502 89               [ 2]  188 	pushw	x
      008503 CD 84 3B         [ 4]  189 	call	_Vcomdelay
      008506 85               [ 2]  190 	popw	x
                                    191 ;	user/sw_uart.c: 40: if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008507 7B 03            [ 1]  192 	ld	a, (0x03, sp)
      008509 A5 08            [ 1]  193 	bcp	a, #0x08
      00850B 27 0D            [ 1]  194 	jreq	00111$
      00850D 4B 20            [ 1]  195 	push	#0x20
      00850F 4B 0F            [ 1]  196 	push	#0x0f
      008511 4B 50            [ 1]  197 	push	#0x50
      008513 CD 89 C0         [ 4]  198 	call	_GPIO_WriteHigh
      008516 5B 03            [ 2]  199 	addw	sp, #3
      008518 20 0B            [ 2]  200 	jra	00112$
      00851A                        201 00111$:
      00851A 4B 20            [ 1]  202 	push	#0x20
      00851C 4B 0F            [ 1]  203 	push	#0x0f
      00851E 4B 50            [ 1]  204 	push	#0x50
      008520 CD 89 C7         [ 4]  205 	call	_GPIO_WriteLow
      008523 5B 03            [ 2]  206 	addw	sp, #3
      008525                        207 00112$:
      008525 CE 00 28         [ 2]  208 	ldw	x, _DELAYTIME+0
      008528 89               [ 2]  209 	pushw	x
      008529 CD 84 3B         [ 4]  210 	call	_Vcomdelay
      00852C 85               [ 2]  211 	popw	x
                                    212 ;	user/sw_uart.c: 41: if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00852D 7B 03            [ 1]  213 	ld	a, (0x03, sp)
      00852F A5 10            [ 1]  214 	bcp	a, #0x10
      008531 27 0D            [ 1]  215 	jreq	00114$
      008533 4B 20            [ 1]  216 	push	#0x20
      008535 4B 0F            [ 1]  217 	push	#0x0f
      008537 4B 50            [ 1]  218 	push	#0x50
      008539 CD 89 C0         [ 4]  219 	call	_GPIO_WriteHigh
      00853C 5B 03            [ 2]  220 	addw	sp, #3
      00853E 20 0B            [ 2]  221 	jra	00115$
      008540                        222 00114$:
      008540 4B 20            [ 1]  223 	push	#0x20
      008542 4B 0F            [ 1]  224 	push	#0x0f
      008544 4B 50            [ 1]  225 	push	#0x50
      008546 CD 89 C7         [ 4]  226 	call	_GPIO_WriteLow
      008549 5B 03            [ 2]  227 	addw	sp, #3
      00854B                        228 00115$:
      00854B CE 00 28         [ 2]  229 	ldw	x, _DELAYTIME+0
      00854E 89               [ 2]  230 	pushw	x
      00854F CD 84 3B         [ 4]  231 	call	_Vcomdelay
      008552 85               [ 2]  232 	popw	x
                                    233 ;	user/sw_uart.c: 42: if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008553 7B 03            [ 1]  234 	ld	a, (0x03, sp)
      008555 A5 20            [ 1]  235 	bcp	a, #0x20
      008557 27 0D            [ 1]  236 	jreq	00117$
      008559 4B 20            [ 1]  237 	push	#0x20
      00855B 4B 0F            [ 1]  238 	push	#0x0f
      00855D 4B 50            [ 1]  239 	push	#0x50
      00855F CD 89 C0         [ 4]  240 	call	_GPIO_WriteHigh
      008562 5B 03            [ 2]  241 	addw	sp, #3
      008564 20 0B            [ 2]  242 	jra	00118$
      008566                        243 00117$:
      008566 4B 20            [ 1]  244 	push	#0x20
      008568 4B 0F            [ 1]  245 	push	#0x0f
      00856A 4B 50            [ 1]  246 	push	#0x50
      00856C CD 89 C7         [ 4]  247 	call	_GPIO_WriteLow
      00856F 5B 03            [ 2]  248 	addw	sp, #3
      008571                        249 00118$:
      008571 CE 00 28         [ 2]  250 	ldw	x, _DELAYTIME+0
      008574 89               [ 2]  251 	pushw	x
      008575 CD 84 3B         [ 4]  252 	call	_Vcomdelay
      008578 85               [ 2]  253 	popw	x
                                    254 ;	user/sw_uart.c: 43: if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008579 7B 03            [ 1]  255 	ld	a, (0x03, sp)
      00857B A5 40            [ 1]  256 	bcp	a, #0x40
      00857D 27 0D            [ 1]  257 	jreq	00120$
      00857F 4B 20            [ 1]  258 	push	#0x20
      008581 4B 0F            [ 1]  259 	push	#0x0f
      008583 4B 50            [ 1]  260 	push	#0x50
      008585 CD 89 C0         [ 4]  261 	call	_GPIO_WriteHigh
      008588 5B 03            [ 2]  262 	addw	sp, #3
      00858A 20 0B            [ 2]  263 	jra	00121$
      00858C                        264 00120$:
      00858C 4B 20            [ 1]  265 	push	#0x20
      00858E 4B 0F            [ 1]  266 	push	#0x0f
      008590 4B 50            [ 1]  267 	push	#0x50
      008592 CD 89 C7         [ 4]  268 	call	_GPIO_WriteLow
      008595 5B 03            [ 2]  269 	addw	sp, #3
      008597                        270 00121$:
      008597 CE 00 28         [ 2]  271 	ldw	x, _DELAYTIME+0
      00859A 89               [ 2]  272 	pushw	x
      00859B CD 84 3B         [ 4]  273 	call	_Vcomdelay
      00859E 85               [ 2]  274 	popw	x
                                    275 ;	user/sw_uart.c: 44: if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00859F 0D 03            [ 1]  276 	tnz	(0x03, sp)
      0085A1 2A 0D            [ 1]  277 	jrpl	00123$
      0085A3 4B 20            [ 1]  278 	push	#0x20
      0085A5 4B 0F            [ 1]  279 	push	#0x0f
      0085A7 4B 50            [ 1]  280 	push	#0x50
      0085A9 CD 89 C0         [ 4]  281 	call	_GPIO_WriteHigh
      0085AC 5B 03            [ 2]  282 	addw	sp, #3
      0085AE 20 0B            [ 2]  283 	jra	00124$
      0085B0                        284 00123$:
      0085B0 4B 20            [ 1]  285 	push	#0x20
      0085B2 4B 0F            [ 1]  286 	push	#0x0f
      0085B4 4B 50            [ 1]  287 	push	#0x50
      0085B6 CD 89 C7         [ 4]  288 	call	_GPIO_WriteLow
      0085B9 5B 03            [ 2]  289 	addw	sp, #3
      0085BB                        290 00124$:
      0085BB CE 00 28         [ 2]  291 	ldw	x, _DELAYTIME+0
      0085BE 89               [ 2]  292 	pushw	x
      0085BF CD 84 3B         [ 4]  293 	call	_Vcomdelay
      0085C2 85               [ 2]  294 	popw	x
                                    295 ;	user/sw_uart.c: 45: vTx_H();                                             // stop bit    (1.5bit for sure)
      0085C3 4B 20            [ 1]  296 	push	#0x20
      0085C5 4B 0F            [ 1]  297 	push	#0x0f
      0085C7 4B 50            [ 1]  298 	push	#0x50
      0085C9 CD 89 C0         [ 4]  299 	call	_GPIO_WriteHigh
      0085CC 5B 03            [ 2]  300 	addw	sp, #3
                                    301 ;	user/sw_uart.c: 46: Vcomdelay(DELAYTIME<<1);             
      0085CE CE 00 28         [ 2]  302 	ldw	x, _DELAYTIME+0
      0085D1 58               [ 2]  303 	sllw	x
      0085D2 89               [ 2]  304 	pushw	x
      0085D3 CD 84 3B         [ 4]  305 	call	_Vcomdelay
      0085D6 85               [ 2]  306 	popw	x
                                    307 ;	user/sw_uart.c: 47: str++;
      0085D7 1E 04            [ 2]  308 	ldw	x, (0x04, sp)
      0085D9 5C               [ 2]  309 	incw	x
      0085DA 1F 04            [ 2]  310 	ldw	(0x04, sp), x
      0085DC CC 84 6A         [ 2]  311 	jp	00126$
      0085DF                        312 00128$:
                                    313 ;	user/sw_uart.c: 49: enableInterrupts();
      0085DF 9A               [ 1]  314 	rim
      0085E0 5B 05            [ 2]  315 	addw	sp, #5
      0085E2 81               [ 4]  316 	ret
                                    317 ;	user/sw_uart.c: 52: void delaytest(uint32_t x)
                                    318 ;	-----------------------------------------
                                    319 ;	 function delaytest
                                    320 ;	-----------------------------------------
      0085E3                        321 _delaytest:
      0085E3 52 10            [ 2]  322 	sub	sp, #16
                                    323 ;	user/sw_uart.c: 55: while(x--)
      0085E5 16 13            [ 2]  324 	ldw	y, (0x13, sp)
      0085E7 17 05            [ 2]  325 	ldw	(0x05, sp), y
      0085E9 16 15            [ 2]  326 	ldw	y, (0x15, sp)
      0085EB                        327 00102$:
      0085EB 17 0B            [ 2]  328 	ldw	(0x0b, sp), y
      0085ED 1E 05            [ 2]  329 	ldw	x, (0x05, sp)
      0085EF 1F 09            [ 2]  330 	ldw	(0x09, sp), x
      0085F1 72 A2 00 01      [ 2]  331 	subw	y, #0x0001
      0085F5 7B 06            [ 1]  332 	ld	a, (0x06, sp)
      0085F7 A2 00            [ 1]  333 	sbc	a, #0x00
      0085F9 6B 06            [ 1]  334 	ld	(0x06, sp), a
      0085FB 7B 05            [ 1]  335 	ld	a, (0x05, sp)
      0085FD A2 00            [ 1]  336 	sbc	a, #0x00
      0085FF 6B 05            [ 1]  337 	ld	(0x05, sp), a
      008601 1E 0B            [ 2]  338 	ldw	x, (0x0b, sp)
      008603 26 04            [ 1]  339 	jrne	00126$
      008605 1E 09            [ 2]  340 	ldw	x, (0x09, sp)
      008607 27 34            [ 1]  341 	jreq	00108$
      008609                        342 00126$:
      008609 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      00860B 1F 0F            [ 2]  344 	ldw	(0x0f, sp), x
      00860D 1E 01            [ 2]  345 	ldw	x, (0x01, sp)
      00860F 1F 0D            [ 2]  346 	ldw	(0x0d, sp), x
      008611                        347 00106$:
                                    348 ;	user/sw_uart.c: 57: for(;i<3000;i++);
      008611 1E 0F            [ 2]  349 	ldw	x, (0x0f, sp)
      008613 A3 0B B8         [ 2]  350 	cpw	x, #0x0bb8
      008616 7B 0E            [ 1]  351 	ld	a, (0x0e, sp)
      008618 A2 00            [ 1]  352 	sbc	a, #0x00
      00861A 7B 0D            [ 1]  353 	ld	a, (0x0d, sp)
      00861C A2 00            [ 1]  354 	sbc	a, #0x00
      00861E 24 CB            [ 1]  355 	jrnc	00102$
      008620 1E 0F            [ 2]  356 	ldw	x, (0x0f, sp)
      008622 1C 00 01         [ 2]  357 	addw	x, #0x0001
      008625 1F 0F            [ 2]  358 	ldw	(0x0f, sp), x
      008627 7B 0E            [ 1]  359 	ld	a, (0x0e, sp)
      008629 A9 00            [ 1]  360 	adc	a, #0x00
      00862B 6B 0E            [ 1]  361 	ld	(0x0e, sp), a
      00862D 7B 0D            [ 1]  362 	ld	a, (0x0d, sp)
      00862F A9 00            [ 1]  363 	adc	a, #0x00
      008631 6B 0D            [ 1]  364 	ld	(0x0d, sp), a
      008633 1E 0F            [ 2]  365 	ldw	x, (0x0f, sp)
      008635 1F 03            [ 2]  366 	ldw	(0x03, sp), x
      008637 1E 0D            [ 2]  367 	ldw	x, (0x0d, sp)
      008639 1F 01            [ 2]  368 	ldw	(0x01, sp), x
      00863B 20 D4            [ 2]  369 	jra	00106$
      00863D                        370 00108$:
      00863D 5B 10            [ 2]  371 	addw	sp, #16
      00863F 81               [ 4]  372 	ret
                                    373 ;	user/sw_uart.c: 61: void VCOM_TestSpeed(void)
                                    374 ;	-----------------------------------------
                                    375 ;	 function VCOM_TestSpeed
                                    376 ;	-----------------------------------------
      008640                        377 _VCOM_TestSpeed:
      008640 52 08            [ 2]  378 	sub	sp, #8
                                    379 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      008642                        380 00109$:
      008642 AE 86 AA         [ 2]  381 	ldw	x, #___str_0+0
      008645 1F 05            [ 2]  382 	ldw	(0x05, sp), x
      008647 AE 00 01         [ 2]  383 	ldw	x, #_vcomstr+0
      00864A 1F 03            [ 2]  384 	ldw	(0x03, sp), x
      00864C 16 03            [ 2]  385 	ldw	y, (0x03, sp)
      00864E 17 07            [ 2]  386 	ldw	(0x07, sp), y
      008650 AE 00 FA         [ 2]  387 	ldw	x, #0x00fa
      008653 1F 01            [ 2]  388 	ldw	(0x01, sp), x
      008655                        389 00105$:
                                    390 ;	user/sw_uart.c: 68: DELAYTIME = i;  
      008655 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      008657 C7 00 29         [ 1]  392 	ld	_DELAYTIME+1, a
      00865A 7B 01            [ 1]  393 	ld	a, (0x01, sp)
      00865C C7 00 28         [ 1]  394 	ld	_DELAYTIME+0, a
                                    395 ;	user/sw_uart.c: 69: vTx_H();
      00865F 4B 20            [ 1]  396 	push	#0x20
      008661 4B 0F            [ 1]  397 	push	#0x0f
      008663 4B 50            [ 1]  398 	push	#0x50
      008665 CD 89 C0         [ 4]  399 	call	_GPIO_WriteHigh
      008668 5B 03            [ 2]  400 	addw	sp, #3
                                    401 ;	user/sw_uart.c: 70: delaytest(10000); 
      00866A 4B 10            [ 1]  402 	push	#0x10
      00866C 4B 27            [ 1]  403 	push	#0x27
      00866E 5F               [ 1]  404 	clrw	x
      00866F 89               [ 2]  405 	pushw	x
      008670 CD 85 E3         [ 4]  406 	call	_delaytest
      008673 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	user/sw_uart.c: 71: VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
      008675 16 05            [ 2]  409 	ldw	y, (0x05, sp)
      008677 1E 03            [ 2]  410 	ldw	x, (0x03, sp)
      008679 7B 02            [ 1]  411 	ld	a, (0x02, sp)
      00867B 88               [ 1]  412 	push	a
      00867C 7B 02            [ 1]  413 	ld	a, (0x02, sp)
      00867E 88               [ 1]  414 	push	a
      00867F 90 89            [ 2]  415 	pushw	y
      008681 89               [ 2]  416 	pushw	x
      008682 CD 8C 2E         [ 4]  417 	call	_sprintf
      008685 5B 06            [ 2]  418 	addw	sp, #6
                                    419 ;	user/sw_uart.c: 72: VCOM_puts(vcomstr); 
      008687 1E 07            [ 2]  420 	ldw	x, (0x07, sp)
      008689 89               [ 2]  421 	pushw	x
      00868A CD 84 5E         [ 4]  422 	call	_VCOM_puts
      00868D 85               [ 2]  423 	popw	x
                                    424 ;	user/sw_uart.c: 73: vTx_L(); 
      00868E 4B 20            [ 1]  425 	push	#0x20
      008690 4B 0F            [ 1]  426 	push	#0x0f
      008692 4B 50            [ 1]  427 	push	#0x50
      008694 CD 89 C7         [ 4]  428 	call	_GPIO_WriteLow
      008697 5B 03            [ 2]  429 	addw	sp, #3
                                    430 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      008699 1E 01            [ 2]  431 	ldw	x, (0x01, sp)
      00869B 5A               [ 2]  432 	decw	x
      00869C 1F 01            [ 2]  433 	ldw	(0x01, sp), x
      00869E 1E 01            [ 2]  434 	ldw	x, (0x01, sp)
      0086A0 A3 00 01         [ 2]  435 	cpw	x, #0x0001
      0086A3 2E B0            [ 1]  436 	jrsge	00105$
      0086A5 20 9B            [ 2]  437 	jra	00109$
      0086A7 5B 08            [ 2]  438 	addw	sp, #8
      0086A9 81               [ 4]  439 	ret
                                    440 	.area CODE
      0086AA                        441 ___str_0:
      0086AA 56 43 4F 4D 20 61 74   442 	.ascii "VCOM at %d TESTING SPEED"
             20 25 64 20 54 45 53
             54 49 4E 47 20 53 50
             45 45 44
      0086C2 0D                     443 	.db 0x0d
      0086C3 0A                     444 	.db 0x0a
      0086C4 00                     445 	.db 0x00
                                    446 	.area INITIALIZER
      0093C5                        447 __xinit__DELAYTIME:
      0093C5 00 E6                  448 	.dw #0x00e6
                                    449 	.area CABS (ABS)
