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
      000080                         30 __start__stack:
      000080                         31 	.ds	1
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
      008083 AE 00 7D         [ 2]   84 	ldw x, #l_DATA
      008086 27 07            [ 1]   85 	jreq	00002$
      008088                         86 00001$:
      008088 72 4F 00 00      [ 1]   87 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   88 	decw x
      00808D 26 F9            [ 1]   89 	jrne	00001$
      00808F                         90 00002$:
      00808F AE 00 02         [ 2]   91 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   92 	jreq	00004$
      008094                         93 00003$:
      008094 D6 96 6B         [ 1]   94 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 7D         [ 1]   95 	ld	(s_INITIALIZED - 1, x), a
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
      008080 CC 80 AC         [ 2]  108 	jp	_main
                                    109 ;	return from main will return to caller
                                    110 ;--------------------------------------------------------
                                    111 ; code
                                    112 ;--------------------------------------------------------
                                    113 	.area CODE
                                    114 ;	user/main.c: 26: void delay(uint16_t x)
                                    115 ;	-----------------------------------------
                                    116 ;	 function delay
                                    117 ;	-----------------------------------------
      0080A0                        118 _delay:
      0080A0 89               [ 2]  119 	pushw	x
                                    120 ;	user/main.c: 28: while(x--);
      0080A1 1E 05            [ 2]  121 	ldw	x, (0x05, sp)
      0080A3                        122 00101$:
      0080A3 1F 01            [ 2]  123 	ldw	(0x01, sp), x
      0080A5 5A               [ 2]  124 	decw	x
      0080A6 16 01            [ 2]  125 	ldw	y, (0x01, sp)
      0080A8 26 F9            [ 1]  126 	jrne	00101$
      0080AA 85               [ 2]  127 	popw	x
      0080AB 81               [ 4]  128 	ret
                                    129 ;	user/main.c: 31: void main() 
                                    130 ;	-----------------------------------------
                                    131 ;	 function main
                                    132 ;	-----------------------------------------
      0080AC                        133 _main:
      0080AC 52 6C            [ 2]  134 	sub	sp, #108
                                    135 ;	user/main.c: 34: const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0080AE 96               [ 1]  136 	ldw	x, sp
      0080AF 1C 00 09         [ 2]  137 	addw	x, #9
      0080B2 1F 6B            [ 2]  138 	ldw	(0x6b, sp), x
      0080B4 1E 6B            [ 2]  139 	ldw	x, (0x6b, sp)
      0080B6 7F               [ 1]  140 	clr	(x)
      0080B7 1E 6B            [ 2]  141 	ldw	x, (0x6b, sp)
      0080B9 5C               [ 2]  142 	incw	x
      0080BA 7F               [ 1]  143 	clr	(x)
      0080BB 1E 6B            [ 2]  144 	ldw	x, (0x6b, sp)
      0080BD 5C               [ 2]  145 	incw	x
      0080BE 5C               [ 2]  146 	incw	x
      0080BF 7F               [ 1]  147 	clr	(x)
      0080C0 1E 6B            [ 2]  148 	ldw	x, (0x6b, sp)
      0080C2 1C 00 03         [ 2]  149 	addw	x, #0x0003
      0080C5 7F               [ 1]  150 	clr	(x)
      0080C6 1E 6B            [ 2]  151 	ldw	x, (0x6b, sp)
      0080C8 1C 00 04         [ 2]  152 	addw	x, #0x0004
      0080CB 7F               [ 1]  153 	clr	(x)
      0080CC 1E 6B            [ 2]  154 	ldw	x, (0x6b, sp)
      0080CE 1C 00 05         [ 2]  155 	addw	x, #0x0005
      0080D1 7F               [ 1]  156 	clr	(x)
      0080D2 1E 6B            [ 2]  157 	ldw	x, (0x6b, sp)
      0080D4 1C 00 06         [ 2]  158 	addw	x, #0x0006
      0080D7 7F               [ 1]  159 	clr	(x)
      0080D8 1E 6B            [ 2]  160 	ldw	x, (0x6b, sp)
      0080DA 1C 00 07         [ 2]  161 	addw	x, #0x0007
      0080DD 7F               [ 1]  162 	clr	(x)
      0080DE 1E 6B            [ 2]  163 	ldw	x, (0x6b, sp)
      0080E0 1C 00 08         [ 2]  164 	addw	x, #0x0008
      0080E3 7F               [ 1]  165 	clr	(x)
      0080E4 1E 6B            [ 2]  166 	ldw	x, (0x6b, sp)
      0080E6 A6 7E            [ 1]  167 	ld	a, #0x7e
      0080E8 E7 09            [ 1]  168 	ld	(0x0009, x), a
      0080EA 1E 6B            [ 2]  169 	ldw	x, (0x6b, sp)
      0080EC A6 04            [ 1]  170 	ld	a, #0x04
      0080EE E7 0A            [ 1]  171 	ld	(0x000a, x), a
      0080F0 1E 6B            [ 2]  172 	ldw	x, (0x6b, sp)
      0080F2 A6 08            [ 1]  173 	ld	a, #0x08
      0080F4 E7 0B            [ 1]  174 	ld	(0x000b, x), a
      0080F6 1E 6B            [ 2]  175 	ldw	x, (0x6b, sp)
      0080F8 A6 08            [ 1]  176 	ld	a, #0x08
      0080FA E7 0C            [ 1]  177 	ld	(0x000c, x), a
      0080FC 1E 6B            [ 2]  178 	ldw	x, (0x6b, sp)
      0080FE A6 04            [ 1]  179 	ld	a, #0x04
      008100 E7 0D            [ 1]  180 	ld	(0x000d, x), a
      008102 1E 6B            [ 2]  181 	ldw	x, (0x6b, sp)
      008104 A6 7E            [ 1]  182 	ld	a, #0x7e
      008106 E7 0E            [ 1]  183 	ld	(0x000e, x), a
      008108 1E 6B            [ 2]  184 	ldw	x, (0x6b, sp)
      00810A 1C 00 0F         [ 2]  185 	addw	x, #0x000f
      00810D 7F               [ 1]  186 	clr	(x)
      00810E 1E 6B            [ 2]  187 	ldw	x, (0x6b, sp)
      008110 1C 00 10         [ 2]  188 	addw	x, #0x0010
      008113 7F               [ 1]  189 	clr	(x)
      008114 1E 6B            [ 2]  190 	ldw	x, (0x6b, sp)
      008116 A6 42            [ 1]  191 	ld	a, #0x42
      008118 E7 11            [ 1]  192 	ld	(0x0011, x), a
      00811A 1E 6B            [ 2]  193 	ldw	x, (0x6b, sp)
      00811C A6 42            [ 1]  194 	ld	a, #0x42
      00811E E7 12            [ 1]  195 	ld	(0x0012, x), a
      008120 1E 6B            [ 2]  196 	ldw	x, (0x6b, sp)
      008122 A6 7E            [ 1]  197 	ld	a, #0x7e
      008124 E7 13            [ 1]  198 	ld	(0x0013, x), a
      008126 1E 6B            [ 2]  199 	ldw	x, (0x6b, sp)
      008128 A6 7E            [ 1]  200 	ld	a, #0x7e
      00812A E7 14            [ 1]  201 	ld	(0x0014, x), a
      00812C 1E 6B            [ 2]  202 	ldw	x, (0x6b, sp)
      00812E A6 42            [ 1]  203 	ld	a, #0x42
      008130 E7 15            [ 1]  204 	ld	(0x0015, x), a
      008132 1E 6B            [ 2]  205 	ldw	x, (0x6b, sp)
      008134 A6 42            [ 1]  206 	ld	a, #0x42
      008136 E7 16            [ 1]  207 	ld	(0x0016, x), a
      008138 1E 6B            [ 2]  208 	ldw	x, (0x6b, sp)
      00813A 1C 00 17         [ 2]  209 	addw	x, #0x0017
      00813D 7F               [ 1]  210 	clr	(x)
      00813E 1E 6B            [ 2]  211 	ldw	x, (0x6b, sp)
      008140 1C 00 18         [ 2]  212 	addw	x, #0x0018
      008143 7F               [ 1]  213 	clr	(x)
      008144 1E 6B            [ 2]  214 	ldw	x, (0x6b, sp)
      008146 A6 3C            [ 1]  215 	ld	a, #0x3c
      008148 E7 19            [ 1]  216 	ld	(0x0019, x), a
      00814A 1E 6B            [ 2]  217 	ldw	x, (0x6b, sp)
      00814C A6 42            [ 1]  218 	ld	a, #0x42
      00814E E7 1A            [ 1]  219 	ld	(0x001a, x), a
      008150 1E 6B            [ 2]  220 	ldw	x, (0x6b, sp)
      008152 A6 42            [ 1]  221 	ld	a, #0x42
      008154 E7 1B            [ 1]  222 	ld	(0x001b, x), a
      008156 1E 6B            [ 2]  223 	ldw	x, (0x6b, sp)
      008158 A6 42            [ 1]  224 	ld	a, #0x42
      00815A E7 1C            [ 1]  225 	ld	(0x001c, x), a
      00815C 1E 6B            [ 2]  226 	ldw	x, (0x6b, sp)
      00815E A6 42            [ 1]  227 	ld	a, #0x42
      008160 E7 1D            [ 1]  228 	ld	(0x001d, x), a
      008162 1E 6B            [ 2]  229 	ldw	x, (0x6b, sp)
      008164 A6 24            [ 1]  230 	ld	a, #0x24
      008166 E7 1E            [ 1]  231 	ld	(0x001e, x), a
      008168 1E 6B            [ 2]  232 	ldw	x, (0x6b, sp)
      00816A 1C 00 1F         [ 2]  233 	addw	x, #0x001f
      00816D 7F               [ 1]  234 	clr	(x)
      00816E 1E 6B            [ 2]  235 	ldw	x, (0x6b, sp)
      008170 1C 00 20         [ 2]  236 	addw	x, #0x0020
      008173 7F               [ 1]  237 	clr	(x)
      008174 1E 6B            [ 2]  238 	ldw	x, (0x6b, sp)
      008176 A6 7E            [ 1]  239 	ld	a, #0x7e
      008178 E7 21            [ 1]  240 	ld	(0x0021, x), a
      00817A 1E 6B            [ 2]  241 	ldw	x, (0x6b, sp)
      00817C A6 1A            [ 1]  242 	ld	a, #0x1a
      00817E E7 22            [ 1]  243 	ld	(0x0022, x), a
      008180 1E 6B            [ 2]  244 	ldw	x, (0x6b, sp)
      008182 A6 1A            [ 1]  245 	ld	a, #0x1a
      008184 E7 23            [ 1]  246 	ld	(0x0023, x), a
      008186 1E 6B            [ 2]  247 	ldw	x, (0x6b, sp)
      008188 A6 1A            [ 1]  248 	ld	a, #0x1a
      00818A E7 24            [ 1]  249 	ld	(0x0024, x), a
      00818C 1E 6B            [ 2]  250 	ldw	x, (0x6b, sp)
      00818E A6 2A            [ 1]  251 	ld	a, #0x2a
      008190 E7 25            [ 1]  252 	ld	(0x0025, x), a
      008192 1E 6B            [ 2]  253 	ldw	x, (0x6b, sp)
      008194 A6 44            [ 1]  254 	ld	a, #0x44
      008196 E7 26            [ 1]  255 	ld	(0x0026, x), a
      008198 1E 6B            [ 2]  256 	ldw	x, (0x6b, sp)
      00819A 1C 00 27         [ 2]  257 	addw	x, #0x0027
      00819D 7F               [ 1]  258 	clr	(x)
      00819E 1E 6B            [ 2]  259 	ldw	x, (0x6b, sp)
      0081A0 1C 00 28         [ 2]  260 	addw	x, #0x0028
      0081A3 7F               [ 1]  261 	clr	(x)
      0081A4 1E 6B            [ 2]  262 	ldw	x, (0x6b, sp)
      0081A6 A6 3C            [ 1]  263 	ld	a, #0x3c
      0081A8 E7 29            [ 1]  264 	ld	(0x0029, x), a
      0081AA 1E 6B            [ 2]  265 	ldw	x, (0x6b, sp)
      0081AC A6 42            [ 1]  266 	ld	a, #0x42
      0081AE E7 2A            [ 1]  267 	ld	(0x002a, x), a
      0081B0 1E 6B            [ 2]  268 	ldw	x, (0x6b, sp)
      0081B2 A6 42            [ 1]  269 	ld	a, #0x42
      0081B4 E7 2B            [ 1]  270 	ld	(0x002b, x), a
      0081B6 1E 6B            [ 2]  271 	ldw	x, (0x6b, sp)
      0081B8 A6 42            [ 1]  272 	ld	a, #0x42
      0081BA E7 2C            [ 1]  273 	ld	(0x002c, x), a
      0081BC 1E 6B            [ 2]  274 	ldw	x, (0x6b, sp)
      0081BE A6 42            [ 1]  275 	ld	a, #0x42
      0081C0 E7 2D            [ 1]  276 	ld	(0x002d, x), a
      0081C2 1E 6B            [ 2]  277 	ldw	x, (0x6b, sp)
      0081C4 A6 3C            [ 1]  278 	ld	a, #0x3c
      0081C6 E7 2E            [ 1]  279 	ld	(0x002e, x), a
      0081C8 1E 6B            [ 2]  280 	ldw	x, (0x6b, sp)
      0081CA 1C 00 2F         [ 2]  281 	addw	x, #0x002f
      0081CD 7F               [ 1]  282 	clr	(x)
      0081CE 1E 6B            [ 2]  283 	ldw	x, (0x6b, sp)
      0081D0 1C 00 30         [ 2]  284 	addw	x, #0x0030
      0081D3 7F               [ 1]  285 	clr	(x)
      0081D4 1E 6B            [ 2]  286 	ldw	x, (0x6b, sp)
      0081D6 A6 7C            [ 1]  287 	ld	a, #0x7c
      0081D8 E7 31            [ 1]  288 	ld	(0x0031, x), a
      0081DA 1E 6B            [ 2]  289 	ldw	x, (0x6b, sp)
      0081DC A6 12            [ 1]  290 	ld	a, #0x12
      0081DE E7 32            [ 1]  291 	ld	(0x0032, x), a
      0081E0 1E 6B            [ 2]  292 	ldw	x, (0x6b, sp)
      0081E2 A6 12            [ 1]  293 	ld	a, #0x12
      0081E4 E7 33            [ 1]  294 	ld	(0x0033, x), a
      0081E6 1E 6B            [ 2]  295 	ldw	x, (0x6b, sp)
      0081E8 A6 12            [ 1]  296 	ld	a, #0x12
      0081EA E7 34            [ 1]  297 	ld	(0x0034, x), a
      0081EC 1E 6B            [ 2]  298 	ldw	x, (0x6b, sp)
      0081EE A6 12            [ 1]  299 	ld	a, #0x12
      0081F0 E7 35            [ 1]  300 	ld	(0x0035, x), a
      0081F2 1E 6B            [ 2]  301 	ldw	x, (0x6b, sp)
      0081F4 A6 7C            [ 1]  302 	ld	a, #0x7c
      0081F6 E7 36            [ 1]  303 	ld	(0x0036, x), a
      0081F8 1E 6B            [ 2]  304 	ldw	x, (0x6b, sp)
      0081FA 1C 00 37         [ 2]  305 	addw	x, #0x0037
      0081FD 7F               [ 1]  306 	clr	(x)
      0081FE 1E 6B            [ 2]  307 	ldw	x, (0x6b, sp)
      008200 1C 00 38         [ 2]  308 	addw	x, #0x0038
      008203 7F               [ 1]  309 	clr	(x)
      008204 1E 6B            [ 2]  310 	ldw	x, (0x6b, sp)
      008206 A6 7E            [ 1]  311 	ld	a, #0x7e
      008208 E7 39            [ 1]  312 	ld	(0x0039, x), a
      00820A 1E 6B            [ 2]  313 	ldw	x, (0x6b, sp)
      00820C A6 1A            [ 1]  314 	ld	a, #0x1a
      00820E E7 3A            [ 1]  315 	ld	(0x003a, x), a
      008210 1E 6B            [ 2]  316 	ldw	x, (0x6b, sp)
      008212 A6 1A            [ 1]  317 	ld	a, #0x1a
      008214 E7 3B            [ 1]  318 	ld	(0x003b, x), a
      008216 1E 6B            [ 2]  319 	ldw	x, (0x6b, sp)
      008218 A6 1A            [ 1]  320 	ld	a, #0x1a
      00821A E7 3C            [ 1]  321 	ld	(0x003c, x), a
      00821C 1E 6B            [ 2]  322 	ldw	x, (0x6b, sp)
      00821E A6 2A            [ 1]  323 	ld	a, #0x2a
      008220 E7 3D            [ 1]  324 	ld	(0x003d, x), a
      008222 1E 6B            [ 2]  325 	ldw	x, (0x6b, sp)
      008224 A6 44            [ 1]  326 	ld	a, #0x44
      008226 E7 3E            [ 1]  327 	ld	(0x003e, x), a
      008228 1E 6B            [ 2]  328 	ldw	x, (0x6b, sp)
      00822A 1C 00 3F         [ 2]  329 	addw	x, #0x003f
      00822D 7F               [ 1]  330 	clr	(x)
      00822E 1E 6B            [ 2]  331 	ldw	x, (0x6b, sp)
      008230 1C 00 40         [ 2]  332 	addw	x, #0x0040
      008233 7F               [ 1]  333 	clr	(x)
      008234 1E 6B            [ 2]  334 	ldw	x, (0x6b, sp)
      008236 A6 7E            [ 1]  335 	ld	a, #0x7e
      008238 E7 41            [ 1]  336 	ld	(0x0041, x), a
      00823A 1E 6B            [ 2]  337 	ldw	x, (0x6b, sp)
      00823C A6 7E            [ 1]  338 	ld	a, #0x7e
      00823E E7 42            [ 1]  339 	ld	(0x0042, x), a
      008240 1E 6B            [ 2]  340 	ldw	x, (0x6b, sp)
      008242 A6 4A            [ 1]  341 	ld	a, #0x4a
      008244 E7 43            [ 1]  342 	ld	(0x0043, x), a
      008246 1E 6B            [ 2]  343 	ldw	x, (0x6b, sp)
      008248 A6 4A            [ 1]  344 	ld	a, #0x4a
      00824A E7 44            [ 1]  345 	ld	(0x0044, x), a
      00824C 1E 6B            [ 2]  346 	ldw	x, (0x6b, sp)
      00824E A6 4A            [ 1]  347 	ld	a, #0x4a
      008250 E7 45            [ 1]  348 	ld	(0x0045, x), a
      008252 1E 6B            [ 2]  349 	ldw	x, (0x6b, sp)
      008254 A6 42            [ 1]  350 	ld	a, #0x42
      008256 E7 46            [ 1]  351 	ld	(0x0046, x), a
      008258 1E 6B            [ 2]  352 	ldw	x, (0x6b, sp)
      00825A 1C 00 47         [ 2]  353 	addw	x, #0x0047
      00825D 7F               [ 1]  354 	clr	(x)
      00825E 1E 6B            [ 2]  355 	ldw	x, (0x6b, sp)
      008260 1C 00 48         [ 2]  356 	addw	x, #0x0048
      008263 7F               [ 1]  357 	clr	(x)
      008264 1E 6B            [ 2]  358 	ldw	x, (0x6b, sp)
      008266 A6 7E            [ 1]  359 	ld	a, #0x7e
      008268 E7 49            [ 1]  360 	ld	(0x0049, x), a
      00826A 1E 6B            [ 2]  361 	ldw	x, (0x6b, sp)
      00826C A6 04            [ 1]  362 	ld	a, #0x04
      00826E E7 4A            [ 1]  363 	ld	(0x004a, x), a
      008270 1E 6B            [ 2]  364 	ldw	x, (0x6b, sp)
      008272 A6 08            [ 1]  365 	ld	a, #0x08
      008274 E7 4B            [ 1]  366 	ld	(0x004b, x), a
      008276 1E 6B            [ 2]  367 	ldw	x, (0x6b, sp)
      008278 A6 10            [ 1]  368 	ld	a, #0x10
      00827A E7 4C            [ 1]  369 	ld	(0x004c, x), a
      00827C 1E 6B            [ 2]  370 	ldw	x, (0x6b, sp)
      00827E A6 20            [ 1]  371 	ld	a, #0x20
      008280 E7 4D            [ 1]  372 	ld	(0x004d, x), a
      008282 1E 6B            [ 2]  373 	ldw	x, (0x6b, sp)
      008284 A6 7E            [ 1]  374 	ld	a, #0x7e
      008286 E7 4E            [ 1]  375 	ld	(0x004e, x), a
      008288 1E 6B            [ 2]  376 	ldw	x, (0x6b, sp)
      00828A 1C 00 4F         [ 2]  377 	addw	x, #0x004f
      00828D 7F               [ 1]  378 	clr	(x)
      00828E 1E 6B            [ 2]  379 	ldw	x, (0x6b, sp)
      008290 1C 00 50         [ 2]  380 	addw	x, #0x0050
      008293 7F               [ 1]  381 	clr	(x)
      008294 1E 6B            [ 2]  382 	ldw	x, (0x6b, sp)
      008296 A6 7C            [ 1]  383 	ld	a, #0x7c
      008298 E7 51            [ 1]  384 	ld	(0x0051, x), a
      00829A 1E 6B            [ 2]  385 	ldw	x, (0x6b, sp)
      00829C A6 12            [ 1]  386 	ld	a, #0x12
      00829E E7 52            [ 1]  387 	ld	(0x0052, x), a
      0082A0 1E 6B            [ 2]  388 	ldw	x, (0x6b, sp)
      0082A2 A6 12            [ 1]  389 	ld	a, #0x12
      0082A4 E7 53            [ 1]  390 	ld	(0x0053, x), a
      0082A6 1E 6B            [ 2]  391 	ldw	x, (0x6b, sp)
      0082A8 A6 12            [ 1]  392 	ld	a, #0x12
      0082AA E7 54            [ 1]  393 	ld	(0x0054, x), a
      0082AC 1E 6B            [ 2]  394 	ldw	x, (0x6b, sp)
      0082AE A6 12            [ 1]  395 	ld	a, #0x12
      0082B0 E7 55            [ 1]  396 	ld	(0x0055, x), a
      0082B2 1E 6B            [ 2]  397 	ldw	x, (0x6b, sp)
      0082B4 A6 7C            [ 1]  398 	ld	a, #0x7c
      0082B6 E7 56            [ 1]  399 	ld	(0x0056, x), a
      0082B8 1E 6B            [ 2]  400 	ldw	x, (0x6b, sp)
      0082BA 1C 00 57         [ 2]  401 	addw	x, #0x0057
      0082BD 7F               [ 1]  402 	clr	(x)
      0082BE 1E 6B            [ 2]  403 	ldw	x, (0x6b, sp)
      0082C0 1C 00 58         [ 2]  404 	addw	x, #0x0058
      0082C3 7F               [ 1]  405 	clr	(x)
      0082C4 1E 6B            [ 2]  406 	ldw	x, (0x6b, sp)
      0082C6 1C 00 59         [ 2]  407 	addw	x, #0x0059
      0082C9 7F               [ 1]  408 	clr	(x)
      0082CA 1E 6B            [ 2]  409 	ldw	x, (0x6b, sp)
      0082CC 1C 00 5A         [ 2]  410 	addw	x, #0x005a
      0082CF 7F               [ 1]  411 	clr	(x)
      0082D0 1E 6B            [ 2]  412 	ldw	x, (0x6b, sp)
      0082D2 1C 00 5B         [ 2]  413 	addw	x, #0x005b
      0082D5 7F               [ 1]  414 	clr	(x)
      0082D6 1E 6B            [ 2]  415 	ldw	x, (0x6b, sp)
      0082D8 1C 00 5C         [ 2]  416 	addw	x, #0x005c
      0082DB 7F               [ 1]  417 	clr	(x)
      0082DC 1E 6B            [ 2]  418 	ldw	x, (0x6b, sp)
      0082DE 1C 00 5D         [ 2]  419 	addw	x, #0x005d
      0082E1 7F               [ 1]  420 	clr	(x)
      0082E2 1E 6B            [ 2]  421 	ldw	x, (0x6b, sp)
      0082E4 1C 00 5E         [ 2]  422 	addw	x, #0x005e
      0082E7 7F               [ 1]  423 	clr	(x)
      0082E8 1E 6B            [ 2]  424 	ldw	x, (0x6b, sp)
      0082EA 1C 00 5F         [ 2]  425 	addw	x, #0x005f
      0082ED 7F               [ 1]  426 	clr	(x)
                                    427 ;	user/main.c: 47: char smile[]={0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
      0082EE 96               [ 1]  428 	ldw	x, sp
      0082EF 5C               [ 2]  429 	incw	x
      0082F0 1F 69            [ 2]  430 	ldw	(0x69, sp), x
      0082F2 1E 69            [ 2]  431 	ldw	x, (0x69, sp)
      0082F4 A6 01            [ 1]  432 	ld	a, #0x01
      0082F6 F7               [ 1]  433 	ld	(x), a
      0082F7 1E 69            [ 2]  434 	ldw	x, (0x69, sp)
      0082F9 5C               [ 2]  435 	incw	x
      0082FA A6 01            [ 1]  436 	ld	a, #0x01
      0082FC F7               [ 1]  437 	ld	(x), a
      0082FD 1E 69            [ 2]  438 	ldw	x, (0x69, sp)
      0082FF 5C               [ 2]  439 	incw	x
      008300 5C               [ 2]  440 	incw	x
      008301 A6 01            [ 1]  441 	ld	a, #0x01
      008303 F7               [ 1]  442 	ld	(x), a
      008304 1E 69            [ 2]  443 	ldw	x, (0x69, sp)
      008306 A6 01            [ 1]  444 	ld	a, #0x01
      008308 E7 03            [ 1]  445 	ld	(0x0003, x), a
      00830A 1E 69            [ 2]  446 	ldw	x, (0x69, sp)
      00830C A6 01            [ 1]  447 	ld	a, #0x01
      00830E E7 04            [ 1]  448 	ld	(0x0004, x), a
      008310 1E 69            [ 2]  449 	ldw	x, (0x69, sp)
      008312 A6 01            [ 1]  450 	ld	a, #0x01
      008314 E7 05            [ 1]  451 	ld	(0x0005, x), a
      008316 1E 69            [ 2]  452 	ldw	x, (0x69, sp)
      008318 A6 01            [ 1]  453 	ld	a, #0x01
      00831A E7 06            [ 1]  454 	ld	(0x0006, x), a
      00831C 1E 69            [ 2]  455 	ldw	x, (0x69, sp)
      00831E 1C 00 07         [ 2]  456 	addw	x, #0x0007
      008321 A6 01            [ 1]  457 	ld	a, #0x01
      008323 F7               [ 1]  458 	ld	(x), a
                                    459 ;	user/main.c: 48: CLK_Config();
      008324 CD 8A 48         [ 4]  460 	call	_CLK_Config
                                    461 ;	user/main.c: 51: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 4);
      008327 4B 04            [ 1]  462 	push	#0x04
      008329 4B 20            [ 1]  463 	push	#0x20
      00832B 4B 10            [ 1]  464 	push	#0x10
      00832D 4B 40            [ 1]  465 	push	#0x40
      00832F 4B 0A            [ 1]  466 	push	#0x0a
      008331 4B 50            [ 1]  467 	push	#0x50
      008333 CD 83 5C         [ 4]  468 	call	_MaxMatrix
      008336 5B 06            [ 2]  469 	addw	sp, #6
                                    470 ;	user/main.c: 52: Init();
      008338 CD 84 42         [ 4]  471 	call	_Init
                                    472 ;	user/main.c: 53: Screen();
      00833B CD 84 B2         [ 4]  473 	call	_Screen
                                    474 ;	user/main.c: 57: DrawEx(1, smile);
      00833E 1E 69            [ 2]  475 	ldw	x, (0x69, sp)
      008340 89               [ 2]  476 	pushw	x
      008341 4B 01            [ 1]  477 	push	#0x01
      008343 CD 86 1C         [ 4]  478 	call	_DrawEx
      008346 5B 03            [ 2]  479 	addw	sp, #3
                                    480 ;	user/main.c: 58: Screen();
      008348 CD 84 B2         [ 4]  481 	call	_Screen
                                    482 ;	user/main.c: 82: while(TRUE) 
      00834B                        483 00102$:
      00834B 20 FE            [ 2]  484 	jra	00102$
      00834D 5B 6C            [ 2]  485 	addw	sp, #108
      00834F 81               [ 4]  486 	ret
                                    487 	.area CODE
                                    488 	.area INITIALIZER
                                    489 	.area CABS (ABS)
