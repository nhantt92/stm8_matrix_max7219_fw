                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
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
      008A26                         60 _SPI_DeInit:
                                     61 ;	lib/stm8s_spi.c: 15: SPI->CR1    = SPI_CR1_RESET_VALUE;
      008A26 35 00 52 00      [ 1]   62 	mov	0x5200+0, #0x00
                                     63 ;	lib/stm8s_spi.c: 16: SPI->CR2    = SPI_CR2_RESET_VALUE;
      008A2A 35 00 52 01      [ 1]   64 	mov	0x5201+0, #0x00
                                     65 ;	lib/stm8s_spi.c: 17: SPI->ICR    = SPI_ICR_RESET_VALUE;
      008A2E 35 00 52 02      [ 1]   66 	mov	0x5202+0, #0x00
                                     67 ;	lib/stm8s_spi.c: 18: SPI->SR     = SPI_SR_RESET_VALUE;
      008A32 35 02 52 03      [ 1]   68 	mov	0x5203+0, #0x02
                                     69 ;	lib/stm8s_spi.c: 19: SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
      008A36 35 07 52 05      [ 1]   70 	mov	0x5205+0, #0x07
      008A3A 81               [ 4]   71 	ret
                                     72 ;	lib/stm8s_spi.c: 22: void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
                                     73 ;	-----------------------------------------
                                     74 ;	 function SPI_Init
                                     75 ;	-----------------------------------------
      008A3B                         76 _SPI_Init:
      008A3B 88               [ 1]   77 	push	a
                                     78 ;	lib/stm8s_spi.c: 25: SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
      008A3C 7B 04            [ 1]   79 	ld	a, (0x04, sp)
      008A3E 1A 05            [ 1]   80 	or	a, (0x05, sp)
      008A40 6B 01            [ 1]   81 	ld	(0x01, sp), a
                                     82 ;	lib/stm8s_spi.c: 26: (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
      008A42 7B 07            [ 1]   83 	ld	a, (0x07, sp)
      008A44 1A 08            [ 1]   84 	or	a, (0x08, sp)
      008A46 1A 01            [ 1]   85 	or	a, (0x01, sp)
      008A48 AE 52 00         [ 2]   86 	ldw	x, #0x5200
      008A4B F7               [ 1]   87 	ld	(x), a
                                     88 ;	lib/stm8s_spi.c: 29: SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
      008A4C 7B 09            [ 1]   89 	ld	a, (0x09, sp)
      008A4E 1A 0A            [ 1]   90 	or	a, (0x0a, sp)
      008A50 AE 52 01         [ 2]   91 	ldw	x, #0x5201
      008A53 F7               [ 1]   92 	ld	(x), a
                                     93 ;	lib/stm8s_spi.c: 31: if (Mode == SPI_MODE_MASTER)
      008A54 7B 06            [ 1]   94 	ld	a, (0x06, sp)
      008A56 A1 04            [ 1]   95 	cp	a, #0x04
      008A58 26 06            [ 1]   96 	jrne	00102$
                                     97 ;	lib/stm8s_spi.c: 33: SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
      008A5A 72 10 52 01      [ 1]   98 	bset	0x5201, #0
      008A5E 20 04            [ 2]   99 	jra	00103$
      008A60                        100 00102$:
                                    101 ;	lib/stm8s_spi.c: 37: SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
      008A60 72 11 52 01      [ 1]  102 	bres	0x5201, #0
      008A64                        103 00103$:
                                    104 ;	lib/stm8s_spi.c: 41: SPI->CR1 |= (uint8_t)(Mode);
      008A64 AE 52 00         [ 2]  105 	ldw	x, #0x5200
      008A67 F6               [ 1]  106 	ld	a, (x)
      008A68 1A 06            [ 1]  107 	or	a, (0x06, sp)
      008A6A AE 52 00         [ 2]  108 	ldw	x, #0x5200
      008A6D F7               [ 1]  109 	ld	(x), a
                                    110 ;	lib/stm8s_spi.c: 44: SPI->CRCPR = (uint8_t)CRCPolynomial;
      008A6E AE 52 05         [ 2]  111 	ldw	x, #0x5205
      008A71 7B 0B            [ 1]  112 	ld	a, (0x0b, sp)
      008A73 F7               [ 1]  113 	ld	(x), a
      008A74 84               [ 1]  114 	pop	a
      008A75 81               [ 4]  115 	ret
                                    116 ;	lib/stm8s_spi.c: 47: void SPI_Cmd(FunctionalState NewState)
                                    117 ;	-----------------------------------------
                                    118 ;	 function SPI_Cmd
                                    119 ;	-----------------------------------------
      008A76                        120 _SPI_Cmd:
                                    121 ;	lib/stm8s_spi.c: 50: if (NewState != DISABLE)
      008A76 0D 03            [ 1]  122 	tnz	(0x03, sp)
      008A78 27 08            [ 1]  123 	jreq	00102$
                                    124 ;	lib/stm8s_spi.c: 52: SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
      008A7A AE 52 00         [ 2]  125 	ldw	x, #0x5200
      008A7D F6               [ 1]  126 	ld	a, (x)
      008A7E AA 40            [ 1]  127 	or	a, #0x40
      008A80 F7               [ 1]  128 	ld	(x), a
      008A81 81               [ 4]  129 	ret
      008A82                        130 00102$:
                                    131 ;	lib/stm8s_spi.c: 56: SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
      008A82 AE 52 00         [ 2]  132 	ldw	x, #0x5200
      008A85 F6               [ 1]  133 	ld	a, (x)
      008A86 A4 BF            [ 1]  134 	and	a, #0xbf
      008A88 F7               [ 1]  135 	ld	(x), a
      008A89 81               [ 4]  136 	ret
                                    137 ;	lib/stm8s_spi.c: 60: void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
                                    138 ;	-----------------------------------------
                                    139 ;	 function SPI_ITConfig
                                    140 ;	-----------------------------------------
      008A8A                        141 _SPI_ITConfig:
      008A8A 89               [ 2]  142 	pushw	x
                                    143 ;	lib/stm8s_spi.c: 65: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
      008A8B 7B 05            [ 1]  144 	ld	a, (0x05, sp)
      008A8D A4 0F            [ 1]  145 	and	a, #0x0f
      008A8F 97               [ 1]  146 	ld	xl, a
      008A90 A6 01            [ 1]  147 	ld	a, #0x01
      008A92 88               [ 1]  148 	push	a
      008A93 9F               [ 1]  149 	ld	a, xl
      008A94 4D               [ 1]  150 	tnz	a
      008A95 27 05            [ 1]  151 	jreq	00111$
      008A97                        152 00110$:
      008A97 08 01            [ 1]  153 	sll	(1, sp)
      008A99 4A               [ 1]  154 	dec	a
      008A9A 26 FB            [ 1]  155 	jrne	00110$
      008A9C                        156 00111$:
      008A9C 84               [ 1]  157 	pop	a
      008A9D 6B 01            [ 1]  158 	ld	(0x01, sp), a
                                    159 ;	lib/stm8s_spi.c: 67: if (NewState != DISABLE)
      008A9F 0D 06            [ 1]  160 	tnz	(0x06, sp)
      008AA1 27 0C            [ 1]  161 	jreq	00102$
                                    162 ;	lib/stm8s_spi.c: 69: SPI->ICR |= itpos; /* Enable interrupt*/
      008AA3 AE 52 02         [ 2]  163 	ldw	x, #0x5202
      008AA6 F6               [ 1]  164 	ld	a, (x)
      008AA7 1A 01            [ 1]  165 	or	a, (0x01, sp)
      008AA9 AE 52 02         [ 2]  166 	ldw	x, #0x5202
      008AAC F7               [ 1]  167 	ld	(x), a
      008AAD 20 0F            [ 2]  168 	jra	00104$
      008AAF                        169 00102$:
                                    170 ;	lib/stm8s_spi.c: 73: SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
      008AAF AE 52 02         [ 2]  171 	ldw	x, #0x5202
      008AB2 F6               [ 1]  172 	ld	a, (x)
      008AB3 6B 02            [ 1]  173 	ld	(0x02, sp), a
      008AB5 7B 01            [ 1]  174 	ld	a, (0x01, sp)
      008AB7 43               [ 1]  175 	cpl	a
      008AB8 14 02            [ 1]  176 	and	a, (0x02, sp)
      008ABA AE 52 02         [ 2]  177 	ldw	x, #0x5202
      008ABD F7               [ 1]  178 	ld	(x), a
      008ABE                        179 00104$:
      008ABE 85               [ 2]  180 	popw	x
      008ABF 81               [ 4]  181 	ret
                                    182 ;	lib/stm8s_spi.c: 77: void SPI_SendData(uint8_t Data)
                                    183 ;	-----------------------------------------
                                    184 ;	 function SPI_SendData
                                    185 ;	-----------------------------------------
      008AC0                        186 _SPI_SendData:
                                    187 ;	lib/stm8s_spi.c: 79: SPI->DR = Data; 
      008AC0 AE 52 04         [ 2]  188 	ldw	x, #0x5204
      008AC3 7B 03            [ 1]  189 	ld	a, (0x03, sp)
      008AC5 F7               [ 1]  190 	ld	(x), a
      008AC6 81               [ 4]  191 	ret
                                    192 ;	lib/stm8s_spi.c: 82: uint8_t SPI_ReceiveData(void)
                                    193 ;	-----------------------------------------
                                    194 ;	 function SPI_ReceiveData
                                    195 ;	-----------------------------------------
      008AC7                        196 _SPI_ReceiveData:
                                    197 ;	lib/stm8s_spi.c: 84: return ((uint8_t)SPI->DR); 
      008AC7 AE 52 04         [ 2]  198 	ldw	x, #0x5204
      008ACA F6               [ 1]  199 	ld	a, (x)
      008ACB 81               [ 4]  200 	ret
                                    201 ;	lib/stm8s_spi.c: 87: void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
                                    202 ;	-----------------------------------------
                                    203 ;	 function SPI_NSSInternalSoftwareCmd
                                    204 ;	-----------------------------------------
      008ACC                        205 _SPI_NSSInternalSoftwareCmd:
                                    206 ;	lib/stm8s_spi.c: 89: if (NewState != DISABLE)
      008ACC 0D 03            [ 1]  207 	tnz	(0x03, sp)
      008ACE 27 05            [ 1]  208 	jreq	00102$
                                    209 ;	lib/stm8s_spi.c: 91: SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
      008AD0 72 10 52 01      [ 1]  210 	bset	0x5201, #0
      008AD4 81               [ 4]  211 	ret
      008AD5                        212 00102$:
                                    213 ;	lib/stm8s_spi.c: 95: SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
      008AD5 72 11 52 01      [ 1]  214 	bres	0x5201, #0
      008AD9 81               [ 4]  215 	ret
                                    216 ;	lib/stm8s_spi.c: 99: void SPI_TransmitCRC(void)
                                    217 ;	-----------------------------------------
                                    218 ;	 function SPI_TransmitCRC
                                    219 ;	-----------------------------------------
      008ADA                        220 _SPI_TransmitCRC:
                                    221 ;	lib/stm8s_spi.c: 101: SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
      008ADA AE 52 01         [ 2]  222 	ldw	x, #0x5201
      008ADD F6               [ 1]  223 	ld	a, (x)
      008ADE AA 10            [ 1]  224 	or	a, #0x10
      008AE0 F7               [ 1]  225 	ld	(x), a
      008AE1 81               [ 4]  226 	ret
                                    227 ;	lib/stm8s_spi.c: 104: void SPI_CalculateCRCCmd(FunctionalState NewState)
                                    228 ;	-----------------------------------------
                                    229 ;	 function SPI_CalculateCRCCmd
                                    230 ;	-----------------------------------------
      008AE2                        231 _SPI_CalculateCRCCmd:
                                    232 ;	lib/stm8s_spi.c: 107: if (NewState != DISABLE)
      008AE2 0D 03            [ 1]  233 	tnz	(0x03, sp)
      008AE4 27 08            [ 1]  234 	jreq	00102$
                                    235 ;	lib/stm8s_spi.c: 109: SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
      008AE6 AE 52 01         [ 2]  236 	ldw	x, #0x5201
      008AE9 F6               [ 1]  237 	ld	a, (x)
      008AEA AA 20            [ 1]  238 	or	a, #0x20
      008AEC F7               [ 1]  239 	ld	(x), a
      008AED 81               [ 4]  240 	ret
      008AEE                        241 00102$:
                                    242 ;	lib/stm8s_spi.c: 113: SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
      008AEE AE 52 01         [ 2]  243 	ldw	x, #0x5201
      008AF1 F6               [ 1]  244 	ld	a, (x)
      008AF2 A4 DF            [ 1]  245 	and	a, #0xdf
      008AF4 F7               [ 1]  246 	ld	(x), a
      008AF5 81               [ 4]  247 	ret
                                    248 ;	lib/stm8s_spi.c: 117: uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
                                    249 ;	-----------------------------------------
                                    250 ;	 function SPI_GetCRC
                                    251 ;	-----------------------------------------
      008AF6                        252 _SPI_GetCRC:
                                    253 ;	lib/stm8s_spi.c: 122: if (SPI_CRC != SPI_CRC_RX)
      008AF6 0D 03            [ 1]  254 	tnz	(0x03, sp)
      008AF8 27 05            [ 1]  255 	jreq	00102$
                                    256 ;	lib/stm8s_spi.c: 124: crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
      008AFA AE 52 07         [ 2]  257 	ldw	x, #0x5207
      008AFD F6               [ 1]  258 	ld	a, (x)
      008AFE 81               [ 4]  259 	ret
      008AFF                        260 00102$:
                                    261 ;	lib/stm8s_spi.c: 128: crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
      008AFF AE 52 06         [ 2]  262 	ldw	x, #0x5206
      008B02 F6               [ 1]  263 	ld	a, (x)
                                    264 ;	lib/stm8s_spi.c: 132: return crcreg;
      008B03 81               [ 4]  265 	ret
                                    266 ;	lib/stm8s_spi.c: 135: void SPI_ResetCRC(void)
                                    267 ;	-----------------------------------------
                                    268 ;	 function SPI_ResetCRC
                                    269 ;	-----------------------------------------
      008B04                        270 _SPI_ResetCRC:
                                    271 ;	lib/stm8s_spi.c: 139: SPI_CalculateCRCCmd(ENABLE);
      008B04 4B 01            [ 1]  272 	push	#0x01
      008B06 CD 8A E2         [ 4]  273 	call	_SPI_CalculateCRCCmd
      008B09 84               [ 1]  274 	pop	a
                                    275 ;	lib/stm8s_spi.c: 142: SPI_Cmd(ENABLE);
      008B0A 4B 01            [ 1]  276 	push	#0x01
      008B0C CD 8A 76         [ 4]  277 	call	_SPI_Cmd
      008B0F 84               [ 1]  278 	pop	a
      008B10 81               [ 4]  279 	ret
                                    280 ;	lib/stm8s_spi.c: 150: uint8_t SPI_GetCRCPolynomial(void)
                                    281 ;	-----------------------------------------
                                    282 ;	 function SPI_GetCRCPolynomial
                                    283 ;	-----------------------------------------
      008B11                        284 _SPI_GetCRCPolynomial:
                                    285 ;	lib/stm8s_spi.c: 152: return SPI->CRCPR; /* Return the CRC polynomial register */
      008B11 AE 52 05         [ 2]  286 	ldw	x, #0x5205
      008B14 F6               [ 1]  287 	ld	a, (x)
      008B15 81               [ 4]  288 	ret
                                    289 ;	lib/stm8s_spi.c: 160: void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
                                    290 ;	-----------------------------------------
                                    291 ;	 function SPI_BiDirectionalLineConfig
                                    292 ;	-----------------------------------------
      008B16                        293 _SPI_BiDirectionalLineConfig:
                                    294 ;	lib/stm8s_spi.c: 163: if (SPI_Direction != SPI_DIRECTION_RX)
      008B16 0D 03            [ 1]  295 	tnz	(0x03, sp)
      008B18 27 08            [ 1]  296 	jreq	00102$
                                    297 ;	lib/stm8s_spi.c: 165: SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
      008B1A AE 52 01         [ 2]  298 	ldw	x, #0x5201
      008B1D F6               [ 1]  299 	ld	a, (x)
      008B1E AA 40            [ 1]  300 	or	a, #0x40
      008B20 F7               [ 1]  301 	ld	(x), a
      008B21 81               [ 4]  302 	ret
      008B22                        303 00102$:
                                    304 ;	lib/stm8s_spi.c: 169: SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
      008B22 AE 52 01         [ 2]  305 	ldw	x, #0x5201
      008B25 F6               [ 1]  306 	ld	a, (x)
      008B26 A4 BF            [ 1]  307 	and	a, #0xbf
      008B28 F7               [ 1]  308 	ld	(x), a
      008B29 81               [ 4]  309 	ret
                                    310 ;	lib/stm8s_spi.c: 174: FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
                                    311 ;	-----------------------------------------
                                    312 ;	 function SPI_GetFlagStatus
                                    313 ;	-----------------------------------------
      008B2A                        314 _SPI_GetFlagStatus:
                                    315 ;	lib/stm8s_spi.c: 178: if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
      008B2A AE 52 03         [ 2]  316 	ldw	x, #0x5203
      008B2D F6               [ 1]  317 	ld	a, (x)
      008B2E 14 03            [ 1]  318 	and	a, (0x03, sp)
      008B30 4D               [ 1]  319 	tnz	a
      008B31 27 03            [ 1]  320 	jreq	00102$
                                    321 ;	lib/stm8s_spi.c: 180: status = SET; /* SPI_FLAG is set */
      008B33 A6 01            [ 1]  322 	ld	a, #0x01
      008B35 81               [ 4]  323 	ret
      008B36                        324 00102$:
                                    325 ;	lib/stm8s_spi.c: 184: status = RESET; /* SPI_FLAG is reset*/
      008B36 4F               [ 1]  326 	clr	a
                                    327 ;	lib/stm8s_spi.c: 188: return status;
      008B37 81               [ 4]  328 	ret
                                    329 ;	lib/stm8s_spi.c: 191: void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
                                    330 ;	-----------------------------------------
                                    331 ;	 function SPI_ClearFlag
                                    332 ;	-----------------------------------------
      008B38                        333 _SPI_ClearFlag:
                                    334 ;	lib/stm8s_spi.c: 193: SPI->SR = (uint8_t)(~SPI_FLAG);
      008B38 7B 03            [ 1]  335 	ld	a, (0x03, sp)
      008B3A 43               [ 1]  336 	cpl	a
      008B3B AE 52 03         [ 2]  337 	ldw	x, #0x5203
      008B3E F7               [ 1]  338 	ld	(x), a
      008B3F 81               [ 4]  339 	ret
                                    340 ;	lib/stm8s_spi.c: 196: ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
                                    341 ;	-----------------------------------------
                                    342 ;	 function SPI_GetITStatus
                                    343 ;	-----------------------------------------
      008B40                        344 _SPI_GetITStatus:
      008B40 52 03            [ 2]  345 	sub	sp, #3
                                    346 ;	lib/stm8s_spi.c: 204: itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
      008B42 7B 06            [ 1]  347 	ld	a, (0x06, sp)
      008B44 A4 0F            [ 1]  348 	and	a, #0x0f
      008B46 97               [ 1]  349 	ld	xl, a
      008B47 A6 01            [ 1]  350 	ld	a, #0x01
      008B49 88               [ 1]  351 	push	a
      008B4A 9F               [ 1]  352 	ld	a, xl
      008B4B 4D               [ 1]  353 	tnz	a
      008B4C 27 05            [ 1]  354 	jreq	00116$
      008B4E                        355 00115$:
      008B4E 08 01            [ 1]  356 	sll	(1, sp)
      008B50 4A               [ 1]  357 	dec	a
      008B51 26 FB            [ 1]  358 	jrne	00115$
      008B53                        359 00116$:
      008B53 84               [ 1]  360 	pop	a
      008B54 6B 03            [ 1]  361 	ld	(0x03, sp), a
                                    362 ;	lib/stm8s_spi.c: 207: itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
      008B56 7B 06            [ 1]  363 	ld	a, (0x06, sp)
      008B58 4E               [ 1]  364 	swap	a
      008B59 A4 0F            [ 1]  365 	and	a, #0x0f
      008B5B 97               [ 1]  366 	ld	xl, a
                                    367 ;	lib/stm8s_spi.c: 209: itmask2 = (uint8_t)((uint8_t)1 << itmask1);
      008B5C A6 01            [ 1]  368 	ld	a, #0x01
      008B5E 88               [ 1]  369 	push	a
      008B5F 9F               [ 1]  370 	ld	a, xl
      008B60 4D               [ 1]  371 	tnz	a
      008B61 27 05            [ 1]  372 	jreq	00118$
      008B63                        373 00117$:
      008B63 08 01            [ 1]  374 	sll	(1, sp)
      008B65 4A               [ 1]  375 	dec	a
      008B66 26 FB            [ 1]  376 	jrne	00117$
      008B68                        377 00118$:
      008B68 84               [ 1]  378 	pop	a
      008B69 6B 02            [ 1]  379 	ld	(0x02, sp), a
                                    380 ;	lib/stm8s_spi.c: 211: enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
      008B6B AE 52 03         [ 2]  381 	ldw	x, #0x5203
      008B6E F6               [ 1]  382 	ld	a, (x)
      008B6F 14 02            [ 1]  383 	and	a, (0x02, sp)
      008B71 6B 01            [ 1]  384 	ld	(0x01, sp), a
                                    385 ;	lib/stm8s_spi.c: 213: if (((SPI->ICR & itpos) != RESET) && enablestatus)
      008B73 AE 52 02         [ 2]  386 	ldw	x, #0x5202
      008B76 F6               [ 1]  387 	ld	a, (x)
      008B77 14 03            [ 1]  388 	and	a, (0x03, sp)
      008B79 4D               [ 1]  389 	tnz	a
      008B7A 27 07            [ 1]  390 	jreq	00102$
      008B7C 0D 01            [ 1]  391 	tnz	(0x01, sp)
      008B7E 27 03            [ 1]  392 	jreq	00102$
                                    393 ;	lib/stm8s_spi.c: 216: pendingbitstatus = SET;
      008B80 A6 01            [ 1]  394 	ld	a, #0x01
                                    395 ;	lib/stm8s_spi.c: 221: pendingbitstatus = RESET;
      008B82 21                     396 	.byte 0x21
      008B83                        397 00102$:
      008B83 4F               [ 1]  398 	clr	a
      008B84                        399 00103$:
                                    400 ;	lib/stm8s_spi.c: 224: return  pendingbitstatus;
      008B84 5B 03            [ 2]  401 	addw	sp, #3
      008B86 81               [ 4]  402 	ret
                                    403 ;	lib/stm8s_spi.c: 227: void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
                                    404 ;	-----------------------------------------
                                    405 ;	 function SPI_ClearITPendingBit
                                    406 ;	-----------------------------------------
      008B87                        407 _SPI_ClearITPendingBit:
                                    408 ;	lib/stm8s_spi.c: 234: itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
      008B87 7B 03            [ 1]  409 	ld	a, (0x03, sp)
      008B89 A4 F0            [ 1]  410 	and	a, #0xf0
      008B8B 4E               [ 1]  411 	swap	a
      008B8C A4 0F            [ 1]  412 	and	a, #0x0f
      008B8E 97               [ 1]  413 	ld	xl, a
      008B8F A6 01            [ 1]  414 	ld	a, #0x01
      008B91 88               [ 1]  415 	push	a
      008B92 9F               [ 1]  416 	ld	a, xl
      008B93 4D               [ 1]  417 	tnz	a
      008B94 27 05            [ 1]  418 	jreq	00104$
      008B96                        419 00103$:
      008B96 08 01            [ 1]  420 	sll	(1, sp)
      008B98 4A               [ 1]  421 	dec	a
      008B99 26 FB            [ 1]  422 	jrne	00103$
      008B9B                        423 00104$:
      008B9B 84               [ 1]  424 	pop	a
                                    425 ;	lib/stm8s_spi.c: 236: SPI->SR = (uint8_t)(~itpos);
      008B9C 43               [ 1]  426 	cpl	a
      008B9D AE 52 03         [ 2]  427 	ldw	x, #0x5203
      008BA0 F7               [ 1]  428 	ld	(x), a
      008BA1 81               [ 4]  429 	ret
                                    430 	.area CODE
                                    431 	.area INITIALIZER
                                    432 	.area CABS (ABS)
