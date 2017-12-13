                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _delay
                                     13 	.globl _DrawEx
                                     14 	.globl _Screen
                                     15 	.globl _Init
                                     16 	.globl _MaxMatrix
                                     17 	.globl _CLK_Config
                                     18 ;--------------------------------------------------------
                                     19 ; ram data
                                     20 ;--------------------------------------------------------
                                     21 	.area DATA
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area INITIALIZED
                                     26 ;--------------------------------------------------------
                                     27 ; Stack segment in internal ram 
                                     28 ;--------------------------------------------------------
                                     29 	.area	SSEG
      009138                         30 __start__stack:
      009138                         31 	.ds	1
                                     32 
                                     33 ;--------------------------------------------------------
                                     34 ; absolute external ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area DABS (ABS)
                                     37 ;--------------------------------------------------------
                                     38 ; interrupt vector 
                                     39 ;--------------------------------------------------------
                                     40 	.area HOME
      008000                         41 __interrupt_vect:
      008000 82 00 80 83             42 	int s_GSINIT ;reset
      008004 82 00 00 00             43 	int 0x0000 ;trap
      008008 82 00 00 00             44 	int 0x0000 ;int0
      00800C 82 00 00 00             45 	int 0x0000 ;int1
      008010 82 00 00 00             46 	int 0x0000 ;int2
      008014 82 00 00 00             47 	int 0x0000 ;int3
      008018 82 00 00 00             48 	int 0x0000 ;int4
      00801C 82 00 00 00             49 	int 0x0000 ;int5
      008020 82 00 00 00             50 	int 0x0000 ;int6
      008024 82 00 00 00             51 	int 0x0000 ;int7
      008028 82 00 00 00             52 	int 0x0000 ;int8
      00802C 82 00 00 00             53 	int 0x0000 ;int9
      008030 82 00 00 00             54 	int 0x0000 ;int10
      008034 82 00 00 00             55 	int 0x0000 ;int11
      008038 82 00 00 00             56 	int 0x0000 ;int12
      00803C 82 00 00 00             57 	int 0x0000 ;int13
      008040 82 00 00 00             58 	int 0x0000 ;int14
      008044 82 00 00 00             59 	int 0x0000 ;int15
      008048 82 00 00 00             60 	int 0x0000 ;int16
      00804C 82 00 00 00             61 	int 0x0000 ;int17
      008050 82 00 00 00             62 	int 0x0000 ;int18
      008054 82 00 00 00             63 	int 0x0000 ;int19
      008058 82 00 00 00             64 	int 0x0000 ;int20
      00805C 82 00 00 00             65 	int 0x0000 ;int21
      008060 82 00 00 00             66 	int 0x0000 ;int22
      008064 82 00 00 00             67 	int 0x0000 ;int23
      008068 82 00 00 00             68 	int 0x0000 ;int24
      00806C 82 00 00 00             69 	int 0x0000 ;int25
      008070 82 00 00 00             70 	int 0x0000 ;int26
      008074 82 00 00 00             71 	int 0x0000 ;int27
      008078 82 00 00 00             72 	int 0x0000 ;int28
      00807C 82 00 00 00             73 	int 0x0000 ;int29
                                     74 ;--------------------------------------------------------
                                     75 ; global & static initialisations
                                     76 ;--------------------------------------------------------
                                     77 	.area HOME
                                     78 	.area GSINIT
                                     79 	.area GSFINAL
                                     80 	.area GSINIT
      008083                         81 __sdcc_gs_init_startup:
      008083                         82 __sdcc_init_data:
                                     83 ; stm8_genXINIT() start
      008083 AE 00 5F         [ 2]   84 	ldw x, #l_DATA
      008086 27 07            [ 1]   85 	jreq	00002$
      008088                         86 00001$:
      008088 72 4F 00 00      [ 1]   87 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   88 	decw x
      00808D 26 F9            [ 1]   89 	jrne	00001$
      00808F                         90 00002$:
      00808F AE 00 00         [ 2]   91 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   92 	jreq	00004$
      008094                         93 00003$:
      008094 D6 91 37         [ 1]   94 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 5F         [ 1]   95 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   96 	decw	x
      00809B 26 F7            [ 1]   97 	jrne	00003$
      00809D                         98 00004$:
                                     99 ; stm8_genXINIT() end
                                    100 	.area GSFINAL
      00809D CC 80 80         [ 2]  101 	jp	__sdcc_program_startup
                                    102 ;--------------------------------------------------------
                                    103 ; Home
                                    104 ;--------------------------------------------------------
                                    105 	.area HOME
                                    106 	.area HOME
      008080                        107 __sdcc_program_startup:
      008080 CC 85 AC         [ 2]  108 	jp	_main
                                    109 ;	return from main will return to caller
                                    110 ;--------------------------------------------------------
                                    111 ; code
                                    112 ;--------------------------------------------------------
                                    113 	.area CODE
                                    114 ;	user/main.c: 25: void delay(uint16_t x)
                                    115 ;	-----------------------------------------
                                    116 ;	 function delay
                                    117 ;	-----------------------------------------
      0085A0                        118 _delay:
      0085A0 89               [ 2]  119 	pushw	x
                                    120 ;	user/main.c: 27: while(x--);
      0085A1 1E 05            [ 2]  121 	ldw	x, (0x05, sp)
      0085A3                        122 00101$:
      0085A3 1F 01            [ 2]  123 	ldw	(0x01, sp), x
      0085A5 5A               [ 2]  124 	decw	x
      0085A6 16 01            [ 2]  125 	ldw	y, (0x01, sp)
      0085A8 26 F9            [ 1]  126 	jrne	00101$
      0085AA 85               [ 2]  127 	popw	x
      0085AB 81               [ 4]  128 	ret
                                    129 ;	user/main.c: 31: void main() 
                                    130 ;	-----------------------------------------
                                    131 ;	 function main
                                    132 ;	-----------------------------------------
      0085AC                        133 _main:
      0085AC 52 6C            [ 2]  134 	sub	sp, #108
                                    135 ;	user/main.c: 34: const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0085AE 96               [ 1]  136 	ldw	x, sp
      0085AF 1C 00 09         [ 2]  137 	addw	x, #9
      0085B2 1F 6B            [ 2]  138 	ldw	(0x6b, sp), x
      0085B4 1E 6B            [ 2]  139 	ldw	x, (0x6b, sp)
      0085B6 7F               [ 1]  140 	clr	(x)
      0085B7 1E 6B            [ 2]  141 	ldw	x, (0x6b, sp)
      0085B9 5C               [ 2]  142 	incw	x
      0085BA 7F               [ 1]  143 	clr	(x)
      0085BB 1E 6B            [ 2]  144 	ldw	x, (0x6b, sp)
      0085BD 5C               [ 2]  145 	incw	x
      0085BE 5C               [ 2]  146 	incw	x
      0085BF 7F               [ 1]  147 	clr	(x)
      0085C0 1E 6B            [ 2]  148 	ldw	x, (0x6b, sp)
      0085C2 1C 00 03         [ 2]  149 	addw	x, #0x0003
      0085C5 7F               [ 1]  150 	clr	(x)
      0085C6 1E 6B            [ 2]  151 	ldw	x, (0x6b, sp)
      0085C8 1C 00 04         [ 2]  152 	addw	x, #0x0004
      0085CB 7F               [ 1]  153 	clr	(x)
      0085CC 1E 6B            [ 2]  154 	ldw	x, (0x6b, sp)
      0085CE 1C 00 05         [ 2]  155 	addw	x, #0x0005
      0085D1 7F               [ 1]  156 	clr	(x)
      0085D2 1E 6B            [ 2]  157 	ldw	x, (0x6b, sp)
      0085D4 1C 00 06         [ 2]  158 	addw	x, #0x0006
      0085D7 7F               [ 1]  159 	clr	(x)
      0085D8 1E 6B            [ 2]  160 	ldw	x, (0x6b, sp)
      0085DA 1C 00 07         [ 2]  161 	addw	x, #0x0007
      0085DD 7F               [ 1]  162 	clr	(x)
      0085DE 1E 6B            [ 2]  163 	ldw	x, (0x6b, sp)
      0085E0 1C 00 08         [ 2]  164 	addw	x, #0x0008
      0085E3 7F               [ 1]  165 	clr	(x)
      0085E4 1E 6B            [ 2]  166 	ldw	x, (0x6b, sp)
      0085E6 A6 7E            [ 1]  167 	ld	a, #0x7e
      0085E8 E7 09            [ 1]  168 	ld	(0x0009, x), a
      0085EA 1E 6B            [ 2]  169 	ldw	x, (0x6b, sp)
      0085EC A6 04            [ 1]  170 	ld	a, #0x04
      0085EE E7 0A            [ 1]  171 	ld	(0x000a, x), a
      0085F0 1E 6B            [ 2]  172 	ldw	x, (0x6b, sp)
      0085F2 A6 08            [ 1]  173 	ld	a, #0x08
      0085F4 E7 0B            [ 1]  174 	ld	(0x000b, x), a
      0085F6 1E 6B            [ 2]  175 	ldw	x, (0x6b, sp)
      0085F8 A6 08            [ 1]  176 	ld	a, #0x08
      0085FA E7 0C            [ 1]  177 	ld	(0x000c, x), a
      0085FC 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      0085FE A6 04            [ 1]  179 	ld	a, #0x04
      008600 E7 0D            [ 1]  180 	ld	(0x000d, x), a
      008602 1E 6B            [ 2]  181 	ldw	x, (0x6b, sp)
      008604 A6 7E            [ 1]  182 	ld	a, #0x7e
      008606 E7 0E            [ 1]  183 	ld	(0x000e, x), a
      008608 1E 6B            [ 2]  184 	ldw	x, (0x6b, sp)
      00860A 1C 00 0F         [ 2]  185 	addw	x, #0x000f
      00860D 7F               [ 1]  186 	clr	(x)
      00860E 1E 6B            [ 2]  187 	ldw	x, (0x6b, sp)
      008610 1C 00 10         [ 2]  188 	addw	x, #0x0010
      008613 7F               [ 1]  189 	clr	(x)
      008614 1E 6B            [ 2]  190 	ldw	x, (0x6b, sp)
      008616 A6 42            [ 1]  191 	ld	a, #0x42
      008618 E7 11            [ 1]  192 	ld	(0x0011, x), a
      00861A 1E 6B            [ 2]  193 	ldw	x, (0x6b, sp)
      00861C A6 42            [ 1]  194 	ld	a, #0x42
      00861E E7 12            [ 1]  195 	ld	(0x0012, x), a
      008620 1E 6B            [ 2]  196 	ldw	x, (0x6b, sp)
      008622 A6 7E            [ 1]  197 	ld	a, #0x7e
      008624 E7 13            [ 1]  198 	ld	(0x0013, x), a
      008626 1E 6B            [ 2]  199 	ldw	x, (0x6b, sp)
      008628 A6 7E            [ 1]  200 	ld	a, #0x7e
      00862A E7 14            [ 1]  201 	ld	(0x0014, x), a
      00862C 1E 6B            [ 2]  202 	ldw	x, (0x6b, sp)
      00862E A6 42            [ 1]  203 	ld	a, #0x42
      008630 E7 15            [ 1]  204 	ld	(0x0015, x), a
      008632 1E 6B            [ 2]  205 	ldw	x, (0x6b, sp)
      008634 A6 42            [ 1]  206 	ld	a, #0x42
      008636 E7 16            [ 1]  207 	ld	(0x0016, x), a
      008638 1E 6B            [ 2]  208 	ldw	x, (0x6b, sp)
      00863A 1C 00 17         [ 2]  209 	addw	x, #0x0017
      00863D 7F               [ 1]  210 	clr	(x)
      00863E 1E 6B            [ 2]  211 	ldw	x, (0x6b, sp)
      008640 1C 00 18         [ 2]  212 	addw	x, #0x0018
      008643 7F               [ 1]  213 	clr	(x)
      008644 1E 6B            [ 2]  214 	ldw	x, (0x6b, sp)
      008646 A6 3C            [ 1]  215 	ld	a, #0x3c
      008648 E7 19            [ 1]  216 	ld	(0x0019, x), a
      00864A 1E 6B            [ 2]  217 	ldw	x, (0x6b, sp)
      00864C A6 42            [ 1]  218 	ld	a, #0x42
      00864E E7 1A            [ 1]  219 	ld	(0x001a, x), a
      008650 1E 6B            [ 2]  220 	ldw	x, (0x6b, sp)
      008652 A6 42            [ 1]  221 	ld	a, #0x42
      008654 E7 1B            [ 1]  222 	ld	(0x001b, x), a
      008656 1E 6B            [ 2]  223 	ldw	x, (0x6b, sp)
      008658 A6 42            [ 1]  224 	ld	a, #0x42
      00865A E7 1C            [ 1]  225 	ld	(0x001c, x), a
      00865C 1E 6B            [ 2]  226 	ldw	x, (0x6b, sp)
      00865E A6 42            [ 1]  227 	ld	a, #0x42
      008660 E7 1D            [ 1]  228 	ld	(0x001d, x), a
      008662 1E 6B            [ 2]  229 	ldw	x, (0x6b, sp)
      008664 A6 24            [ 1]  230 	ld	a, #0x24
      008666 E7 1E            [ 1]  231 	ld	(0x001e, x), a
      008668 1E 6B            [ 2]  232 	ldw	x, (0x6b, sp)
      00866A 1C 00 1F         [ 2]  233 	addw	x, #0x001f
      00866D 7F               [ 1]  234 	clr	(x)
      00866E 1E 6B            [ 2]  235 	ldw	x, (0x6b, sp)
      008670 1C 00 20         [ 2]  236 	addw	x, #0x0020
      008673 7F               [ 1]  237 	clr	(x)
      008674 1E 6B            [ 2]  238 	ldw	x, (0x6b, sp)
      008676 A6 7E            [ 1]  239 	ld	a, #0x7e
      008678 E7 21            [ 1]  240 	ld	(0x0021, x), a
      00867A 1E 6B            [ 2]  241 	ldw	x, (0x6b, sp)
      00867C A6 1A            [ 1]  242 	ld	a, #0x1a
      00867E E7 22            [ 1]  243 	ld	(0x0022, x), a
      008680 1E 6B            [ 2]  244 	ldw	x, (0x6b, sp)
      008682 A6 1A            [ 1]  245 	ld	a, #0x1a
      008684 E7 23            [ 1]  246 	ld	(0x0023, x), a
      008686 1E 6B            [ 2]  247 	ldw	x, (0x6b, sp)
      008688 A6 1A            [ 1]  248 	ld	a, #0x1a
      00868A E7 24            [ 1]  249 	ld	(0x0024, x), a
      00868C 1E 6B            [ 2]  250 	ldw	x, (0x6b, sp)
      00868E A6 2A            [ 1]  251 	ld	a, #0x2a
      008690 E7 25            [ 1]  252 	ld	(0x0025, x), a
      008692 1E 6B            [ 2]  253 	ldw	x, (0x6b, sp)
      008694 A6 44            [ 1]  254 	ld	a, #0x44
      008696 E7 26            [ 1]  255 	ld	(0x0026, x), a
      008698 1E 6B            [ 2]  256 	ldw	x, (0x6b, sp)
      00869A 1C 00 27         [ 2]  257 	addw	x, #0x0027
      00869D 7F               [ 1]  258 	clr	(x)
      00869E 1E 6B            [ 2]  259 	ldw	x, (0x6b, sp)
      0086A0 1C 00 28         [ 2]  260 	addw	x, #0x0028
      0086A3 7F               [ 1]  261 	clr	(x)
      0086A4 1E 6B            [ 2]  262 	ldw	x, (0x6b, sp)
      0086A6 A6 3C            [ 1]  263 	ld	a, #0x3c
      0086A8 E7 29            [ 1]  264 	ld	(0x0029, x), a
      0086AA 1E 6B            [ 2]  265 	ldw	x, (0x6b, sp)
      0086AC A6 42            [ 1]  266 	ld	a, #0x42
      0086AE E7 2A            [ 1]  267 	ld	(0x002a, x), a
      0086B0 1E 6B            [ 2]  268 	ldw	x, (0x6b, sp)
      0086B2 A6 42            [ 1]  269 	ld	a, #0x42
      0086B4 E7 2B            [ 1]  270 	ld	(0x002b, x), a
      0086B6 1E 6B            [ 2]  271 	ldw	x, (0x6b, sp)
      0086B8 A6 42            [ 1]  272 	ld	a, #0x42
      0086BA E7 2C            [ 1]  273 	ld	(0x002c, x), a
      0086BC 1E 6B            [ 2]  274 	ldw	x, (0x6b, sp)
      0086BE A6 42            [ 1]  275 	ld	a, #0x42
      0086C0 E7 2D            [ 1]  276 	ld	(0x002d, x), a
      0086C2 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      0086C4 A6 3C            [ 1]  278 	ld	a, #0x3c
      0086C6 E7 2E            [ 1]  279 	ld	(0x002e, x), a
      0086C8 1E 6B            [ 2]  280 	ldw	x, (0x6b, sp)
      0086CA 1C 00 2F         [ 2]  281 	addw	x, #0x002f
      0086CD 7F               [ 1]  282 	clr	(x)
      0086CE 1E 6B            [ 2]  283 	ldw	x, (0x6b, sp)
      0086D0 1C 00 30         [ 2]  284 	addw	x, #0x0030
      0086D3 7F               [ 1]  285 	clr	(x)
      0086D4 1E 6B            [ 2]  286 	ldw	x, (0x6b, sp)
      0086D6 A6 7C            [ 1]  287 	ld	a, #0x7c
      0086D8 E7 31            [ 1]  288 	ld	(0x0031, x), a
      0086DA 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      0086DC A6 12            [ 1]  290 	ld	a, #0x12
      0086DE E7 32            [ 1]  291 	ld	(0x0032, x), a
      0086E0 1E 6B            [ 2]  292 	ldw	x, (0x6b, sp)
      0086E2 A6 12            [ 1]  293 	ld	a, #0x12
      0086E4 E7 33            [ 1]  294 	ld	(0x0033, x), a
      0086E6 1E 6B            [ 2]  295 	ldw	x, (0x6b, sp)
      0086E8 A6 12            [ 1]  296 	ld	a, #0x12
      0086EA E7 34            [ 1]  297 	ld	(0x0034, x), a
      0086EC 1E 6B            [ 2]  298 	ldw	x, (0x6b, sp)
      0086EE A6 12            [ 1]  299 	ld	a, #0x12
      0086F0 E7 35            [ 1]  300 	ld	(0x0035, x), a
      0086F2 1E 6B            [ 2]  301 	ldw	x, (0x6b, sp)
      0086F4 A6 7C            [ 1]  302 	ld	a, #0x7c
      0086F6 E7 36            [ 1]  303 	ld	(0x0036, x), a
      0086F8 1E 6B            [ 2]  304 	ldw	x, (0x6b, sp)
      0086FA 1C 00 37         [ 2]  305 	addw	x, #0x0037
      0086FD 7F               [ 1]  306 	clr	(x)
      0086FE 1E 6B            [ 2]  307 	ldw	x, (0x6b, sp)
      008700 1C 00 38         [ 2]  308 	addw	x, #0x0038
      008703 7F               [ 1]  309 	clr	(x)
      008704 1E 6B            [ 2]  310 	ldw	x, (0x6b, sp)
      008706 A6 7E            [ 1]  311 	ld	a, #0x7e
      008708 E7 39            [ 1]  312 	ld	(0x0039, x), a
      00870A 1E 6B            [ 2]  313 	ldw	x, (0x6b, sp)
      00870C A6 1A            [ 1]  314 	ld	a, #0x1a
      00870E E7 3A            [ 1]  315 	ld	(0x003a, x), a
      008710 1E 6B            [ 2]  316 	ldw	x, (0x6b, sp)
      008712 A6 1A            [ 1]  317 	ld	a, #0x1a
      008714 E7 3B            [ 1]  318 	ld	(0x003b, x), a
      008716 1E 6B            [ 2]  319 	ldw	x, (0x6b, sp)
      008718 A6 1A            [ 1]  320 	ld	a, #0x1a
      00871A E7 3C            [ 1]  321 	ld	(0x003c, x), a
      00871C 1E 6B            [ 2]  322 	ldw	x, (0x6b, sp)
      00871E A6 2A            [ 1]  323 	ld	a, #0x2a
      008720 E7 3D            [ 1]  324 	ld	(0x003d, x), a
      008722 1E 6B            [ 2]  325 	ldw	x, (0x6b, sp)
      008724 A6 44            [ 1]  326 	ld	a, #0x44
      008726 E7 3E            [ 1]  327 	ld	(0x003e, x), a
      008728 1E 6B            [ 2]  328 	ldw	x, (0x6b, sp)
      00872A 1C 00 3F         [ 2]  329 	addw	x, #0x003f
      00872D 7F               [ 1]  330 	clr	(x)
      00872E 1E 6B            [ 2]  331 	ldw	x, (0x6b, sp)
      008730 1C 00 40         [ 2]  332 	addw	x, #0x0040
      008733 7F               [ 1]  333 	clr	(x)
      008734 1E 6B            [ 2]  334 	ldw	x, (0x6b, sp)
      008736 A6 7E            [ 1]  335 	ld	a, #0x7e
      008738 E7 41            [ 1]  336 	ld	(0x0041, x), a
      00873A 1E 6B            [ 2]  337 	ldw	x, (0x6b, sp)
      00873C A6 7E            [ 1]  338 	ld	a, #0x7e
      00873E E7 42            [ 1]  339 	ld	(0x0042, x), a
      008740 1E 6B            [ 2]  340 	ldw	x, (0x6b, sp)
      008742 A6 4A            [ 1]  341 	ld	a, #0x4a
      008744 E7 43            [ 1]  342 	ld	(0x0043, x), a
      008746 1E 6B            [ 2]  343 	ldw	x, (0x6b, sp)
      008748 A6 4A            [ 1]  344 	ld	a, #0x4a
      00874A E7 44            [ 1]  345 	ld	(0x0044, x), a
      00874C 1E 6B            [ 2]  346 	ldw	x, (0x6b, sp)
      00874E A6 4A            [ 1]  347 	ld	a, #0x4a
      008750 E7 45            [ 1]  348 	ld	(0x0045, x), a
      008752 1E 6B            [ 2]  349 	ldw	x, (0x6b, sp)
      008754 A6 42            [ 1]  350 	ld	a, #0x42
      008756 E7 46            [ 1]  351 	ld	(0x0046, x), a
      008758 1E 6B            [ 2]  352 	ldw	x, (0x6b, sp)
      00875A 1C 00 47         [ 2]  353 	addw	x, #0x0047
      00875D 7F               [ 1]  354 	clr	(x)
      00875E 1E 6B            [ 2]  355 	ldw	x, (0x6b, sp)
      008760 1C 00 48         [ 2]  356 	addw	x, #0x0048
      008763 7F               [ 1]  357 	clr	(x)
      008764 1E 6B            [ 2]  358 	ldw	x, (0x6b, sp)
      008766 A6 7E            [ 1]  359 	ld	a, #0x7e
      008768 E7 49            [ 1]  360 	ld	(0x0049, x), a
      00876A 1E 6B            [ 2]  361 	ldw	x, (0x6b, sp)
      00876C A6 04            [ 1]  362 	ld	a, #0x04
      00876E E7 4A            [ 1]  363 	ld	(0x004a, x), a
      008770 1E 6B            [ 2]  364 	ldw	x, (0x6b, sp)
      008772 A6 08            [ 1]  365 	ld	a, #0x08
      008774 E7 4B            [ 1]  366 	ld	(0x004b, x), a
      008776 1E 6B            [ 2]  367 	ldw	x, (0x6b, sp)
      008778 A6 10            [ 1]  368 	ld	a, #0x10
      00877A E7 4C            [ 1]  369 	ld	(0x004c, x), a
      00877C 1E 6B            [ 2]  370 	ldw	x, (0x6b, sp)
      00877E A6 20            [ 1]  371 	ld	a, #0x20
      008780 E7 4D            [ 1]  372 	ld	(0x004d, x), a
      008782 1E 6B            [ 2]  373 	ldw	x, (0x6b, sp)
      008784 A6 7E            [ 1]  374 	ld	a, #0x7e
      008786 E7 4E            [ 1]  375 	ld	(0x004e, x), a
      008788 1E 6B            [ 2]  376 	ldw	x, (0x6b, sp)
      00878A 1C 00 4F         [ 2]  377 	addw	x, #0x004f
      00878D 7F               [ 1]  378 	clr	(x)
      00878E 1E 6B            [ 2]  379 	ldw	x, (0x6b, sp)
      008790 1C 00 50         [ 2]  380 	addw	x, #0x0050
      008793 7F               [ 1]  381 	clr	(x)
      008794 1E 6B            [ 2]  382 	ldw	x, (0x6b, sp)
      008796 A6 7C            [ 1]  383 	ld	a, #0x7c
      008798 E7 51            [ 1]  384 	ld	(0x0051, x), a
      00879A 1E 6B            [ 2]  385 	ldw	x, (0x6b, sp)
      00879C A6 12            [ 1]  386 	ld	a, #0x12
      00879E E7 52            [ 1]  387 	ld	(0x0052, x), a
      0087A0 1E 6B            [ 2]  388 	ldw	x, (0x6b, sp)
      0087A2 A6 12            [ 1]  389 	ld	a, #0x12
      0087A4 E7 53            [ 1]  390 	ld	(0x0053, x), a
      0087A6 1E 6B            [ 2]  391 	ldw	x, (0x6b, sp)
      0087A8 A6 12            [ 1]  392 	ld	a, #0x12
      0087AA E7 54            [ 1]  393 	ld	(0x0054, x), a
      0087AC 1E 6B            [ 2]  394 	ldw	x, (0x6b, sp)
      0087AE A6 12            [ 1]  395 	ld	a, #0x12
      0087B0 E7 55            [ 1]  396 	ld	(0x0055, x), a
      0087B2 1E 6B            [ 2]  397 	ldw	x, (0x6b, sp)
      0087B4 A6 7C            [ 1]  398 	ld	a, #0x7c
      0087B6 E7 56            [ 1]  399 	ld	(0x0056, x), a
      0087B8 1E 6B            [ 2]  400 	ldw	x, (0x6b, sp)
      0087BA 1C 00 57         [ 2]  401 	addw	x, #0x0057
      0087BD 7F               [ 1]  402 	clr	(x)
      0087BE 1E 6B            [ 2]  403 	ldw	x, (0x6b, sp)
      0087C0 1C 00 58         [ 2]  404 	addw	x, #0x0058
      0087C3 7F               [ 1]  405 	clr	(x)
      0087C4 1E 6B            [ 2]  406 	ldw	x, (0x6b, sp)
      0087C6 1C 00 59         [ 2]  407 	addw	x, #0x0059
      0087C9 7F               [ 1]  408 	clr	(x)
      0087CA 1E 6B            [ 2]  409 	ldw	x, (0x6b, sp)
      0087CC 1C 00 5A         [ 2]  410 	addw	x, #0x005a
      0087CF 7F               [ 1]  411 	clr	(x)
      0087D0 1E 6B            [ 2]  412 	ldw	x, (0x6b, sp)
      0087D2 1C 00 5B         [ 2]  413 	addw	x, #0x005b
      0087D5 7F               [ 1]  414 	clr	(x)
      0087D6 1E 6B            [ 2]  415 	ldw	x, (0x6b, sp)
      0087D8 1C 00 5C         [ 2]  416 	addw	x, #0x005c
      0087DB 7F               [ 1]  417 	clr	(x)
      0087DC 1E 6B            [ 2]  418 	ldw	x, (0x6b, sp)
      0087DE 1C 00 5D         [ 2]  419 	addw	x, #0x005d
      0087E1 7F               [ 1]  420 	clr	(x)
      0087E2 1E 6B            [ 2]  421 	ldw	x, (0x6b, sp)
      0087E4 1C 00 5E         [ 2]  422 	addw	x, #0x005e
      0087E7 7F               [ 1]  423 	clr	(x)
      0087E8 1E 6B            [ 2]  424 	ldw	x, (0x6b, sp)
      0087EA 1C 00 5F         [ 2]  425 	addw	x, #0x005f
      0087ED 7F               [ 1]  426 	clr	(x)
                                    427 ;	user/main.c: 47: char smile[]={0x00, 0x7E, 0x04, 0x08, 0x08, 0x04, 0x7E, 0x00};
      0087EE 96               [ 1]  428 	ldw	x, sp
      0087EF 5C               [ 2]  429 	incw	x
      0087F0 1F 69            [ 2]  430 	ldw	(0x69, sp), x
      0087F2 1E 69            [ 2]  431 	ldw	x, (0x69, sp)
      0087F4 7F               [ 1]  432 	clr	(x)
      0087F5 1E 69            [ 2]  433 	ldw	x, (0x69, sp)
      0087F7 5C               [ 2]  434 	incw	x
      0087F8 A6 7E            [ 1]  435 	ld	a, #0x7e
      0087FA F7               [ 1]  436 	ld	(x), a
      0087FB 1E 69            [ 2]  437 	ldw	x, (0x69, sp)
      0087FD 5C               [ 2]  438 	incw	x
      0087FE 5C               [ 2]  439 	incw	x
      0087FF A6 04            [ 1]  440 	ld	a, #0x04
      008801 F7               [ 1]  441 	ld	(x), a
      008802 1E 69            [ 2]  442 	ldw	x, (0x69, sp)
      008804 A6 08            [ 1]  443 	ld	a, #0x08
      008806 E7 03            [ 1]  444 	ld	(0x0003, x), a
      008808 1E 69            [ 2]  445 	ldw	x, (0x69, sp)
      00880A A6 08            [ 1]  446 	ld	a, #0x08
      00880C E7 04            [ 1]  447 	ld	(0x0004, x), a
      00880E 1E 69            [ 2]  448 	ldw	x, (0x69, sp)
      008810 A6 04            [ 1]  449 	ld	a, #0x04
      008812 E7 05            [ 1]  450 	ld	(0x0005, x), a
      008814 1E 69            [ 2]  451 	ldw	x, (0x69, sp)
      008816 A6 7E            [ 1]  452 	ld	a, #0x7e
      008818 E7 06            [ 1]  453 	ld	(0x0006, x), a
      00881A 1E 69            [ 2]  454 	ldw	x, (0x69, sp)
      00881C 1C 00 07         [ 2]  455 	addw	x, #0x0007
      00881F 7F               [ 1]  456 	clr	(x)
                                    457 ;	user/main.c: 48: CLK_Config();
      008820 CD 8C B3         [ 4]  458 	call	_CLK_Config
                                    459 ;	user/main.c: 51: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
      008823 4B 04            [ 1]  460 	push	#0x04
      008825 4B 20            [ 1]  461 	push	#0x20
      008827 4B 10            [ 1]  462 	push	#0x10
      008829 4B 40            [ 1]  463 	push	#0x40
      00882B 4B 0A            [ 1]  464 	push	#0x0a
      00882D 4B 50            [ 1]  465 	push	#0x50
      00882F CD 88 58         [ 4]  466 	call	_MaxMatrix
      008832 5B 06            [ 2]  467 	addw	sp, #6
                                    468 ;	user/main.c: 52: Init();
      008834 CD 89 3E         [ 4]  469 	call	_Init
                                    470 ;	user/main.c: 53: Screen();
      008837 CD 89 AE         [ 4]  471 	call	_Screen
                                    472 ;	user/main.c: 57: DrawEx(8, text);
      00883A 1E 6B            [ 2]  473 	ldw	x, (0x6b, sp)
      00883C 89               [ 2]  474 	pushw	x
      00883D 4B 08            [ 1]  475 	push	#0x08
      00883F CD 8B 18         [ 4]  476 	call	_DrawEx
      008842 5B 03            [ 2]  477 	addw	sp, #3
                                    478 ;	user/main.c: 58: Screen();
      008844 CD 89 AE         [ 4]  479 	call	_Screen
                                    480 ;	user/main.c: 82: while(TRUE) 
      008847                        481 00102$:
      008847 20 FE            [ 2]  482 	jra	00102$
      008849 5B 6C            [ 2]  483 	addw	sp, #108
      00884B 81               [ 4]  484 	ret
                                    485 	.area CODE
                                    486 	.area INITIALIZER
                                    487 	.area CABS (ABS)
