                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_spi
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SPI_DeInit
                                     12 	.globl _SPI_Init
                                     13 	.globl _SPI_Cmd
                                     14 	.globl _SPI_ITConfig
                                     15 	.globl _SPI_SendData
                                     16 	.globl _SPI_ReceiveData
                                     17 	.globl _SPI_NSSInternalSoftwareCmd
                                     18 	.globl _SPI_TransmitCRC
                                     19 	.globl _SPI_CalculateCRCCmd
                                     20 	.globl _SPI_GetCRC
                                     21 	.globl _SPI_ResetCRC
                                     22 	.globl _SPI_GetCRCPolynomial
                                     23 	.globl _SPI_BiDirectionalLineConfig
                                     24 	.globl _SPI_GetFlagStatus
                                     25 	.globl _SPI_ClearFlag
                                     26 	.globl _SPI_GetITStatus
                                     27 	.globl _SPI_ClearITPendingBit
                                     28 ;--------------------------------------------------------
                                     29 ; ram data
                                     30 ;--------------------------------------------------------
                                     31 	.area DATA
                                     32 ;--------------------------------------------------------
                                     33 ; ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area INITIALIZED
                                     36 ;--------------------------------------------------------
                                     37 ; absolute external ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DABS (ABS)
                                     40 ;--------------------------------------------------------
                                     41 ; global & static initialisations
                                     42 ;--------------------------------------------------------
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area GSINIT
                                     47 ;--------------------------------------------------------
                                     48 ; Home
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area HOME
                                     52 ;--------------------------------------------------------
                                     53 ; code
                                     54 ;--------------------------------------------------------
                                     55 	.area CODE
                                     56 ;	lib/stm8s_spi.c: 13: void SPI_DeInit(void)
                                     57 ;	-----------------------------------------
                                     58 ;	 function SPI_DeInit
                                     59 ;	-----------------------------------------
      008C7D                         60 _SPI_DeInit:
                                     61 ;	lib/stm8s_spi.c: 15: SPI->CR1    = SPI_CR1_RESET_VALUE;
      008C7D 35 00 52 00      [ 1]   62 	mov	0x5200+0, #0x00
                                     63 ;	lib/stm8s_spi.c: 16: SPI->CR2    = SPI_CR2_RESET_VALUE;
      008C81 35 00 52 01      [ 1]   64 	mov	0x5201+0, #0x00
                                     65 ;	lib/stm8s_spi.c: 17: SPI->ICR    = SPI_ICR_RESET_VALUE;
      008C85 35 00 52 02      [ 1]   66 	mov	0x5202+0, #0x00
                                     67 ;	lib/stm8s_spi.c: 18: SPI->SR     = SPI_SR_RESET_VALUE;
      008C89 35 02 52 03      [ 1]   68 	mov	0x5203+0, #0x02
                                     69 ;	lib/stm8s_spi.c: 19: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
      008C8D 35 07 52 05      [ 1]   70 	mov	0x5205+0, #0x07
      008C91 81               [ 4]   71 	ret
                                     72 ;	lib/stm8s_spi.c: 22: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
                                     73 ;	-----------------------------------------
                                     74 ;	 function SPI_Init
                                     75 ;	-----------------------------------------
      008C92                         76 _SPI_Init:
      008C92 88               [ 1]   77 	push	a
                                     78 ;	lib/stm8s_spi.c: 25: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
      008C93 7B 04            [ 1]   79 	ld	a, (0x04, sp)
      008C95 1A 05            [ 1]   80 	or	a, (0x05, sp)
      008C97 6B 01            [ 1]   81 	ld	(0x01, sp), a
                                     82 ;	lib/stm8s_spi.c: 26: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
      008C99 7B 07            [ 1]   83 	ld	a, (0x07, sp)
      008C9B 1A 08            [ 1]   84 	or	a, (0x08, sp)
      008C9D 1A 01            [ 1]   85 	or	a, (0x01, sp)
      008C9F AE 52 00         [ 2]   86 	ldw	x, #0x5200
      008CA2 F7               [ 1]   87 	ld	(x), a
                                     88 ;	lib/stm8s_spi.c: 29: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
      008CA3 7B 09            [ 1]   89 	ld	a, (0x09, sp)
      008CA5 1A 0A            [ 1]   90 	or	a, (0x0a, sp)
      008CA7 AE 52 01         [ 2]   91 	ldw	x, #0x5201
      008CAA F7               [ 1]   92 	ld	(x), a
                                     93 ;	lib/stm8s_spi.c: 31: if (Mode == SPI_MODE_MASTER)
      008CAB 7B 06            [ 1]   94 	ld	a, (0x06, sp)
      008CAD A1 04            [ 1]   95 	cp	a, #0x04
      008CAF 26 06            [ 1]   96 	jrne	00102$
                                     97 ;	lib/stm8s_spi.c: 33: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
      008CB1 72 10 52 01      [ 1]   98 	bset	0x5201, #0
      008CB5 20 04            [ 2]   99 	jra	00103$
      008CB7                        100 00102$:
                                    101 ;	lib/stm8s_spi.c: 37: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
      008CB7 72 11 52 01      [ 1]  102 	bres	0x5201, #0
      008CBB                        103 00103$:
                                    104 ;	lib/stm8s_spi.c: 41: SPI->CR1 |= (uint8_t)(Mode);
      008CBB AE 52 00         [ 2]  105 	ldw	x, #0x5200
      008CBE F6               [ 1]  106 	ld	a, (x)
      008CBF 1A 06            [ 1]  107 	or	a, (0x06, sp)
      008CC1 AE 52 00         [ 2]  108 	ldw	x, #0x5200
      008CC4 F7               [ 1]  109 	ld	(x), a
                                    110 ;	lib/stm8s_spi.c: 44: SPI->CRCPR = (uint8_t)CRCPolynomial;
      008CC5 AE 52 05         [ 2]  111 	ldw	x, #0x5205
      008CC8 7B 0B            [ 1]  112 	ld	a, (0x0b, sp)
      008CCA F7               [ 1]  113 	ld	(x), a
      008CCB 84               [ 1]  114 	pop	a
      008CCC 81               [ 4]  115 	ret
                                    116 ;	lib/stm8s_spi.c: 47: void SPI_Cmd(FunctionalState NewState)
                                    117 ;	-----------------------------------------
                                    118 ;	 function SPI_Cmd
                                    119 ;	-----------------------------------------
      008CCD                        120 _SPI_Cmd:
                                    121 ;	lib/stm8s_spi.c: 50: if (NewState != DISABLE)
      008CCD 0D 03            [ 1]  122 	tnz	(0x03, sp)
      008CCF 27 08            [ 1]  123 	jreq	00102$
                                    124 ;	lib/stm8s_spi.c: 52: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
      008CD1 AE 52 00         [ 2]  125 	ldw	x, #0x5200
      008CD4 F6               [ 1]  126 	ld	a, (x)
      008CD5 AA 40            [ 1]  127 	or	a, #0x40
      008CD7 F7               [ 1]  128 	ld	(x), a
      008CD8 81               [ 4]  129 	ret
      008CD9                        130 00102$:
                                    131 ;	lib/stm8s_spi.c: 56: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
      008CD9 AE 52 00         [ 2]  132 	ldw	x, #0x5200
      008CDC F6               [ 1]  133 	ld	a, (x)
      008CDD A4 BF            [ 1]  134 	and	a, #0xbf
      008CDF F7               [ 1]  135 	ld	(x), a
      008CE0 81               [ 4]  136 	ret
                                    137 ;	lib/stm8s_spi.c: 60: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function SPI_ITConfig
                                    140 ;	-----------------------------------------
      008CE1                        141 _SPI_ITConfig:
      008CE1 89               [ 2]  142 	pushw	x
                                    143 ;	lib/stm8s_spi.c: 65: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
      008CE2 7B 05            [ 1]  144 	ld	a, (0x05, sp)
      008CE4 A4 0F            [ 1]  145 	and	a, #0x0f
      008CE6 97               [ 1]  146 	ld	xl, a
      008CE7 A6 01            [ 1]  147 	ld	a, #0x01
      008CE9 88               [ 1]  148 	push	a
      008CEA 9F               [ 1]  149 	ld	a, xl
      008CEB 4D               [ 1]  150 	tnz	a
      008CEC 27 05            [ 1]  151 	jreq	00111$
      008CEE                        152 00110$:
      008CEE 08 01            [ 1]  153 	sll	(1, sp)
      008CF0 4A               [ 1]  154 	dec	a
      008CF1 26 FB            [ 1]  155 	jrne	00110$
      008CF3                        156 00111$:
      008CF3 84               [ 1]  157 	pop	a
      008CF4 6B 01            [ 1]  158 	ld	(0x01, sp), a
                                    159 ;	lib/stm8s_spi.c: 67: if (NewState != DISABLE)
      008CF6 0D 06            [ 1]  160 	tnz	(0x06, sp)
      008CF8 27 0C            [ 1]  161 	jreq	00102$
                                    162 ;	lib/stm8s_spi.c: 69: SPI->ICR |= itpos; /* Enable interrupt*/
      008CFA AE 52 02         [ 2]  163 	ldw	x, #0x5202
      008CFD F6               [ 1]  164 	ld	a, (x)
      008CFE 1A 01            [ 1]  165 	or	a, (0x01, sp)
      008D00 AE 52 02         [ 2]  166 	ldw	x, #0x5202
      008D03 F7               [ 1]  167 	ld	(x), a
      008D04 20 0F            [ 2]  168 	jra	00104$
      008D06                        169 00102$:
                                    170 ;	lib/stm8s_spi.c: 73: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
      008D06 AE 52 02         [ 2]  171 	ldw	x, #0x5202
      008D09 F6               [ 1]  172 	ld	a, (x)
      008D0A 6B 02            [ 1]  173 	ld	(0x02, sp), a
      008D0C 7B 01            [ 1]  174 	ld	a, (0x01, sp)
      008D0E 43               [ 1]  175 	cpl	a
      008D0F 14 02            [ 1]  176 	and	a, (0x02, sp)
      008D11 AE 52 02         [ 2]  177 	ldw	x, #0x5202
      008D14 F7               [ 1]  178 	ld	(x), a
      008D15                        179 00104$:
      008D15 85               [ 2]  180 	popw	x
      008D16 81               [ 4]  181 	ret
                                    182 ;	lib/stm8s_spi.c: 77: void SPI_SendData(uint8_t Data)
                                    183 ;	-----------------------------------------
                                    184 ;	 function SPI_SendData
                                    185 ;	-----------------------------------------
      008D17                        186 _SPI_SendData:
                                    187 ;	lib/stm8s_spi.c: 79: SPI->DR = Data; 
      008D17 AE 52 04         [ 2]  188 	ldw	x, #0x5204
      008D1A 7B 03            [ 1]  189 	ld	a, (0x03, sp)
      008D1C F7               [ 1]  190 	ld	(x), a
      008D1D 81               [ 4]  191 	ret
                                    192 ;	lib/stm8s_spi.c: 82: uint8_t SPI_ReceiveData(void)
                                    193 ;	-----------------------------------------
                                    194 ;	 function SPI_ReceiveData
                                    195 ;	-----------------------------------------
      008D1E                        196 _SPI_ReceiveData:
                                    197 ;	lib/stm8s_spi.c: 84: return ((uint8_t)SPI->DR); 
      008D1E AE 52 04         [ 2]  198 	ldw	x, #0x5204
      008D21 F6               [ 1]  199 	ld	a, (x)
      008D22 81               [ 4]  200 	ret
                                    201 ;	lib/stm8s_spi.c: 87: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
                                    202 ;	-----------------------------------------
                                    203 ;	 function SPI_NSSInternalSoftwareCmd
                                    204 ;	-----------------------------------------
      008D23                        205 _SPI_NSSInternalSoftwareCmd:
                                    206 ;	lib/stm8s_spi.c: 89: if (NewState != DISABLE)
      008D23 0D 03            [ 1]  207 	tnz	(0x03, sp)
      008D25 27 05            [ 1]  208 	jreq	00102$
                                    209 ;	lib/stm8s_spi.c: 91: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
      008D27 72 10 52 01      [ 1]  210 	bset	0x5201, #0
      008D2B 81               [ 4]  211 	ret
      008D2C                        212 00102$:
                                    213 ;	lib/stm8s_spi.c: 95: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
      008D2C 72 11 52 01      [ 1]  214 	bres	0x5201, #0
      008D30 81               [ 4]  215 	ret
                                    216 ;	lib/stm8s_spi.c: 99: void SPI_TransmitCRC(void)
                                    217 ;	-----------------------------------------
                                    218 ;	 function SPI_TransmitCRC
                                    219 ;	-----------------------------------------
      008D31                        220 _SPI_TransmitCRC:
                                    221 ;	lib/stm8s_spi.c: 101: SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
      008D31 AE 52 01         [ 2]  222 	ldw	x, #0x5201
      008D34 F6               [ 1]  223 	ld	a, (x)
      008D35 AA 10            [ 1]  224 	or	a, #0x10
      008D37 F7               [ 1]  225 	ld	(x), a
      008D38 81               [ 4]  226 	ret
                                    227 ;	lib/stm8s_spi.c: 104: void SPI_CalculateCRCCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function SPI_CalculateCRCCmd
                                    230 ;	-----------------------------------------
      008D39                        231 _SPI_CalculateCRCCmd:
                                    232 ;	lib/stm8s_spi.c: 107: if (NewState != DISABLE)
      008D39 0D 03            [ 1]  233 	tnz	(0x03, sp)
      008D3B 27 08            [ 1]  234 	jreq	00102$
                                    235 ;	lib/stm8s_spi.c: 109: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
      008D3D AE 52 01         [ 2]  236 	ldw	x, #0x5201
      008D40 F6               [ 1]  237 	ld	a, (x)
      008D41 AA 20            [ 1]  238 	or	a, #0x20
      008D43 F7               [ 1]  239 	ld	(x), a
      008D44 81               [ 4]  240 	ret
      008D45                        241 00102$:
                                    242 ;	lib/stm8s_spi.c: 113: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
      008D45 AE 52 01         [ 2]  243 	ldw	x, #0x5201
      008D48 F6               [ 1]  244 	ld	a, (x)
      008D49 A4 DF            [ 1]  245 	and	a, #0xdf
      008D4B F7               [ 1]  246 	ld	(x), a
      008D4C 81               [ 4]  247 	ret
                                    248 ;	lib/stm8s_spi.c: 117: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
                                    249 ;	-----------------------------------------
                                    250 ;	 function SPI_GetCRC
                                    251 ;	-----------------------------------------
      008D4D                        252 _SPI_GetCRC:
                                    253 ;	lib/stm8s_spi.c: 122: if (SPI_CRC != SPI_CRC_RX)
      008D4D 0D 03            [ 1]  254 	tnz	(0x03, sp)
      008D4F 27 05            [ 1]  255 	jreq	00102$
                                    256 ;	lib/stm8s_spi.c: 124: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
      008D51 AE 52 07         [ 2]  257 	ldw	x, #0x5207
      008D54 F6               [ 1]  258 	ld	a, (x)
      008D55 81               [ 4]  259 	ret
      008D56                        260 00102$:
                                    261 ;	lib/stm8s_spi.c: 128: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
      008D56 AE 52 06         [ 2]  262 	ldw	x, #0x5206
      008D59 F6               [ 1]  263 	ld	a, (x)
                                    264 ;	lib/stm8s_spi.c: 132: return crcreg;
      008D5A 81               [ 4]  265 	ret
                                    266 ;	lib/stm8s_spi.c: 135: void SPI_ResetCRC(void)
                                    267 ;	-----------------------------------------
                                    268 ;	 function SPI_ResetCRC
                                    269 ;	-----------------------------------------
      008D5B                        270 _SPI_ResetCRC:
                                    271 ;	lib/stm8s_spi.c: 139: SPI_CalculateCRCCmd(ENABLE);
      008D5B 4B 01            [ 1]  272 	push	#0x01
      008D5D CD 8D 39         [ 4]  273 	call	_SPI_CalculateCRCCmd
      008D60 84               [ 1]  274 	pop	a
                                    275 ;	lib/stm8s_spi.c: 142: SPI_Cmd(ENABLE);
      008D61 4B 01            [ 1]  276 	push	#0x01
      008D63 CD 8C CD         [ 4]  277 	call	_SPI_Cmd
      008D66 84               [ 1]  278 	pop	a
      008D67 81               [ 4]  279 	ret
                                    280 ;	lib/stm8s_spi.c: 150: uint8_t SPI_GetCRCPolynomial(void)
                                    281 ;	-----------------------------------------
                                    282 ;	 function SPI_GetCRCPolynomial
                                    283 ;	-----------------------------------------
      008D68                        284 _SPI_GetCRCPolynomial:
                                    285 ;	lib/stm8s_spi.c: 152: return SPI->CRCPR; /* Return the CRC polynomial register */
      008D68 AE 52 05         [ 2]  286 	ldw	x, #0x5205
      008D6B F6               [ 1]  287 	ld	a, (x)
      008D6C 81               [ 4]  288 	ret
                                    289 ;	lib/stm8s_spi.c: 160: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
                                    290 ;	-----------------------------------------
                                    291 ;	 function SPI_BiDirectionalLineConfig
                                    292 ;	-----------------------------------------
      008D6D                        293 _SPI_BiDirectionalLineConfig:
                                    294 ;	lib/stm8s_spi.c: 163: if (SPI_Direction != SPI_DIRECTION_RX)
      008D6D 0D 03            [ 1]  295 	tnz	(0x03, sp)
      008D6F 27 08            [ 1]  296 	jreq	00102$
                                    297 ;	lib/stm8s_spi.c: 165: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
      008D71 AE 52 01         [ 2]  298 	ldw	x, #0x5201
      008D74 F6               [ 1]  299 	ld	a, (x)
      008D75 AA 40            [ 1]  300 	or	a, #0x40
      008D77 F7               [ 1]  301 	ld	(x), a
      008D78 81               [ 4]  302 	ret
      008D79                        303 00102$:
                                    304 ;	lib/stm8s_spi.c: 169: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
      008D79 AE 52 01         [ 2]  305 	ldw	x, #0x5201
      008D7C F6               [ 1]  306 	ld	a, (x)
      008D7D A4 BF            [ 1]  307 	and	a, #0xbf
      008D7F F7               [ 1]  308 	ld	(x), a
      008D80 81               [ 4]  309 	ret
                                    310 ;	lib/stm8s_spi.c: 174: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
                                    311 ;	-----------------------------------------
                                    312 ;	 function SPI_GetFlagStatus
                                    313 ;	-----------------------------------------
      008D81                        314 _SPI_GetFlagStatus:
                                    315 ;	lib/stm8s_spi.c: 178: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
      008D81 AE 52 03         [ 2]  316 	ldw	x, #0x5203
      008D84 F6               [ 1]  317 	ld	a, (x)
      008D85 14 03            [ 1]  318 	and	a, (0x03, sp)
      008D87 4D               [ 1]  319 	tnz	a
      008D88 27 03            [ 1]  320 	jreq	00102$
                                    321 ;	lib/stm8s_spi.c: 180: status = SET; /* SPI_FLAG is set */
      008D8A A6 01            [ 1]  322 	ld	a, #0x01
      008D8C 81               [ 4]  323 	ret
      008D8D                        324 00102$:
                                    325 ;	lib/stm8s_spi.c: 184: status = RESET; /* SPI_FLAG is reset*/
      008D8D 4F               [ 1]  326 	clr	a
                                    327 ;	lib/stm8s_spi.c: 188: return status;
      008D8E 81               [ 4]  328 	ret
                                    329 ;	lib/stm8s_spi.c: 191: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
                                    330 ;	-----------------------------------------
                                    331 ;	 function SPI_ClearFlag
                                    332 ;	-----------------------------------------
      008D8F                        333 _SPI_ClearFlag:
                                    334 ;	lib/stm8s_spi.c: 193: SPI->SR = (uint8_t)(~SPI_FLAG);
      008D8F 7B 03            [ 1]  335 	ld	a, (0x03, sp)
      008D91 43               [ 1]  336 	cpl	a
      008D92 AE 52 03         [ 2]  337 	ldw	x, #0x5203
      008D95 F7               [ 1]  338 	ld	(x), a
      008D96 81               [ 4]  339 	ret
                                    340 ;	lib/stm8s_spi.c: 196: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
                                    341 ;	-----------------------------------------
                                    342 ;	 function SPI_GetITStatus
                                    343 ;	-----------------------------------------
      008D97                        344 _SPI_GetITStatus:
      008D97 52 03            [ 2]  345 	sub	sp, #3
                                    346 ;	lib/stm8s_spi.c: 204: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
      008D99 7B 06            [ 1]  347 	ld	a, (0x06, sp)
      008D9B A4 0F            [ 1]  348 	and	a, #0x0f
      008D9D 97               [ 1]  349 	ld	xl, a
      008D9E A6 01            [ 1]  350 	ld	a, #0x01
      008DA0 88               [ 1]  351 	push	a
      008DA1 9F               [ 1]  352 	ld	a, xl
      008DA2 4D               [ 1]  353 	tnz	a
      008DA3 27 05            [ 1]  354 	jreq	00116$
      008DA5                        355 00115$:
      008DA5 08 01            [ 1]  356 	sll	(1, sp)
      008DA7 4A               [ 1]  357 	dec	a
      008DA8 26 FB            [ 1]  358 	jrne	00115$
      008DAA                        359 00116$:
      008DAA 84               [ 1]  360 	pop	a
      008DAB 6B 03            [ 1]  361 	ld	(0x03, sp), a
                                    362 ;	lib/stm8s_spi.c: 207: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
      008DAD 7B 06            [ 1]  363 	ld	a, (0x06, sp)
      008DAF 4E               [ 1]  364 	swap	a
      008DB0 A4 0F            [ 1]  365 	and	a, #0x0f
      008DB2 97               [ 1]  366 	ld	xl, a
                                    367 ;	lib/stm8s_spi.c: 209: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008DB3 A6 01            [ 1]  368 	ld	a, #0x01
      008DB5 88               [ 1]  369 	push	a
      008DB6 9F               [ 1]  370 	ld	a, xl
      008DB7 4D               [ 1]  371 	tnz	a
      008DB8 27 05            [ 1]  372 	jreq	00118$
      008DBA                        373 00117$:
      008DBA 08 01            [ 1]  374 	sll	(1, sp)
      008DBC 4A               [ 1]  375 	dec	a
      008DBD 26 FB            [ 1]  376 	jrne	00117$
      008DBF                        377 00118$:
      008DBF 84               [ 1]  378 	pop	a
      008DC0 6B 01            [ 1]  379 	ld	(0x01, sp), a
                                    380 ;	lib/stm8s_spi.c: 211: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
      008DC2 AE 52 03         [ 2]  381 	ldw	x, #0x5203
      008DC5 F6               [ 1]  382 	ld	a, (x)
      008DC6 14 01            [ 1]  383 	and	a, (0x01, sp)
      008DC8 6B 02            [ 1]  384 	ld	(0x02, sp), a
                                    385 ;	lib/stm8s_spi.c: 213: if (((SPI->ICR & itpos) != RESET) && enablestatus)
      008DCA AE 52 02         [ 2]  386 	ldw	x, #0x5202
      008DCD F6               [ 1]  387 	ld	a, (x)
      008DCE 14 03            [ 1]  388 	and	a, (0x03, sp)
      008DD0 4D               [ 1]  389 	tnz	a
      008DD1 27 07            [ 1]  390 	jreq	00102$
      008DD3 0D 02            [ 1]  391 	tnz	(0x02, sp)
      008DD5 27 03            [ 1]  392 	jreq	00102$
                                    393 ;	lib/stm8s_spi.c: 216: pendingbitstatus = SET;
      008DD7 A6 01            [ 1]  394 	ld	a, #0x01
                                    395 ;	lib/stm8s_spi.c: 221: pendingbitstatus = RESET;
      008DD9 21                     396 	.byte 0x21
      008DDA                        397 00102$:
      008DDA 4F               [ 1]  398 	clr	a
      008DDB                        399 00103$:
                                    400 ;	lib/stm8s_spi.c: 224: return  pendingbitstatus;
      008DDB 5B 03            [ 2]  401 	addw	sp, #3
      008DDD 81               [ 4]  402 	ret
                                    403 ;	lib/stm8s_spi.c: 227: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
                                    404 ;	-----------------------------------------
                                    405 ;	 function SPI_ClearITPendingBit
                                    406 ;	-----------------------------------------
      008DDE                        407 _SPI_ClearITPendingBit:
                                    408 ;	lib/stm8s_spi.c: 234: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
      008DDE 7B 03            [ 1]  409 	ld	a, (0x03, sp)
      008DE0 A4 F0            [ 1]  410 	and	a, #0xf0
      008DE2 4E               [ 1]  411 	swap	a
      008DE3 A4 0F            [ 1]  412 	and	a, #0x0f
      008DE5 97               [ 1]  413 	ld	xl, a
      008DE6 A6 01            [ 1]  414 	ld	a, #0x01
      008DE8 88               [ 1]  415 	push	a
      008DE9 9F               [ 1]  416 	ld	a, xl
      008DEA 4D               [ 1]  417 	tnz	a
      008DEB 27 05            [ 1]  418 	jreq	00104$
      008DED                        419 00103$:
      008DED 08 01            [ 1]  420 	sll	(1, sp)
      008DEF 4A               [ 1]  421 	dec	a
      008DF0 26 FB            [ 1]  422 	jrne	00103$
      008DF2                        423 00104$:
      008DF2 84               [ 1]  424 	pop	a
                                    425 ;	lib/stm8s_spi.c: 236: SPI->SR = (uint8_t)(~itpos);
      008DF3 43               [ 1]  426 	cpl	a
      008DF4 AE 52 03         [ 2]  427 	ldw	x, #0x5203
      008DF7 F7               [ 1]  428 	ld	(x), a
      008DF8 81               [ 4]  429 	ret
                                    430 	.area CODE
                                    431 	.area INITIALIZER
                                    432 	.area CABS (ABS)
