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
      00007E                         32 _DELAYTIME::
      00007E                         33 	.ds 2
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
      008692                         58 _Vcomdelay:
      008692 1E 03            [ 2]   59 	ldw	x, (0x03, sp)
      008694                         60 00103$:
                                     61 ;	user/sw_uart.c: 18: for ( ; dtime >= 0; dtime--);
      008694 5D               [ 2]   62 	tnzw	x
      008695 2A 01            [ 1]   63 	jrpl	00116$
      008697 81               [ 4]   64 	ret
      008698                         65 00116$:
      008698 5A               [ 2]   66 	decw	x
      008699 20 F9            [ 2]   67 	jra	00103$
      00869B 81               [ 4]   68 	ret
                                     69 ;	user/sw_uart.c: 21: void VCOM_Init(void)
                                     70 ;	-----------------------------------------
                                     71 ;	 function VCOM_Init
                                     72 ;	-----------------------------------------
      00869C                         73 _VCOM_Init:
                                     74 ;	user/sw_uart.c: 23: GPIO_Init(vTxGPIO, vTxPIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      00869C 4B F0            [ 1]   75 	push	#0xf0
      00869E 4B 20            [ 1]   76 	push	#0x20
      0086A0 4B 0F            [ 1]   77 	push	#0x0f
      0086A2 4B 50            [ 1]   78 	push	#0x50
      0086A4 CD 8B 83         [ 4]   79 	call	_GPIO_Init
      0086A7 5B 04            [ 2]   80 	addw	sp, #4
                                     81 ;	user/sw_uart.c: 24: vTx_H();
      0086A9 4B 20            [ 1]   82 	push	#0x20
      0086AB 4B 0F            [ 1]   83 	push	#0x0f
      0086AD 4B 50            [ 1]   84 	push	#0x50
      0086AF CD 8C 17         [ 4]   85 	call	_GPIO_WriteHigh
      0086B2 5B 03            [ 2]   86 	addw	sp, #3
      0086B4 81               [ 4]   87 	ret
                                     88 ;	user/sw_uart.c: 28: void VCOM_puts(char *str)
                                     89 ;	-----------------------------------------
                                     90 ;	 function VCOM_puts
                                     91 ;	-----------------------------------------
      0086B5                         92 _VCOM_puts:
      0086B5 52 05            [ 2]   93 	sub	sp, #5
                                     94 ;	user/sw_uart.c: 32: disableInterrupts();
      0086B7 9B               [ 1]   95 	sim
                                     96 ;	user/sw_uart.c: 33: while ((c=*str) && maxlen--)
      0086B8 AE 00 FF         [ 2]   97 	ldw	x, #0x00ff
      0086BB 1F 02            [ 2]   98 	ldw	(0x02, sp), x
      0086BD 16 08            [ 2]   99 	ldw	y, (0x08, sp)
      0086BF 17 04            [ 2]  100 	ldw	(0x04, sp), y
      0086C1                        101 00126$:
      0086C1 1E 04            [ 2]  102 	ldw	x, (0x04, sp)
      0086C3 F6               [ 1]  103 	ld	a, (x)
      0086C4 6B 01            [ 1]  104 	ld	(0x01, sp), a
      0086C6 4D               [ 1]  105 	tnz	a
      0086C7 26 03            [ 1]  106 	jrne	00176$
      0086C9 CC 88 36         [ 2]  107 	jp	00128$
      0086CC                        108 00176$:
      0086CC 1E 02            [ 2]  109 	ldw	x, (0x02, sp)
      0086CE 16 02            [ 2]  110 	ldw	y, (0x02, sp)
      0086D0 90 5A            [ 2]  111 	decw	y
      0086D2 17 02            [ 2]  112 	ldw	(0x02, sp), y
      0086D4 5D               [ 2]  113 	tnzw	x
      0086D5 26 03            [ 1]  114 	jrne	00177$
      0086D7 CC 88 36         [ 2]  115 	jp	00128$
      0086DA                        116 00177$:
                                    117 ;	user/sw_uart.c: 35: vTx_L();                                              // start bit
      0086DA 4B 20            [ 1]  118 	push	#0x20
      0086DC 4B 0F            [ 1]  119 	push	#0x0f
      0086DE 4B 50            [ 1]  120 	push	#0x50
      0086E0 CD 8C 1E         [ 4]  121 	call	_GPIO_WriteLow
      0086E3 5B 03            [ 2]  122 	addw	sp, #3
                                    123 ;	user/sw_uart.c: 36: Vcomdelay(DELAYTIME);          
      0086E5 CE 00 7E         [ 2]  124 	ldw	x, _DELAYTIME+0
      0086E8 89               [ 2]  125 	pushw	x
      0086E9 CD 86 92         [ 4]  126 	call	_Vcomdelay
      0086EC 85               [ 2]  127 	popw	x
                                    128 ;	user/sw_uart.c: 37: if (c&0x01) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME); 
      0086ED 7B 01            [ 1]  129 	ld	a, (0x01, sp)
      0086EF 44               [ 1]  130 	srl	a
      0086F0 24 0D            [ 1]  131 	jrnc	00102$
      0086F2 4B 20            [ 1]  132 	push	#0x20
      0086F4 4B 0F            [ 1]  133 	push	#0x0f
      0086F6 4B 50            [ 1]  134 	push	#0x50
      0086F8 CD 8C 17         [ 4]  135 	call	_GPIO_WriteHigh
      0086FB 5B 03            [ 2]  136 	addw	sp, #3
      0086FD 20 0B            [ 2]  137 	jra	00103$
      0086FF                        138 00102$:
      0086FF 4B 20            [ 1]  139 	push	#0x20
      008701 4B 0F            [ 1]  140 	push	#0x0f
      008703 4B 50            [ 1]  141 	push	#0x50
      008705 CD 8C 1E         [ 4]  142 	call	_GPIO_WriteLow
      008708 5B 03            [ 2]  143 	addw	sp, #3
      00870A                        144 00103$:
      00870A CE 00 7E         [ 2]  145 	ldw	x, _DELAYTIME+0
      00870D 89               [ 2]  146 	pushw	x
      00870E CD 86 92         [ 4]  147 	call	_Vcomdelay
      008711 85               [ 2]  148 	popw	x
                                    149 ;	user/sw_uart.c: 38: if (c&0x02) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008712 7B 01            [ 1]  150 	ld	a, (0x01, sp)
      008714 A5 02            [ 1]  151 	bcp	a, #0x02
      008716 27 0D            [ 1]  152 	jreq	00105$
      008718 4B 20            [ 1]  153 	push	#0x20
      00871A 4B 0F            [ 1]  154 	push	#0x0f
      00871C 4B 50            [ 1]  155 	push	#0x50
      00871E CD 8C 17         [ 4]  156 	call	_GPIO_WriteHigh
      008721 5B 03            [ 2]  157 	addw	sp, #3
      008723 20 0B            [ 2]  158 	jra	00106$
      008725                        159 00105$:
      008725 4B 20            [ 1]  160 	push	#0x20
      008727 4B 0F            [ 1]  161 	push	#0x0f
      008729 4B 50            [ 1]  162 	push	#0x50
      00872B CD 8C 1E         [ 4]  163 	call	_GPIO_WriteLow
      00872E 5B 03            [ 2]  164 	addw	sp, #3
      008730                        165 00106$:
      008730 CE 00 7E         [ 2]  166 	ldw	x, _DELAYTIME+0
      008733 89               [ 2]  167 	pushw	x
      008734 CD 86 92         [ 4]  168 	call	_Vcomdelay
      008737 85               [ 2]  169 	popw	x
                                    170 ;	user/sw_uart.c: 39: if (c&0x04) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008738 7B 01            [ 1]  171 	ld	a, (0x01, sp)
      00873A A5 04            [ 1]  172 	bcp	a, #0x04
      00873C 27 0D            [ 1]  173 	jreq	00108$
      00873E 4B 20            [ 1]  174 	push	#0x20
      008740 4B 0F            [ 1]  175 	push	#0x0f
      008742 4B 50            [ 1]  176 	push	#0x50
      008744 CD 8C 17         [ 4]  177 	call	_GPIO_WriteHigh
      008747 5B 03            [ 2]  178 	addw	sp, #3
      008749 20 0B            [ 2]  179 	jra	00109$
      00874B                        180 00108$:
      00874B 4B 20            [ 1]  181 	push	#0x20
      00874D 4B 0F            [ 1]  182 	push	#0x0f
      00874F 4B 50            [ 1]  183 	push	#0x50
      008751 CD 8C 1E         [ 4]  184 	call	_GPIO_WriteLow
      008754 5B 03            [ 2]  185 	addw	sp, #3
      008756                        186 00109$:
      008756 CE 00 7E         [ 2]  187 	ldw	x, _DELAYTIME+0
      008759 89               [ 2]  188 	pushw	x
      00875A CD 86 92         [ 4]  189 	call	_Vcomdelay
      00875D 85               [ 2]  190 	popw	x
                                    191 ;	user/sw_uart.c: 40: if (c&0x08) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      00875E 7B 01            [ 1]  192 	ld	a, (0x01, sp)
      008760 A5 08            [ 1]  193 	bcp	a, #0x08
      008762 27 0D            [ 1]  194 	jreq	00111$
      008764 4B 20            [ 1]  195 	push	#0x20
      008766 4B 0F            [ 1]  196 	push	#0x0f
      008768 4B 50            [ 1]  197 	push	#0x50
      00876A CD 8C 17         [ 4]  198 	call	_GPIO_WriteHigh
      00876D 5B 03            [ 2]  199 	addw	sp, #3
      00876F 20 0B            [ 2]  200 	jra	00112$
      008771                        201 00111$:
      008771 4B 20            [ 1]  202 	push	#0x20
      008773 4B 0F            [ 1]  203 	push	#0x0f
      008775 4B 50            [ 1]  204 	push	#0x50
      008777 CD 8C 1E         [ 4]  205 	call	_GPIO_WriteLow
      00877A 5B 03            [ 2]  206 	addw	sp, #3
      00877C                        207 00112$:
      00877C CE 00 7E         [ 2]  208 	ldw	x, _DELAYTIME+0
      00877F 89               [ 2]  209 	pushw	x
      008780 CD 86 92         [ 4]  210 	call	_Vcomdelay
      008783 85               [ 2]  211 	popw	x
                                    212 ;	user/sw_uart.c: 41: if (c&0x10) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      008784 7B 01            [ 1]  213 	ld	a, (0x01, sp)
      008786 A5 10            [ 1]  214 	bcp	a, #0x10
      008788 27 0D            [ 1]  215 	jreq	00114$
      00878A 4B 20            [ 1]  216 	push	#0x20
      00878C 4B 0F            [ 1]  217 	push	#0x0f
      00878E 4B 50            [ 1]  218 	push	#0x50
      008790 CD 8C 17         [ 4]  219 	call	_GPIO_WriteHigh
      008793 5B 03            [ 2]  220 	addw	sp, #3
      008795 20 0B            [ 2]  221 	jra	00115$
      008797                        222 00114$:
      008797 4B 20            [ 1]  223 	push	#0x20
      008799 4B 0F            [ 1]  224 	push	#0x0f
      00879B 4B 50            [ 1]  225 	push	#0x50
      00879D CD 8C 1E         [ 4]  226 	call	_GPIO_WriteLow
      0087A0 5B 03            [ 2]  227 	addw	sp, #3
      0087A2                        228 00115$:
      0087A2 CE 00 7E         [ 2]  229 	ldw	x, _DELAYTIME+0
      0087A5 89               [ 2]  230 	pushw	x
      0087A6 CD 86 92         [ 4]  231 	call	_Vcomdelay
      0087A9 85               [ 2]  232 	popw	x
                                    233 ;	user/sw_uart.c: 42: if (c&0x20) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0087AA 7B 01            [ 1]  234 	ld	a, (0x01, sp)
      0087AC A5 20            [ 1]  235 	bcp	a, #0x20
      0087AE 27 0D            [ 1]  236 	jreq	00117$
      0087B0 4B 20            [ 1]  237 	push	#0x20
      0087B2 4B 0F            [ 1]  238 	push	#0x0f
      0087B4 4B 50            [ 1]  239 	push	#0x50
      0087B6 CD 8C 17         [ 4]  240 	call	_GPIO_WriteHigh
      0087B9 5B 03            [ 2]  241 	addw	sp, #3
      0087BB 20 0B            [ 2]  242 	jra	00118$
      0087BD                        243 00117$:
      0087BD 4B 20            [ 1]  244 	push	#0x20
      0087BF 4B 0F            [ 1]  245 	push	#0x0f
      0087C1 4B 50            [ 1]  246 	push	#0x50
      0087C3 CD 8C 1E         [ 4]  247 	call	_GPIO_WriteLow
      0087C6 5B 03            [ 2]  248 	addw	sp, #3
      0087C8                        249 00118$:
      0087C8 CE 00 7E         [ 2]  250 	ldw	x, _DELAYTIME+0
      0087CB 89               [ 2]  251 	pushw	x
      0087CC CD 86 92         [ 4]  252 	call	_Vcomdelay
      0087CF 85               [ 2]  253 	popw	x
                                    254 ;	user/sw_uart.c: 43: if (c&0x40) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0087D0 7B 01            [ 1]  255 	ld	a, (0x01, sp)
      0087D2 A5 40            [ 1]  256 	bcp	a, #0x40
      0087D4 27 0D            [ 1]  257 	jreq	00120$
      0087D6 4B 20            [ 1]  258 	push	#0x20
      0087D8 4B 0F            [ 1]  259 	push	#0x0f
      0087DA 4B 50            [ 1]  260 	push	#0x50
      0087DC CD 8C 17         [ 4]  261 	call	_GPIO_WriteHigh
      0087DF 5B 03            [ 2]  262 	addw	sp, #3
      0087E1 20 0B            [ 2]  263 	jra	00121$
      0087E3                        264 00120$:
      0087E3 4B 20            [ 1]  265 	push	#0x20
      0087E5 4B 0F            [ 1]  266 	push	#0x0f
      0087E7 4B 50            [ 1]  267 	push	#0x50
      0087E9 CD 8C 1E         [ 4]  268 	call	_GPIO_WriteLow
      0087EC 5B 03            [ 2]  269 	addw	sp, #3
      0087EE                        270 00121$:
      0087EE CE 00 7E         [ 2]  271 	ldw	x, _DELAYTIME+0
      0087F1 89               [ 2]  272 	pushw	x
      0087F2 CD 86 92         [ 4]  273 	call	_Vcomdelay
      0087F5 85               [ 2]  274 	popw	x
                                    275 ;	user/sw_uart.c: 44: if (c&0x80) vTx_H(); else vTx_L();   Vcomdelay(DELAYTIME);
      0087F6 0D 01            [ 1]  276 	tnz	(0x01, sp)
      0087F8 2A 0D            [ 1]  277 	jrpl	00123$
      0087FA 4B 20            [ 1]  278 	push	#0x20
      0087FC 4B 0F            [ 1]  279 	push	#0x0f
      0087FE 4B 50            [ 1]  280 	push	#0x50
      008800 CD 8C 17         [ 4]  281 	call	_GPIO_WriteHigh
      008803 5B 03            [ 2]  282 	addw	sp, #3
      008805 20 0B            [ 2]  283 	jra	00124$
      008807                        284 00123$:
      008807 4B 20            [ 1]  285 	push	#0x20
      008809 4B 0F            [ 1]  286 	push	#0x0f
      00880B 4B 50            [ 1]  287 	push	#0x50
      00880D CD 8C 1E         [ 4]  288 	call	_GPIO_WriteLow
      008810 5B 03            [ 2]  289 	addw	sp, #3
      008812                        290 00124$:
      008812 CE 00 7E         [ 2]  291 	ldw	x, _DELAYTIME+0
      008815 89               [ 2]  292 	pushw	x
      008816 CD 86 92         [ 4]  293 	call	_Vcomdelay
      008819 85               [ 2]  294 	popw	x
                                    295 ;	user/sw_uart.c: 45: vTx_H();                                             // stop bit    (1.5bit for sure)
      00881A 4B 20            [ 1]  296 	push	#0x20
      00881C 4B 0F            [ 1]  297 	push	#0x0f
      00881E 4B 50            [ 1]  298 	push	#0x50
      008820 CD 8C 17         [ 4]  299 	call	_GPIO_WriteHigh
      008823 5B 03            [ 2]  300 	addw	sp, #3
                                    301 ;	user/sw_uart.c: 46: Vcomdelay(DELAYTIME<<1);             
      008825 CE 00 7E         [ 2]  302 	ldw	x, _DELAYTIME+0
      008828 58               [ 2]  303 	sllw	x
      008829 89               [ 2]  304 	pushw	x
      00882A CD 86 92         [ 4]  305 	call	_Vcomdelay
      00882D 85               [ 2]  306 	popw	x
                                    307 ;	user/sw_uart.c: 47: str++;
      00882E 1E 04            [ 2]  308 	ldw	x, (0x04, sp)
      008830 5C               [ 2]  309 	incw	x
      008831 1F 04            [ 2]  310 	ldw	(0x04, sp), x
      008833 CC 86 C1         [ 2]  311 	jp	00126$
      008836                        312 00128$:
                                    313 ;	user/sw_uart.c: 49: enableInterrupts();
      008836 9A               [ 1]  314 	rim
      008837 5B 05            [ 2]  315 	addw	sp, #5
      008839 81               [ 4]  316 	ret
                                    317 ;	user/sw_uart.c: 52: void delaytest(uint32_t x)
                                    318 ;	-----------------------------------------
                                    319 ;	 function delaytest
                                    320 ;	-----------------------------------------
      00883A                        321 _delaytest:
      00883A 52 10            [ 2]  322 	sub	sp, #16
                                    323 ;	user/sw_uart.c: 55: while(x--)
      00883C 16 13            [ 2]  324 	ldw	y, (0x13, sp)
      00883E 17 0D            [ 2]  325 	ldw	(0x0d, sp), y
      008840 16 15            [ 2]  326 	ldw	y, (0x15, sp)
      008842                        327 00102$:
      008842 17 07            [ 2]  328 	ldw	(0x07, sp), y
      008844 1E 0D            [ 2]  329 	ldw	x, (0x0d, sp)
      008846 1F 05            [ 2]  330 	ldw	(0x05, sp), x
      008848 72 A2 00 01      [ 2]  331 	subw	y, #0x0001
      00884C 7B 0E            [ 1]  332 	ld	a, (0x0e, sp)
      00884E A2 00            [ 1]  333 	sbc	a, #0x00
      008850 6B 0E            [ 1]  334 	ld	(0x0e, sp), a
      008852 7B 0D            [ 1]  335 	ld	a, (0x0d, sp)
      008854 A2 00            [ 1]  336 	sbc	a, #0x00
      008856 6B 0D            [ 1]  337 	ld	(0x0d, sp), a
      008858 1E 07            [ 2]  338 	ldw	x, (0x07, sp)
      00885A 26 04            [ 1]  339 	jrne	00126$
      00885C 1E 05            [ 2]  340 	ldw	x, (0x05, sp)
      00885E 27 34            [ 1]  341 	jreq	00108$
      008860                        342 00126$:
      008860 1E 03            [ 2]  343 	ldw	x, (0x03, sp)
      008862 1F 0B            [ 2]  344 	ldw	(0x0b, sp), x
      008864 1E 01            [ 2]  345 	ldw	x, (0x01, sp)
      008866 1F 09            [ 2]  346 	ldw	(0x09, sp), x
      008868                        347 00106$:
                                    348 ;	user/sw_uart.c: 57: for(;i<3000;i++);
      008868 1E 0B            [ 2]  349 	ldw	x, (0x0b, sp)
      00886A A3 0B B8         [ 2]  350 	cpw	x, #0x0bb8
      00886D 7B 0A            [ 1]  351 	ld	a, (0x0a, sp)
      00886F A2 00            [ 1]  352 	sbc	a, #0x00
      008871 7B 09            [ 1]  353 	ld	a, (0x09, sp)
      008873 A2 00            [ 1]  354 	sbc	a, #0x00
      008875 24 CB            [ 1]  355 	jrnc	00102$
      008877 1E 0B            [ 2]  356 	ldw	x, (0x0b, sp)
      008879 1C 00 01         [ 2]  357 	addw	x, #0x0001
      00887C 1F 0B            [ 2]  358 	ldw	(0x0b, sp), x
      00887E 7B 0A            [ 1]  359 	ld	a, (0x0a, sp)
      008880 A9 00            [ 1]  360 	adc	a, #0x00
      008882 6B 0A            [ 1]  361 	ld	(0x0a, sp), a
      008884 7B 09            [ 1]  362 	ld	a, (0x09, sp)
      008886 A9 00            [ 1]  363 	adc	a, #0x00
      008888 6B 09            [ 1]  364 	ld	(0x09, sp), a
      00888A 1E 0B            [ 2]  365 	ldw	x, (0x0b, sp)
      00888C 1F 03            [ 2]  366 	ldw	(0x03, sp), x
      00888E 1E 09            [ 2]  367 	ldw	x, (0x09, sp)
      008890 1F 01            [ 2]  368 	ldw	(0x01, sp), x
      008892 20 D4            [ 2]  369 	jra	00106$
      008894                        370 00108$:
      008894 5B 10            [ 2]  371 	addw	sp, #16
      008896 81               [ 4]  372 	ret
                                    373 ;	user/sw_uart.c: 61: void VCOM_TestSpeed(void)
                                    374 ;	-----------------------------------------
                                    375 ;	 function VCOM_TestSpeed
                                    376 ;	-----------------------------------------
      008897                        377 _VCOM_TestSpeed:
      008897 52 08            [ 2]  378 	sub	sp, #8
                                    379 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      008899                        380 00109$:
      008899 AE 89 01         [ 2]  381 	ldw	x, #___str_0+0
      00889C 1F 03            [ 2]  382 	ldw	(0x03, sp), x
      00889E AE 00 57         [ 2]  383 	ldw	x, #_vcomstr+0
      0088A1 1F 07            [ 2]  384 	ldw	(0x07, sp), x
      0088A3 16 07            [ 2]  385 	ldw	y, (0x07, sp)
      0088A5 17 05            [ 2]  386 	ldw	(0x05, sp), y
      0088A7 AE 00 FA         [ 2]  387 	ldw	x, #0x00fa
      0088AA 1F 01            [ 2]  388 	ldw	(0x01, sp), x
      0088AC                        389 00105$:
                                    390 ;	user/sw_uart.c: 68: DELAYTIME = i;  
      0088AC 7B 02            [ 1]  391 	ld	a, (0x02, sp)
      0088AE C7 00 7F         [ 1]  392 	ld	_DELAYTIME+1, a
      0088B1 7B 01            [ 1]  393 	ld	a, (0x01, sp)
      0088B3 C7 00 7E         [ 1]  394 	ld	_DELAYTIME+0, a
                                    395 ;	user/sw_uart.c: 69: vTx_H();
      0088B6 4B 20            [ 1]  396 	push	#0x20
      0088B8 4B 0F            [ 1]  397 	push	#0x0f
      0088BA 4B 50            [ 1]  398 	push	#0x50
      0088BC CD 8C 17         [ 4]  399 	call	_GPIO_WriteHigh
      0088BF 5B 03            [ 2]  400 	addw	sp, #3
                                    401 ;	user/sw_uart.c: 70: delaytest(10000); 
      0088C1 4B 10            [ 1]  402 	push	#0x10
      0088C3 4B 27            [ 1]  403 	push	#0x27
      0088C5 5F               [ 1]  404 	clrw	x
      0088C6 89               [ 2]  405 	pushw	x
      0088C7 CD 88 3A         [ 4]  406 	call	_delaytest
      0088CA 5B 04            [ 2]  407 	addw	sp, #4
                                    408 ;	user/sw_uart.c: 71: VCOM_sprintf(vcomstr,"VCOM at %d TESTING SPEED\r\n",i);
      0088CC 16 03            [ 2]  409 	ldw	y, (0x03, sp)
      0088CE 1E 07            [ 2]  410 	ldw	x, (0x07, sp)
      0088D0 7B 02            [ 1]  411 	ld	a, (0x02, sp)
      0088D2 88               [ 1]  412 	push	a
      0088D3 7B 02            [ 1]  413 	ld	a, (0x02, sp)
      0088D5 88               [ 1]  414 	push	a
      0088D6 90 89            [ 2]  415 	pushw	y
      0088D8 89               [ 2]  416 	pushw	x
      0088D9 CD 8E 85         [ 4]  417 	call	_sprintf
      0088DC 5B 06            [ 2]  418 	addw	sp, #6
                                    419 ;	user/sw_uart.c: 72: VCOM_puts(vcomstr); 
      0088DE 1E 05            [ 2]  420 	ldw	x, (0x05, sp)
      0088E0 89               [ 2]  421 	pushw	x
      0088E1 CD 86 B5         [ 4]  422 	call	_VCOM_puts
      0088E4 85               [ 2]  423 	popw	x
                                    424 ;	user/sw_uart.c: 73: vTx_L(); 
      0088E5 4B 20            [ 1]  425 	push	#0x20
      0088E7 4B 0F            [ 1]  426 	push	#0x0f
      0088E9 4B 50            [ 1]  427 	push	#0x50
      0088EB CD 8C 1E         [ 4]  428 	call	_GPIO_WriteLow
      0088EE 5B 03            [ 2]  429 	addw	sp, #3
                                    430 ;	user/sw_uart.c: 66: for(i=250;i>=1;i--)
      0088F0 1E 01            [ 2]  431 	ldw	x, (0x01, sp)
      0088F2 5A               [ 2]  432 	decw	x
      0088F3 1F 01            [ 2]  433 	ldw	(0x01, sp), x
      0088F5 1E 01            [ 2]  434 	ldw	x, (0x01, sp)
      0088F7 A3 00 01         [ 2]  435 	cpw	x, #0x0001
      0088FA 2E B0            [ 1]  436 	jrsge	00105$
      0088FC 20 9B            [ 2]  437 	jra	00109$
      0088FE 5B 08            [ 2]  438 	addw	sp, #8
      008900 81               [ 4]  439 	ret
                                    440 	.area CODE
      008901                        441 ___str_0:
      008901 56 43 4F 4D 20 61 74   442 	.ascii "VCOM at %d TESTING SPEED"
             20 25 64 20 54 45 53
             54 49 4E 47 20 53 50
             45 45 44
      008919 0D                     443 	.db 0x0d
      00891A 0A                     444 	.db 0x0a
      00891B 00                     445 	.db 0x00
                                    446 	.area INITIALIZER
      00966C                        447 __xinit__DELAYTIME:
      00966C 00 E6                  448 	.dw #0x00e6
                                    449 	.area CABS (ABS)
