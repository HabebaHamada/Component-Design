;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Tue Sep 20 01:34:59 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"dio_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_SSPCON2bits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_DIO_vidWritePort
	global	_DIO_vidWriteChannel
	global	_DIO_u8ReadChannel

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_dio_prg_0	udata
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1000	res	1
r0x1001	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_dio_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _DIO_vidWritePort	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;; Starting pCode block
_DIO_vidWritePort	;Function start
; 2 exit points
;	.line	243; "dio_prg.c"	void DIO_vidWritePort(
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	248; "dio_prg.c"	switch (enuPortId)
	MOVLW	0x05
	SUBWF	r0x1000,W
	BTFSC	STATUS,0
	GOTO	_00253_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	MOVLW	HIGH(_00259_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00259_DS_
	BANKSEL	r0x1000
	ADDWF	r0x1000,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00259_DS_
	GOTO	_00246_DS_
	GOTO	_00247_DS_
	GOTO	_00248_DS_
	GOTO	_00249_DS_
	GOTO	_00250_DS_
_00246_DS_
;	.line	250; "dio_prg.c"	case DIO_PORTA: PORTA = u8Value; break;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	_PORTA
	MOVWF	_PORTA
	GOTO	_00253_DS_
_00247_DS_
;	.line	251; "dio_prg.c"	case DIO_PORTB: PORTB = u8Value; break;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	_PORTB
	MOVWF	_PORTB
	GOTO	_00253_DS_
_00248_DS_
;	.line	252; "dio_prg.c"	case DIO_PORTC: PORTC = u8Value; break;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
	GOTO	_00253_DS_
_00249_DS_
;	.line	253; "dio_prg.c"	case DIO_PORTD: PORTD = u8Value; break;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	_PORTD
	MOVWF	_PORTD
	GOTO	_00253_DS_
_00250_DS_
;	.line	254; "dio_prg.c"	case DIO_PORTE: PORTE = u8Value; break;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	_PORTE
	MOVWF	_PORTE
_00253_DS_
;	.line	256; "dio_prg.c"	}
	RETURN	
; exit point of _DIO_vidWritePort

;***
;  pBlock Stats: dbName = C
;***
;entry:  _DIO_vidWriteChannel	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   r0x1004
;   r0x1005
;; Starting pCode block
_DIO_vidWriteChannel	;Function start
; 2 exit points
;	.line	144; "dio_prg.c"	void DIO_vidWriteChannel(
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	STK00,W
	MOVWF	r0x1003
;;unsigned compare: left < lit(0x21=33), size=1
;	.line	153; "dio_prg.c"	if(enuChannelId < DIO_CHANNEL_NUMBER)
	MOVLW	0x21
	SUBWF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00185_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;;unsigned compare: left < lit(0x6=6), size=1
;	.line	156; "dio_prg.c"	if(enuChannelId < DIO_PORTB_CHANNEL_0)
	MOVLW	0x06
	SUBWF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00181_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	159; "dio_prg.c"	if (enuLevel == DIO_LEVEL_LOW)
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00157_DS_
;	.line	161; "dio_prg.c"	PORTA = PORTA & ~(1 << u8PinNumber);
	MOVLW	0x01
	MOVWF	r0x1004
	MOVF	r0x1002,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00220_DS_
_00219_DS_
	BANKSEL	r0x1004
	RLF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00219_DS_
_00220_DS_
	BANKSEL	r0x1004
	COMF	r0x1004,F
	BANKSEL	_PORTA
	ANDWF	_PORTA,F
	GOTO	_00185_DS_
_00157_DS_
;	.line	165; "dio_prg.c"	PORTA = PORTA | (1 << u8PinNumber);
	MOVLW	0x01
	BANKSEL	r0x1004
	MOVWF	r0x1004
	MOVF	r0x1002,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00222_DS_
_00221_DS_
	BANKSEL	r0x1004
	RLF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00221_DS_
_00222_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	BANKSEL	_PORTA
	IORWF	_PORTA,F
	GOTO	_00185_DS_
;;unsigned compare: left < lit(0xE=14), size=1
_00181_DS_
;	.line	170; "dio_prg.c"	else if (enuChannelId < DIO_PORTC_CHANNEL_0 )
	MOVLW	0x0e
	BANKSEL	r0x1002
	SUBWF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00178_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	172; "dio_prg.c"	u8PinNumber = enuChannelId - 6 /* Number of PortA channels */;
	MOVLW	0xfa
	ADDWF	r0x1002,W
	MOVWF	r0x1004
;	.line	173; "dio_prg.c"	if (enuLevel == DIO_LEVEL_LOW)
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00160_DS_
;	.line	175; "dio_prg.c"	PORTB = PORTB & ~(1 << u8PinNumber);
	MOVLW	0x01
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00225_DS_
_00224_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00224_DS_
_00225_DS_
	BANKSEL	r0x1005
	COMF	r0x1005,F
	BANKSEL	_PORTB
	ANDWF	_PORTB,F
	GOTO	_00185_DS_
_00160_DS_
;	.line	179; "dio_prg.c"	PORTB = PORTB | (1 << u8PinNumber);
	MOVLW	0x01
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00227_DS_
_00226_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00226_DS_
_00227_DS_
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	BANKSEL	_PORTB
	IORWF	_PORTB,F
	GOTO	_00185_DS_
;;unsigned compare: left < lit(0x16=22), size=1
_00178_DS_
;	.line	184; "dio_prg.c"	else if (enuChannelId < DIO_PORTD_CHANNEL_0 )
	MOVLW	0x16
	BANKSEL	r0x1002
	SUBWF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00175_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	186; "dio_prg.c"	u8PinNumber = enuChannelId - 14 /* Number of Port A&B channels */;
	MOVLW	0xf2
	ADDWF	r0x1002,W
	MOVWF	r0x1004
;	.line	187; "dio_prg.c"	if (enuLevel == DIO_LEVEL_LOW)
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00163_DS_
;	.line	189; "dio_prg.c"	PORTC = PORTC & ~(1 << u8PinNumber);
	MOVLW	0x01
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00230_DS_
_00229_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00229_DS_
_00230_DS_
	BANKSEL	r0x1005
	COMF	r0x1005,F
	BANKSEL	_PORTC
	ANDWF	_PORTC,F
	GOTO	_00185_DS_
_00163_DS_
;	.line	193; "dio_prg.c"	PORTC = PORTC | (1 << u8PinNumber);
	MOVLW	0x01
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00232_DS_
_00231_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00231_DS_
_00232_DS_
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	BANKSEL	_PORTC
	IORWF	_PORTC,F
	GOTO	_00185_DS_
;;unsigned compare: left < lit(0x1E=30), size=1
_00175_DS_
;	.line	198; "dio_prg.c"	else if (enuChannelId < DIO_PORTE_CHANNEL_0 )
	MOVLW	0x1e
	BANKSEL	r0x1002
	SUBWF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00172_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	200; "dio_prg.c"	u8PinNumber = enuChannelId - 22;
	MOVLW	0xea
	ADDWF	r0x1002,W
	MOVWF	r0x1004
;	.line	201; "dio_prg.c"	if (enuLevel == DIO_LEVEL_LOW)
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00166_DS_
;	.line	203; "dio_prg.c"	PORTD = PORTD & ~(1 << u8PinNumber);
	MOVLW	0x01
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00235_DS_
_00234_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00234_DS_
_00235_DS_
	BANKSEL	r0x1005
	COMF	r0x1005,F
	BANKSEL	_PORTD
	ANDWF	_PORTD,F
	GOTO	_00185_DS_
_00166_DS_
;	.line	207; "dio_prg.c"	PORTD = PORTD | (1 << u8PinNumber);
	MOVLW	0x01
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00237_DS_
_00236_DS_
	BANKSEL	r0x1005
	RLF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00236_DS_
_00237_DS_
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	BANKSEL	_PORTD
	IORWF	_PORTD,F
	GOTO	_00185_DS_
_00172_DS_
;	.line	213; "dio_prg.c"	u8PinNumber = enuChannelId - 30;
	MOVLW	0xe2
	BANKSEL	r0x1002
	ADDWF	r0x1002,W
	MOVWF	r0x1004
;	.line	214; "dio_prg.c"	if (enuLevel == DIO_LEVEL_LOW)
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00169_DS_
;	.line	216; "dio_prg.c"	PORTE = PORTE & ~(1 << u8PinNumber);
	MOVLW	0x01
	MOVWF	r0x1002
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00239_DS_
_00238_DS_
	BANKSEL	r0x1002
	RLF	r0x1002,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00238_DS_
_00239_DS_
	BANKSEL	r0x1002
	COMF	r0x1002,F
	BANKSEL	_PORTE
	ANDWF	_PORTE,F
	GOTO	_00185_DS_
_00169_DS_
;	.line	220; "dio_prg.c"	PORTE = PORTE | (1 << u8PinNumber);
	MOVLW	0x01
	BANKSEL	r0x1002
	MOVWF	r0x1002
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00241_DS_
_00240_DS_
	BANKSEL	r0x1002
	RLF	r0x1002,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00240_DS_
_00241_DS_
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	BANKSEL	_PORTE
	IORWF	_PORTE,F
_00185_DS_
	RETURN	
; exit point of _DIO_vidWriteChannel

;***
;  pBlock Stats: dbName = C
;***
;entry:  _DIO_u8ReadChannel	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1006
;   r0x1007
;   r0x1008
;; Starting pCode block
_DIO_u8ReadChannel	;Function start
; 2 exit points
;	.line	72; "dio_prg.c"	uint8 DIO_u8ReadChannel(DIO_tenuChannelId enuChannelId)
	BANKSEL	r0x1006
	MOVWF	r0x1006
;;unsigned compare: left < lit(0x21=33), size=1
;	.line	83; "dio_prg.c"	if(enuChannelId < DIO_CHANNEL_NUMBER)
	MOVLW	0x21
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;;unsigned compare: left < lit(0x6=6), size=1
;	.line	86; "dio_prg.c"	if(enuChannelId < DIO_PORTB_CHANNEL_0)
	MOVLW	0x06
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00115_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	89; "dio_prg.c"	u8Return = PORTA >> u8PinNumber ;
	BANKSEL	_PORTA
	MOVF	_PORTA,W
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1006,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00140_DS_
_00139_DS_
	BANKSEL	r0x1007
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00139_DS_
_00140_DS_
	GOTO	_00116_DS_
;;unsigned compare: left < lit(0xE=14), size=1
_00115_DS_
;	.line	93; "dio_prg.c"	else if (enuChannelId < DIO_PORTC_CHANNEL_0 )
	MOVLW	0x0e
	BANKSEL	r0x1006
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00112_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	95; "dio_prg.c"	u8PinNumber = enuChannelId - 6 /* Number of PortA channels */;
	MOVLW	0xfa
	ADDWF	r0x1006,W
	MOVWF	r0x1008
;	.line	96; "dio_prg.c"	u8Return = PORTB >> u8PinNumber ;
	BANKSEL	_PORTB
	MOVF	_PORTB,W
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1008,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00143_DS_
_00142_DS_
	BANKSEL	r0x1007
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00142_DS_
_00143_DS_
	GOTO	_00116_DS_
;;unsigned compare: left < lit(0x16=22), size=1
_00112_DS_
;	.line	100; "dio_prg.c"	else if (enuChannelId < DIO_PORTD_CHANNEL_0 )
	MOVLW	0x16
	BANKSEL	r0x1006
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00109_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	102; "dio_prg.c"	u8PinNumber = enuChannelId - 14 /* Number of Port A&B channels */;
	MOVLW	0xf2
	ADDWF	r0x1006,W
	MOVWF	r0x1008
;	.line	103; "dio_prg.c"	u8Return = PORTC >> u8PinNumber ;
	BANKSEL	_PORTC
	MOVF	_PORTC,W
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1008,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00146_DS_
_00145_DS_
	BANKSEL	r0x1007
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00145_DS_
_00146_DS_
	GOTO	_00116_DS_
;;unsigned compare: left < lit(0x1E=30), size=1
_00109_DS_
;	.line	107; "dio_prg.c"	else if (enuChannelId < DIO_PORTE_CHANNEL_0 )
	MOVLW	0x1e
	BANKSEL	r0x1006
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	109; "dio_prg.c"	u8PinNumber = enuChannelId - 22;
	MOVLW	0xea
	ADDWF	r0x1006,W
	MOVWF	r0x1008
;	.line	110; "dio_prg.c"	u8Return = PORTD >> u8PinNumber ;
	BANKSEL	_PORTD
	MOVF	_PORTD,W
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1008,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00149_DS_
_00148_DS_
	BANKSEL	r0x1007
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00148_DS_
_00149_DS_
	GOTO	_00116_DS_
_00106_DS_
;	.line	115; "dio_prg.c"	u8PinNumber = enuChannelId - 30;
	MOVLW	0xe2
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	MOVWF	r0x1008
;	.line	116; "dio_prg.c"	u8Return = PORTE >> u8PinNumber ;
	BANKSEL	_PORTE
	MOVF	_PORTE,W
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1008,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00116_DS_
_00150_DS_
	BANKSEL	r0x1007
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00150_DS_
_00116_DS_
;	.line	119; "dio_prg.c"	u8Return &= 0x01;
	MOVLW	0x01
	BANKSEL	r0x1007
	ANDWF	r0x1007,F
	GOTO	_00119_DS_
_00118_DS_
;	.line	124; "dio_prg.c"	u8Return = BTY_u8ZERO;
	BANKSEL	r0x1007
	CLRF	r0x1007
_00119_DS_
;	.line	130; "dio_prg.c"	return(u8Return);
	BANKSEL	r0x1007
	MOVF	r0x1007,W
	RETURN	
; exit point of _DIO_u8ReadChannel


;	code size estimation:
;	  308+   77 =   385 instructions (  924 byte)

	end
