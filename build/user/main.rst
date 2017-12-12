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
                                     13 	.globl _Max7219_Write
                                     14 	.globl _Max7219_Init
                                     15 	.globl _SPI_Cmd
                                     16 	.globl _SPI_Init
                                     17 	.globl _SPI_DeInit
                                     18 	.globl _GPIO_Init
                                     19 	.globl _CLK_Config
                                     20 	.globl _GPIO_setup
                                     21 	.globl _SPI_setup
                                     22 ;--------------------------------------------------------
                                     23 ; ram data
                                     24 ;--------------------------------------------------------
                                     25 	.area DATA
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
                                     30 ;--------------------------------------------------------
                                     31 ; Stack segment in internal ram 
                                     32 ;--------------------------------------------------------
                                     33 	.area	SSEG
      00002A                         34 __start__stack:
      00002A                         35 	.ds	1
                                     36 
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 ;--------------------------------------------------------
                                     42 ; interrupt vector 
                                     43 ;--------------------------------------------------------
                                     44 	.area HOME
      008000                         45 __interrupt_vect:
      008000 82 00 80 83             46 	int s_GSINIT ;reset
      008004 82 00 00 00             47 	int 0x0000 ;trap
      008008 82 00 00 00             48 	int 0x0000 ;int0
      00800C 82 00 00 00             49 	int 0x0000 ;int1
      008010 82 00 00 00             50 	int 0x0000 ;int2
      008014 82 00 00 00             51 	int 0x0000 ;int3
      008018 82 00 00 00             52 	int 0x0000 ;int4
      00801C 82 00 00 00             53 	int 0x0000 ;int5
      008020 82 00 00 00             54 	int 0x0000 ;int6
      008024 82 00 00 00             55 	int 0x0000 ;int7
      008028 82 00 00 00             56 	int 0x0000 ;int8
      00802C 82 00 00 00             57 	int 0x0000 ;int9
      008030 82 00 00 00             58 	int 0x0000 ;int10
      008034 82 00 00 00             59 	int 0x0000 ;int11
      008038 82 00 00 00             60 	int 0x0000 ;int12
      00803C 82 00 00 00             61 	int 0x0000 ;int13
      008040 82 00 00 00             62 	int 0x0000 ;int14
      008044 82 00 00 00             63 	int 0x0000 ;int15
      008048 82 00 00 00             64 	int 0x0000 ;int16
      00804C 82 00 00 00             65 	int 0x0000 ;int17
      008050 82 00 00 00             66 	int 0x0000 ;int18
      008054 82 00 00 00             67 	int 0x0000 ;int19
      008058 82 00 00 00             68 	int 0x0000 ;int20
      00805C 82 00 00 00             69 	int 0x0000 ;int21
      008060 82 00 00 00             70 	int 0x0000 ;int22
      008064 82 00 00 00             71 	int 0x0000 ;int23
      008068 82 00 00 00             72 	int 0x0000 ;int24
      00806C 82 00 00 00             73 	int 0x0000 ;int25
      008070 82 00 00 00             74 	int 0x0000 ;int26
      008074 82 00 00 00             75 	int 0x0000 ;int27
      008078 82 00 00 00             76 	int 0x0000 ;int28
      00807C 82 00 00 00             77 	int 0x0000 ;int29
                                     78 ;--------------------------------------------------------
                                     79 ; global & static initialisations
                                     80 ;--------------------------------------------------------
                                     81 	.area HOME
                                     82 	.area GSINIT
                                     83 	.area GSFINAL
                                     84 	.area GSINIT
      008083                         85 __sdcc_gs_init_startup:
      008083                         86 __sdcc_init_data:
                                     87 ; stm8_genXINIT() start
      008083 AE 00 27         [ 2]   88 	ldw x, #l_DATA
      008086 27 07            [ 1]   89 	jreq	00002$
      008088                         90 00001$:
      008088 72 4F 00 00      [ 1]   91 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   92 	decw x
      00808D 26 F9            [ 1]   93 	jrne	00001$
      00808F                         94 00002$:
      00808F AE 00 02         [ 2]   95 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   96 	jreq	00004$
      008094                         97 00003$:
      008094 D6 93 C4         [ 1]   98 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 27         [ 1]   99 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  100 	decw	x
      00809B 26 F7            [ 1]  101 	jrne	00003$
      00809D                        102 00004$:
                                    103 ; stm8_genXINIT() end
                                    104 	.area GSFINAL
      00809D CC 80 80         [ 2]  105 	jp	__sdcc_program_startup
                                    106 ;--------------------------------------------------------
                                    107 ; Home
                                    108 ;--------------------------------------------------------
                                    109 	.area HOME
                                    110 	.area HOME
      008080                        111 __sdcc_program_startup:
      008080 CC 80 AC         [ 2]  112 	jp	_main
                                    113 ;	return from main will return to caller
                                    114 ;--------------------------------------------------------
                                    115 ; code
                                    116 ;--------------------------------------------------------
                                    117 	.area CODE
                                    118 ;	user/main.c: 23: void delay(uint16_t x)
                                    119 ;	-----------------------------------------
                                    120 ;	 function delay
                                    121 ;	-----------------------------------------
      0080A0                        122 _delay:
      0080A0 89               [ 2]  123 	pushw	x
                                    124 ;	user/main.c: 25: while(x--);
      0080A1 1E 05            [ 2]  125 	ldw	x, (0x05, sp)
      0080A3                        126 00101$:
      0080A3 1F 01            [ 2]  127 	ldw	(0x01, sp), x
      0080A5 5A               [ 2]  128 	decw	x
      0080A6 16 01            [ 2]  129 	ldw	y, (0x01, sp)
      0080A8 26 F9            [ 1]  130 	jrne	00101$
      0080AA 85               [ 2]  131 	popw	x
      0080AB 81               [ 4]  132 	ret
                                    133 ;	user/main.c: 28: void main() 
                                    134 ;	-----------------------------------------
                                    135 ;	 function main
                                    136 ;	-----------------------------------------
      0080AC                        137 _main:
      0080AC 52 74            [ 2]  138 	sub	sp, #116
                                    139 ;	user/main.c: 31: volatile unsigned char temp[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
      0080AE 96               [ 1]  140 	ldw	x, sp
      0080AF 1C 00 69         [ 2]  141 	addw	x, #105
      0080B2 7F               [ 1]  142 	clr	(x)
      0080B3 96               [ 1]  143 	ldw	x, sp
      0080B4 1C 00 6A         [ 2]  144 	addw	x, #106
      0080B7 7F               [ 1]  145 	clr	(x)
      0080B8 96               [ 1]  146 	ldw	x, sp
      0080B9 1C 00 6B         [ 2]  147 	addw	x, #107
      0080BC 7F               [ 1]  148 	clr	(x)
      0080BD 96               [ 1]  149 	ldw	x, sp
      0080BE 1C 00 6C         [ 2]  150 	addw	x, #108
      0080C1 7F               [ 1]  151 	clr	(x)
      0080C2 96               [ 1]  152 	ldw	x, sp
      0080C3 1C 00 6D         [ 2]  153 	addw	x, #109
      0080C6 7F               [ 1]  154 	clr	(x)
      0080C7 96               [ 1]  155 	ldw	x, sp
      0080C8 1C 00 6E         [ 2]  156 	addw	x, #110
      0080CB 7F               [ 1]  157 	clr	(x)
      0080CC 96               [ 1]  158 	ldw	x, sp
      0080CD 1C 00 6F         [ 2]  159 	addw	x, #111
      0080D0 7F               [ 1]  160 	clr	(x)
      0080D1 96               [ 1]  161 	ldw	x, sp
      0080D2 1C 00 70         [ 2]  162 	addw	x, #112
      0080D5 7F               [ 1]  163 	clr	(x)
                                    164 ;	user/main.c: 32: const unsigned char text[96] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
      0080D6 96               [ 1]  165 	ldw	x, sp
      0080D7 1C 00 09         [ 2]  166 	addw	x, #9
      0080DA 1F 73            [ 2]  167 	ldw	(0x73, sp), x
      0080DC 1E 73            [ 2]  168 	ldw	x, (0x73, sp)
      0080DE 7F               [ 1]  169 	clr	(x)
      0080DF 1E 73            [ 2]  170 	ldw	x, (0x73, sp)
      0080E1 5C               [ 2]  171 	incw	x
      0080E2 7F               [ 1]  172 	clr	(x)
      0080E3 1E 73            [ 2]  173 	ldw	x, (0x73, sp)
      0080E5 5C               [ 2]  174 	incw	x
      0080E6 5C               [ 2]  175 	incw	x
      0080E7 7F               [ 1]  176 	clr	(x)
      0080E8 1E 73            [ 2]  177 	ldw	x, (0x73, sp)
      0080EA 1C 00 03         [ 2]  178 	addw	x, #0x0003
      0080ED 7F               [ 1]  179 	clr	(x)
      0080EE 1E 73            [ 2]  180 	ldw	x, (0x73, sp)
      0080F0 1C 00 04         [ 2]  181 	addw	x, #0x0004
      0080F3 7F               [ 1]  182 	clr	(x)
      0080F4 1E 73            [ 2]  183 	ldw	x, (0x73, sp)
      0080F6 1C 00 05         [ 2]  184 	addw	x, #0x0005
      0080F9 7F               [ 1]  185 	clr	(x)
      0080FA 1E 73            [ 2]  186 	ldw	x, (0x73, sp)
      0080FC 1C 00 06         [ 2]  187 	addw	x, #0x0006
      0080FF 7F               [ 1]  188 	clr	(x)
      008100 1E 73            [ 2]  189 	ldw	x, (0x73, sp)
      008102 1C 00 07         [ 2]  190 	addw	x, #0x0007
      008105 7F               [ 1]  191 	clr	(x)
      008106 1E 73            [ 2]  192 	ldw	x, (0x73, sp)
      008108 1C 00 08         [ 2]  193 	addw	x, #0x0008
      00810B 7F               [ 1]  194 	clr	(x)
      00810C 1E 73            [ 2]  195 	ldw	x, (0x73, sp)
      00810E A6 7E            [ 1]  196 	ld	a, #0x7e
      008110 E7 09            [ 1]  197 	ld	(0x0009, x), a
      008112 1E 73            [ 2]  198 	ldw	x, (0x73, sp)
      008114 A6 04            [ 1]  199 	ld	a, #0x04
      008116 E7 0A            [ 1]  200 	ld	(0x000a, x), a
      008118 1E 73            [ 2]  201 	ldw	x, (0x73, sp)
      00811A A6 08            [ 1]  202 	ld	a, #0x08
      00811C E7 0B            [ 1]  203 	ld	(0x000b, x), a
      00811E 1E 73            [ 2]  204 	ldw	x, (0x73, sp)
      008120 A6 08            [ 1]  205 	ld	a, #0x08
      008122 E7 0C            [ 1]  206 	ld	(0x000c, x), a
      008124 1E 73            [ 2]  207 	ldw	x, (0x73, sp)
      008126 A6 04            [ 1]  208 	ld	a, #0x04
      008128 E7 0D            [ 1]  209 	ld	(0x000d, x), a
      00812A 1E 73            [ 2]  210 	ldw	x, (0x73, sp)
      00812C A6 7E            [ 1]  211 	ld	a, #0x7e
      00812E E7 0E            [ 1]  212 	ld	(0x000e, x), a
      008130 1E 73            [ 2]  213 	ldw	x, (0x73, sp)
      008132 1C 00 0F         [ 2]  214 	addw	x, #0x000f
      008135 7F               [ 1]  215 	clr	(x)
      008136 1E 73            [ 2]  216 	ldw	x, (0x73, sp)
      008138 1C 00 10         [ 2]  217 	addw	x, #0x0010
      00813B 7F               [ 1]  218 	clr	(x)
      00813C 1E 73            [ 2]  219 	ldw	x, (0x73, sp)
      00813E A6 42            [ 1]  220 	ld	a, #0x42
      008140 E7 11            [ 1]  221 	ld	(0x0011, x), a
      008142 1E 73            [ 2]  222 	ldw	x, (0x73, sp)
      008144 A6 42            [ 1]  223 	ld	a, #0x42
      008146 E7 12            [ 1]  224 	ld	(0x0012, x), a
      008148 1E 73            [ 2]  225 	ldw	x, (0x73, sp)
      00814A A6 7E            [ 1]  226 	ld	a, #0x7e
      00814C E7 13            [ 1]  227 	ld	(0x0013, x), a
      00814E 1E 73            [ 2]  228 	ldw	x, (0x73, sp)
      008150 A6 7E            [ 1]  229 	ld	a, #0x7e
      008152 E7 14            [ 1]  230 	ld	(0x0014, x), a
      008154 1E 73            [ 2]  231 	ldw	x, (0x73, sp)
      008156 A6 42            [ 1]  232 	ld	a, #0x42
      008158 E7 15            [ 1]  233 	ld	(0x0015, x), a
      00815A 1E 73            [ 2]  234 	ldw	x, (0x73, sp)
      00815C A6 42            [ 1]  235 	ld	a, #0x42
      00815E E7 16            [ 1]  236 	ld	(0x0016, x), a
      008160 1E 73            [ 2]  237 	ldw	x, (0x73, sp)
      008162 1C 00 17         [ 2]  238 	addw	x, #0x0017
      008165 7F               [ 1]  239 	clr	(x)
      008166 1E 73            [ 2]  240 	ldw	x, (0x73, sp)
      008168 1C 00 18         [ 2]  241 	addw	x, #0x0018
      00816B 7F               [ 1]  242 	clr	(x)
      00816C 1E 73            [ 2]  243 	ldw	x, (0x73, sp)
      00816E A6 3C            [ 1]  244 	ld	a, #0x3c
      008170 E7 19            [ 1]  245 	ld	(0x0019, x), a
      008172 1E 73            [ 2]  246 	ldw	x, (0x73, sp)
      008174 A6 42            [ 1]  247 	ld	a, #0x42
      008176 E7 1A            [ 1]  248 	ld	(0x001a, x), a
      008178 1E 73            [ 2]  249 	ldw	x, (0x73, sp)
      00817A A6 42            [ 1]  250 	ld	a, #0x42
      00817C E7 1B            [ 1]  251 	ld	(0x001b, x), a
      00817E 1E 73            [ 2]  252 	ldw	x, (0x73, sp)
      008180 A6 42            [ 1]  253 	ld	a, #0x42
      008182 E7 1C            [ 1]  254 	ld	(0x001c, x), a
      008184 1E 73            [ 2]  255 	ldw	x, (0x73, sp)
      008186 A6 42            [ 1]  256 	ld	a, #0x42
      008188 E7 1D            [ 1]  257 	ld	(0x001d, x), a
      00818A 1E 73            [ 2]  258 	ldw	x, (0x73, sp)
      00818C A6 24            [ 1]  259 	ld	a, #0x24
      00818E E7 1E            [ 1]  260 	ld	(0x001e, x), a
      008190 1E 73            [ 2]  261 	ldw	x, (0x73, sp)
      008192 1C 00 1F         [ 2]  262 	addw	x, #0x001f
      008195 7F               [ 1]  263 	clr	(x)
      008196 1E 73            [ 2]  264 	ldw	x, (0x73, sp)
      008198 1C 00 20         [ 2]  265 	addw	x, #0x0020
      00819B 7F               [ 1]  266 	clr	(x)
      00819C 1E 73            [ 2]  267 	ldw	x, (0x73, sp)
      00819E A6 7E            [ 1]  268 	ld	a, #0x7e
      0081A0 E7 21            [ 1]  269 	ld	(0x0021, x), a
      0081A2 1E 73            [ 2]  270 	ldw	x, (0x73, sp)
      0081A4 A6 1A            [ 1]  271 	ld	a, #0x1a
      0081A6 E7 22            [ 1]  272 	ld	(0x0022, x), a
      0081A8 1E 73            [ 2]  273 	ldw	x, (0x73, sp)
      0081AA A6 1A            [ 1]  274 	ld	a, #0x1a
      0081AC E7 23            [ 1]  275 	ld	(0x0023, x), a
      0081AE 1E 73            [ 2]  276 	ldw	x, (0x73, sp)
      0081B0 A6 1A            [ 1]  277 	ld	a, #0x1a
      0081B2 E7 24            [ 1]  278 	ld	(0x0024, x), a
      0081B4 1E 73            [ 2]  279 	ldw	x, (0x73, sp)
      0081B6 A6 2A            [ 1]  280 	ld	a, #0x2a
      0081B8 E7 25            [ 1]  281 	ld	(0x0025, x), a
      0081BA 1E 73            [ 2]  282 	ldw	x, (0x73, sp)
      0081BC A6 44            [ 1]  283 	ld	a, #0x44
      0081BE E7 26            [ 1]  284 	ld	(0x0026, x), a
      0081C0 1E 73            [ 2]  285 	ldw	x, (0x73, sp)
      0081C2 1C 00 27         [ 2]  286 	addw	x, #0x0027
      0081C5 7F               [ 1]  287 	clr	(x)
      0081C6 1E 73            [ 2]  288 	ldw	x, (0x73, sp)
      0081C8 1C 00 28         [ 2]  289 	addw	x, #0x0028
      0081CB 7F               [ 1]  290 	clr	(x)
      0081CC 1E 73            [ 2]  291 	ldw	x, (0x73, sp)
      0081CE A6 3C            [ 1]  292 	ld	a, #0x3c
      0081D0 E7 29            [ 1]  293 	ld	(0x0029, x), a
      0081D2 1E 73            [ 2]  294 	ldw	x, (0x73, sp)
      0081D4 A6 42            [ 1]  295 	ld	a, #0x42
      0081D6 E7 2A            [ 1]  296 	ld	(0x002a, x), a
      0081D8 1E 73            [ 2]  297 	ldw	x, (0x73, sp)
      0081DA A6 42            [ 1]  298 	ld	a, #0x42
      0081DC E7 2B            [ 1]  299 	ld	(0x002b, x), a
      0081DE 1E 73            [ 2]  300 	ldw	x, (0x73, sp)
      0081E0 A6 42            [ 1]  301 	ld	a, #0x42
      0081E2 E7 2C            [ 1]  302 	ld	(0x002c, x), a
      0081E4 1E 73            [ 2]  303 	ldw	x, (0x73, sp)
      0081E6 A6 42            [ 1]  304 	ld	a, #0x42
      0081E8 E7 2D            [ 1]  305 	ld	(0x002d, x), a
      0081EA 1E 73            [ 2]  306 	ldw	x, (0x73, sp)
      0081EC A6 3C            [ 1]  307 	ld	a, #0x3c
      0081EE E7 2E            [ 1]  308 	ld	(0x002e, x), a
      0081F0 1E 73            [ 2]  309 	ldw	x, (0x73, sp)
      0081F2 1C 00 2F         [ 2]  310 	addw	x, #0x002f
      0081F5 7F               [ 1]  311 	clr	(x)
      0081F6 1E 73            [ 2]  312 	ldw	x, (0x73, sp)
      0081F8 1C 00 30         [ 2]  313 	addw	x, #0x0030
      0081FB 7F               [ 1]  314 	clr	(x)
      0081FC 1E 73            [ 2]  315 	ldw	x, (0x73, sp)
      0081FE A6 7C            [ 1]  316 	ld	a, #0x7c
      008200 E7 31            [ 1]  317 	ld	(0x0031, x), a
      008202 1E 73            [ 2]  318 	ldw	x, (0x73, sp)
      008204 A6 12            [ 1]  319 	ld	a, #0x12
      008206 E7 32            [ 1]  320 	ld	(0x0032, x), a
      008208 1E 73            [ 2]  321 	ldw	x, (0x73, sp)
      00820A A6 12            [ 1]  322 	ld	a, #0x12
      00820C E7 33            [ 1]  323 	ld	(0x0033, x), a
      00820E 1E 73            [ 2]  324 	ldw	x, (0x73, sp)
      008210 A6 12            [ 1]  325 	ld	a, #0x12
      008212 E7 34            [ 1]  326 	ld	(0x0034, x), a
      008214 1E 73            [ 2]  327 	ldw	x, (0x73, sp)
      008216 A6 12            [ 1]  328 	ld	a, #0x12
      008218 E7 35            [ 1]  329 	ld	(0x0035, x), a
      00821A 1E 73            [ 2]  330 	ldw	x, (0x73, sp)
      00821C A6 7C            [ 1]  331 	ld	a, #0x7c
      00821E E7 36            [ 1]  332 	ld	(0x0036, x), a
      008220 1E 73            [ 2]  333 	ldw	x, (0x73, sp)
      008222 1C 00 37         [ 2]  334 	addw	x, #0x0037
      008225 7F               [ 1]  335 	clr	(x)
      008226 1E 73            [ 2]  336 	ldw	x, (0x73, sp)
      008228 1C 00 38         [ 2]  337 	addw	x, #0x0038
      00822B 7F               [ 1]  338 	clr	(x)
      00822C 1E 73            [ 2]  339 	ldw	x, (0x73, sp)
      00822E A6 7E            [ 1]  340 	ld	a, #0x7e
      008230 E7 39            [ 1]  341 	ld	(0x0039, x), a
      008232 1E 73            [ 2]  342 	ldw	x, (0x73, sp)
      008234 A6 1A            [ 1]  343 	ld	a, #0x1a
      008236 E7 3A            [ 1]  344 	ld	(0x003a, x), a
      008238 1E 73            [ 2]  345 	ldw	x, (0x73, sp)
      00823A A6 1A            [ 1]  346 	ld	a, #0x1a
      00823C E7 3B            [ 1]  347 	ld	(0x003b, x), a
      00823E 1E 73            [ 2]  348 	ldw	x, (0x73, sp)
      008240 A6 1A            [ 1]  349 	ld	a, #0x1a
      008242 E7 3C            [ 1]  350 	ld	(0x003c, x), a
      008244 1E 73            [ 2]  351 	ldw	x, (0x73, sp)
      008246 A6 2A            [ 1]  352 	ld	a, #0x2a
      008248 E7 3D            [ 1]  353 	ld	(0x003d, x), a
      00824A 1E 73            [ 2]  354 	ldw	x, (0x73, sp)
      00824C A6 44            [ 1]  355 	ld	a, #0x44
      00824E E7 3E            [ 1]  356 	ld	(0x003e, x), a
      008250 1E 73            [ 2]  357 	ldw	x, (0x73, sp)
      008252 1C 00 3F         [ 2]  358 	addw	x, #0x003f
      008255 7F               [ 1]  359 	clr	(x)
      008256 1E 73            [ 2]  360 	ldw	x, (0x73, sp)
      008258 1C 00 40         [ 2]  361 	addw	x, #0x0040
      00825B 7F               [ 1]  362 	clr	(x)
      00825C 1E 73            [ 2]  363 	ldw	x, (0x73, sp)
      00825E A6 7E            [ 1]  364 	ld	a, #0x7e
      008260 E7 41            [ 1]  365 	ld	(0x0041, x), a
      008262 1E 73            [ 2]  366 	ldw	x, (0x73, sp)
      008264 A6 7E            [ 1]  367 	ld	a, #0x7e
      008266 E7 42            [ 1]  368 	ld	(0x0042, x), a
      008268 1E 73            [ 2]  369 	ldw	x, (0x73, sp)
      00826A A6 4A            [ 1]  370 	ld	a, #0x4a
      00826C E7 43            [ 1]  371 	ld	(0x0043, x), a
      00826E 1E 73            [ 2]  372 	ldw	x, (0x73, sp)
      008270 A6 4A            [ 1]  373 	ld	a, #0x4a
      008272 E7 44            [ 1]  374 	ld	(0x0044, x), a
      008274 1E 73            [ 2]  375 	ldw	x, (0x73, sp)
      008276 A6 4A            [ 1]  376 	ld	a, #0x4a
      008278 E7 45            [ 1]  377 	ld	(0x0045, x), a
      00827A 1E 73            [ 2]  378 	ldw	x, (0x73, sp)
      00827C A6 42            [ 1]  379 	ld	a, #0x42
      00827E E7 46            [ 1]  380 	ld	(0x0046, x), a
      008280 1E 73            [ 2]  381 	ldw	x, (0x73, sp)
      008282 1C 00 47         [ 2]  382 	addw	x, #0x0047
      008285 7F               [ 1]  383 	clr	(x)
      008286 1E 73            [ 2]  384 	ldw	x, (0x73, sp)
      008288 1C 00 48         [ 2]  385 	addw	x, #0x0048
      00828B 7F               [ 1]  386 	clr	(x)
      00828C 1E 73            [ 2]  387 	ldw	x, (0x73, sp)
      00828E A6 7E            [ 1]  388 	ld	a, #0x7e
      008290 E7 49            [ 1]  389 	ld	(0x0049, x), a
      008292 1E 73            [ 2]  390 	ldw	x, (0x73, sp)
      008294 A6 04            [ 1]  391 	ld	a, #0x04
      008296 E7 4A            [ 1]  392 	ld	(0x004a, x), a
      008298 1E 73            [ 2]  393 	ldw	x, (0x73, sp)
      00829A A6 08            [ 1]  394 	ld	a, #0x08
      00829C E7 4B            [ 1]  395 	ld	(0x004b, x), a
      00829E 1E 73            [ 2]  396 	ldw	x, (0x73, sp)
      0082A0 A6 10            [ 1]  397 	ld	a, #0x10
      0082A2 E7 4C            [ 1]  398 	ld	(0x004c, x), a
      0082A4 1E 73            [ 2]  399 	ldw	x, (0x73, sp)
      0082A6 A6 20            [ 1]  400 	ld	a, #0x20
      0082A8 E7 4D            [ 1]  401 	ld	(0x004d, x), a
      0082AA 1E 73            [ 2]  402 	ldw	x, (0x73, sp)
      0082AC A6 7E            [ 1]  403 	ld	a, #0x7e
      0082AE E7 4E            [ 1]  404 	ld	(0x004e, x), a
      0082B0 1E 73            [ 2]  405 	ldw	x, (0x73, sp)
      0082B2 1C 00 4F         [ 2]  406 	addw	x, #0x004f
      0082B5 7F               [ 1]  407 	clr	(x)
      0082B6 1E 73            [ 2]  408 	ldw	x, (0x73, sp)
      0082B8 1C 00 50         [ 2]  409 	addw	x, #0x0050
      0082BB 7F               [ 1]  410 	clr	(x)
      0082BC 1E 73            [ 2]  411 	ldw	x, (0x73, sp)
      0082BE A6 7C            [ 1]  412 	ld	a, #0x7c
      0082C0 E7 51            [ 1]  413 	ld	(0x0051, x), a
      0082C2 1E 73            [ 2]  414 	ldw	x, (0x73, sp)
      0082C4 A6 12            [ 1]  415 	ld	a, #0x12
      0082C6 E7 52            [ 1]  416 	ld	(0x0052, x), a
      0082C8 1E 73            [ 2]  417 	ldw	x, (0x73, sp)
      0082CA A6 12            [ 1]  418 	ld	a, #0x12
      0082CC E7 53            [ 1]  419 	ld	(0x0053, x), a
      0082CE 1E 73            [ 2]  420 	ldw	x, (0x73, sp)
      0082D0 A6 12            [ 1]  421 	ld	a, #0x12
      0082D2 E7 54            [ 1]  422 	ld	(0x0054, x), a
      0082D4 1E 73            [ 2]  423 	ldw	x, (0x73, sp)
      0082D6 A6 12            [ 1]  424 	ld	a, #0x12
      0082D8 E7 55            [ 1]  425 	ld	(0x0055, x), a
      0082DA 1E 73            [ 2]  426 	ldw	x, (0x73, sp)
      0082DC A6 7C            [ 1]  427 	ld	a, #0x7c
      0082DE E7 56            [ 1]  428 	ld	(0x0056, x), a
      0082E0 1E 73            [ 2]  429 	ldw	x, (0x73, sp)
      0082E2 1C 00 57         [ 2]  430 	addw	x, #0x0057
      0082E5 7F               [ 1]  431 	clr	(x)
      0082E6 1E 73            [ 2]  432 	ldw	x, (0x73, sp)
      0082E8 1C 00 58         [ 2]  433 	addw	x, #0x0058
      0082EB 7F               [ 1]  434 	clr	(x)
      0082EC 1E 73            [ 2]  435 	ldw	x, (0x73, sp)
      0082EE 1C 00 59         [ 2]  436 	addw	x, #0x0059
      0082F1 7F               [ 1]  437 	clr	(x)
      0082F2 1E 73            [ 2]  438 	ldw	x, (0x73, sp)
      0082F4 1C 00 5A         [ 2]  439 	addw	x, #0x005a
      0082F7 7F               [ 1]  440 	clr	(x)
      0082F8 1E 73            [ 2]  441 	ldw	x, (0x73, sp)
      0082FA 1C 00 5B         [ 2]  442 	addw	x, #0x005b
      0082FD 7F               [ 1]  443 	clr	(x)
      0082FE 1E 73            [ 2]  444 	ldw	x, (0x73, sp)
      008300 1C 00 5C         [ 2]  445 	addw	x, #0x005c
      008303 7F               [ 1]  446 	clr	(x)
      008304 1E 73            [ 2]  447 	ldw	x, (0x73, sp)
      008306 1C 00 5D         [ 2]  448 	addw	x, #0x005d
      008309 7F               [ 1]  449 	clr	(x)
      00830A 1E 73            [ 2]  450 	ldw	x, (0x73, sp)
      00830C 1C 00 5E         [ 2]  451 	addw	x, #0x005e
      00830F 7F               [ 1]  452 	clr	(x)
      008310 1E 73            [ 2]  453 	ldw	x, (0x73, sp)
      008312 1C 00 5F         [ 2]  454 	addw	x, #0x005f
      008315 7F               [ 1]  455 	clr	(x)
                                    456 ;	user/main.c: 44: char smile[] = {0x3C, 0x43, 0x95, 0xA1, 0xA1, 0x95, 0x43, 0x3C};
      008316 96               [ 1]  457 	ldw	x, sp
      008317 5C               [ 2]  458 	incw	x
      008318 1F 71            [ 2]  459 	ldw	(0x71, sp), x
      00831A 1E 71            [ 2]  460 	ldw	x, (0x71, sp)
      00831C A6 3C            [ 1]  461 	ld	a, #0x3c
      00831E F7               [ 1]  462 	ld	(x), a
      00831F 1E 71            [ 2]  463 	ldw	x, (0x71, sp)
      008321 5C               [ 2]  464 	incw	x
      008322 A6 43            [ 1]  465 	ld	a, #0x43
      008324 F7               [ 1]  466 	ld	(x), a
      008325 1E 71            [ 2]  467 	ldw	x, (0x71, sp)
      008327 5C               [ 2]  468 	incw	x
      008328 5C               [ 2]  469 	incw	x
      008329 A6 95            [ 1]  470 	ld	a, #0x95
      00832B F7               [ 1]  471 	ld	(x), a
      00832C 1E 71            [ 2]  472 	ldw	x, (0x71, sp)
      00832E A6 A1            [ 1]  473 	ld	a, #0xa1
      008330 E7 03            [ 1]  474 	ld	(0x0003, x), a
      008332 1E 71            [ 2]  475 	ldw	x, (0x71, sp)
      008334 A6 A1            [ 1]  476 	ld	a, #0xa1
      008336 E7 04            [ 1]  477 	ld	(0x0004, x), a
      008338 1E 71            [ 2]  478 	ldw	x, (0x71, sp)
      00833A A6 95            [ 1]  479 	ld	a, #0x95
      00833C E7 05            [ 1]  480 	ld	(0x0005, x), a
      00833E 1E 71            [ 2]  481 	ldw	x, (0x71, sp)
      008340 A6 43            [ 1]  482 	ld	a, #0x43
      008342 E7 06            [ 1]  483 	ld	(0x0006, x), a
      008344 1E 71            [ 2]  484 	ldw	x, (0x71, sp)
      008346 A6 3C            [ 1]  485 	ld	a, #0x3c
      008348 E7 07            [ 1]  486 	ld	(0x0007, x), a
                                    487 ;	user/main.c: 45: CLK_Config();
      00834A CD 87 F1         [ 4]  488 	call	_CLK_Config
                                    489 ;	user/main.c: 46: GPIO_setup(); 
      00834D CD 83 83         [ 4]  490 	call	_GPIO_setup
                                    491 ;	user/main.c: 47: SPI_setup(); 
      008350 CD 83 91         [ 4]  492 	call	_SPI_setup
                                    493 ;	user/main.c: 48: Max7219_Init();
      008353 CD 83 BC         [ 4]  494 	call	_Max7219_Init
                                    495 ;	user/main.c: 49: for(i=0; i < 8; i++)
      008356 4F               [ 1]  496 	clr	a
      008357                        497 00106$:
                                    498 ;	user/main.c: 51: Max7219_Write(i+1, 0x00);
      008357 4C               [ 1]  499 	inc	a
      008358 88               [ 1]  500 	push	a
      008359 4B 00            [ 1]  501 	push	#0x00
      00835B 88               [ 1]  502 	push	a
      00835C CD 83 F8         [ 4]  503 	call	_Max7219_Write
      00835F 85               [ 2]  504 	popw	x
      008360 84               [ 1]  505 	pop	a
                                    506 ;	user/main.c: 49: for(i=0; i < 8; i++)
      008361 A1 08            [ 1]  507 	cp	a, #0x08
      008363 25 F2            [ 1]  508 	jrc	00106$
                                    509 ;	user/main.c: 53: for(i=0;i<sizeof(smile);i++)
      008365 4F               [ 1]  510 	clr	a
      008366                        511 00108$:
                                    512 ;	user/main.c: 55: Max7219_Write(i+1, smile[i]);
      008366 5F               [ 1]  513 	clrw	x
      008367 97               [ 1]  514 	ld	xl, a
      008368 72 FB 71         [ 2]  515 	addw	x, (0x71, sp)
      00836B 88               [ 1]  516 	push	a
      00836C F6               [ 1]  517 	ld	a, (x)
      00836D 97               [ 1]  518 	ld	xl, a
      00836E 84               [ 1]  519 	pop	a
      00836F 4C               [ 1]  520 	inc	a
      008370 88               [ 1]  521 	push	a
      008371 89               [ 2]  522 	pushw	x
      008372 5B 01            [ 2]  523 	addw	sp, #1
      008374 88               [ 1]  524 	push	a
      008375 CD 83 F8         [ 4]  525 	call	_Max7219_Write
      008378 85               [ 2]  526 	popw	x
      008379 84               [ 1]  527 	pop	a
                                    528 ;	user/main.c: 53: for(i=0;i<sizeof(smile);i++)
      00837A A1 08            [ 1]  529 	cp	a, #0x08
      00837C 25 E8            [ 1]  530 	jrc	00108$
                                    531 ;	user/main.c: 57: while(TRUE) 
      00837E                        532 00104$:
      00837E 20 FE            [ 2]  533 	jra	00104$
      008380 5B 74            [ 2]  534 	addw	sp, #116
      008382 81               [ 4]  535 	ret
                                    536 ;	user/main.c: 75: void GPIO_setup(void) 
                                    537 ;	-----------------------------------------
                                    538 ;	 function GPIO_setup
                                    539 ;	-----------------------------------------
      008383                        540 _GPIO_setup:
                                    541 ;	user/main.c: 77: GPIO_Init(GPIOC, ((GPIO_Pin_TypeDef)GPIO_PIN_5 | GPIO_PIN_6), GPIO_MODE_OUT_PP_HIGH_FAST);
      008383 4B F0            [ 1]  542 	push	#0xf0
      008385 4B 60            [ 1]  543 	push	#0x60
      008387 4B 0A            [ 1]  544 	push	#0x0a
      008389 4B 50            [ 1]  545 	push	#0x50
      00838B CD 89 2C         [ 4]  546 	call	_GPIO_Init
      00838E 5B 04            [ 2]  547 	addw	sp, #4
      008390 81               [ 4]  548 	ret
                                    549 ;	user/main.c: 79: void SPI_setup(void) 
                                    550 ;	-----------------------------------------
                                    551 ;	 function SPI_setup
                                    552 ;	-----------------------------------------
      008391                        553 _SPI_setup:
                                    554 ;	user/main.c: 81: SPI_DeInit(); SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, SPI_DATADIRECTION_1LINE_TX, SPI_NSS_SOFT ,0x00); 
      008391 CD 8A 26         [ 4]  555 	call	_SPI_DeInit
      008394 4B 00            [ 1]  556 	push	#0x00
      008396 4B 02            [ 1]  557 	push	#0x02
      008398 4B C0            [ 1]  558 	push	#0xc0
      00839A 4B 00            [ 1]  559 	push	#0x00
      00839C 4B 02            [ 1]  560 	push	#0x02
      00839E 4B 04            [ 1]  561 	push	#0x04
      0083A0 4B 00            [ 1]  562 	push	#0x00
      0083A2 4B 00            [ 1]  563 	push	#0x00
      0083A4 CD 8A 3B         [ 4]  564 	call	_SPI_Init
      0083A7 5B 08            [ 2]  565 	addw	sp, #8
                                    566 ;	user/main.c: 82: SPI_Cmd(ENABLE);
      0083A9 4B 01            [ 1]  567 	push	#0x01
      0083AB CD 8A 76         [ 4]  568 	call	_SPI_Cmd
      0083AE 84               [ 1]  569 	pop	a
      0083AF 81               [ 4]  570 	ret
                                    571 	.area CODE
                                    572 	.area INITIALIZER
                                    573 	.area CABS (ABS)
