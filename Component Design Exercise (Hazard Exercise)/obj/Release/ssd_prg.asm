;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:40 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"ssd_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_DIO_u8ReadChannel
	extern	_DIO_vidWriteChannel
	extern	_DIO_vidWritePort
	extern	__gptrget1

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
	global	_SSD_SetDisplayedNumber
	global	_SSD_vidTask
	global	_SSD_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_ssd_prg_0	udata
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x1008	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
_enuCurrSegment	res	1
_au8SegmentNumber	res	2
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_ssd_prg_0	code
_ku8CharacterTable
	retlw 0xfc
	retlw 0x60
	retlw 0xda
	retlw 0xf2
	retlw 0x66
	retlw 0xb6
	retlw 0xbe
	retlw 0xe0
	retlw 0x7f
	retlw 0xf6
	retlw 0xee
	retlw 0xff
	retlw 0x9c
	retlw 0xfd
	retlw 0x9e
	retlw 0x8e
	retlw 0xc6
	retlw 0x3a
	retlw 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_ssd_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_SetDisplayedNumber	;Function start
; 2 exit points
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;7 compiler assigned registers:
;   r0x1003
;   STK00
;   r0x1004
;   r0x1005
;   r0x1006
;   STK01
;   r0x1007
;; Starting pCode block
_SSD_SetDisplayedNumber	;Function start
; 2 exit points
;	.line	134; "ssd_prg.c"	void SSD_SetDisplayedNumber(SSD_tenuSegmentId enuSegmentId, uint8 u8Number)
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVF	STK00,W
	MOVWF	r0x1004
;;unsigned compare: left < lit(0x2=2), size=1
;	.line	136; "ssd_prg.c"	if((enuSegmentId<SSD_SEGMENT_NUMBER) && (u8Number<u8SEG_TABLE_SIZE))
	MOVLW	0x02
	SUBWF	r0x1003,W
	BTFSC	STATUS,0
	GOTO	_00132_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;;unsigned compare: left < lit(0x13=19), size=1
	MOVLW	0x13
	SUBWF	r0x1004,W
	BTFSC	STATUS,0
	GOTO	_00132_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	138; "ssd_prg.c"	au8SegmentNumber[enuSegmentId] = ku8CharacterTable[u8Number];
	MOVF	r0x1003,W
	ADDLW	(_au8SegmentNumber + 0)
	MOVWF	r0x1003
	MOVLW	high (_au8SegmentNumber + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1005
	MOVF	r0x1004,W
	ADDLW	(_ku8CharacterTable + 0)
	MOVWF	r0x1004
	MOVLW	high (_ku8CharacterTable + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1006
	MOVF	r0x1004,W
	MOVWF	STK01
	MOVF	r0x1006,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	r0x1003,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1005
	BTFSC	r0x1005,0
	BSF	STATUS,7
	MOVF	r0x1007,W
	BANKSEL	INDF
	MOVWF	INDF
_00132_DS_
	RETURN	
; exit point of _SSD_SetDisplayedNumber

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_vidTask	;Function start
; 2 exit points
;has an exit
;functions called:
;   _DIO_vidWriteChannel
;   _DIO_vidWritePort
;   _DIO_vidWriteChannel
;   _DIO_vidWriteChannel
;   _DIO_vidWritePort
;   _DIO_vidWriteChannel
;   _DIO_vidWriteChannel
;   _DIO_vidWritePort
;   _DIO_vidWriteChannel
;   _DIO_vidWriteChannel
;   _DIO_vidWritePort
;   _DIO_vidWriteChannel
;2 compiler assigned registers:
;   r0x1008
;   STK00
;; Starting pCode block
_SSD_vidTask	;Function start
; 2 exit points
;	.line	101; "ssd_prg.c"	switch(enuCurrSegment)
	BANKSEL	_enuCurrSegment
	MOVF	_enuCurrSegment,W
	BANKSEL	r0x1008
	MOVWF	r0x1008
	BTFSC	STATUS,2
	GOTO	_00111_DS_
	BANKSEL	_enuCurrSegment
	MOVF	_enuCurrSegment,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00112_DS_
	GOTO	_00113_DS_
_00111_DS_
;	.line	105; "ssd_prg.c"	DIO_vidWriteChannel(SSD_u8SSEG2_EN_CHANNEL, DIO_LEVEL_LOW);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_DIO_vidWriteChannel
	CALL	_DIO_vidWriteChannel
	PAGESEL	$
;	.line	106; "ssd_prg.c"	u8DisplayValue  = au8SegmentNumber[SSD_SEGMENT_RIGHT];
	BANKSEL	_au8SegmentNumber
	MOVF	(_au8SegmentNumber + 0),W
;	.line	109; "ssd_prg.c"	DIO_vidWritePort(DIO_PORTD, u8DisplayValue);
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_DIO_vidWritePort
	CALL	_DIO_vidWritePort
	PAGESEL	$
;	.line	110; "ssd_prg.c"	DIO_vidWriteChannel(SSD_u8SSEG1_EN_CHANNEL, DIO_LEVEL_HIGH);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x0a
	PAGESEL	_DIO_vidWriteChannel
	CALL	_DIO_vidWriteChannel
	PAGESEL	$
;	.line	111; "ssd_prg.c"	enuCurrSegment = SSD_SEGMENT_LEFT;
	MOVLW	0x01
	BANKSEL	_enuCurrSegment
	MOVWF	_enuCurrSegment
;	.line	112; "ssd_prg.c"	break;
	GOTO	_00115_DS_
_00112_DS_
;	.line	116; "ssd_prg.c"	DIO_vidWriteChannel(SSD_u8SSEG1_EN_CHANNEL, DIO_LEVEL_LOW);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x0a
	PAGESEL	_DIO_vidWriteChannel
	CALL	_DIO_vidWriteChannel
	PAGESEL	$
;	.line	117; "ssd_prg.c"	u8DisplayValue  = au8SegmentNumber[SSD_SEGMENT_LEFT];
	BANKSEL	_au8SegmentNumber
	MOVF	(_au8SegmentNumber + 1),W
;	.line	120; "ssd_prg.c"	DIO_vidWritePort(DIO_PORTD, u8DisplayValue);
	BANKSEL	r0x1008
	MOVWF	r0x1008
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_DIO_vidWritePort
	CALL	_DIO_vidWritePort
	PAGESEL	$
;	.line	121; "ssd_prg.c"	DIO_vidWriteChannel(SSD_u8SSEG2_EN_CHANNEL, DIO_LEVEL_HIGH);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x0b
	PAGESEL	_DIO_vidWriteChannel
	CALL	_DIO_vidWriteChannel
	PAGESEL	$
;	.line	122; "ssd_prg.c"	enuCurrSegment = SSD_SEGMENT_RIGHT;
	BANKSEL	_enuCurrSegment
	CLRF	_enuCurrSegment
;	.line	123; "ssd_prg.c"	break;
	GOTO	_00115_DS_
_00113_DS_
;	.line	126; "ssd_prg.c"	enuCurrSegment = SSD_SEGMENT_RIGHT;
	BANKSEL	_enuCurrSegment
	CLRF	_enuCurrSegment
_00115_DS_
;	.line	128; "ssd_prg.c"	}
	RETURN	
; exit point of _SSD_vidTask

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_vidInit	;Function start
; 2 exit points
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;6 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;   STK01
;   STK00
;   r0x100C
;; Starting pCode block
_SSD_vidInit	;Function start
; 2 exit points
;	.line	85; "ssd_prg.c"	for(u8Index=0; u8Index<SSD_SEGMENT_NUMBER; u8Index++)
	BANKSEL	r0x1009
	CLRF	r0x1009
_00106_DS_
;	.line	87; "ssd_prg.c"	au8SegmentNumber[u8Index] = ku8CharacterTable[SSD_u8DISPLAY_INIT_ID];
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	ADDLW	(_au8SegmentNumber + 0)
	MOVWF	r0x100A
	MOVLW	high (_au8SegmentNumber + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x100B
	MOVLW	(_ku8CharacterTable + 18)
	MOVWF	STK01
	MOVLW	high (_ku8CharacterTable + 18)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	r0x100A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x100B
	BTFSC	r0x100B,0
	BSF	STATUS,7
	MOVF	r0x100C,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	85; "ssd_prg.c"	for(u8Index=0; u8Index<SSD_SEGMENT_NUMBER; u8Index++)
	BANKSEL	r0x1009
	INCF	r0x1009,F
;;unsigned compare: left < lit(0x2=2), size=1
	MOVLW	0x02
	SUBWF	r0x1009,W
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	90; "ssd_prg.c"	enuCurrSegment = SSD_SEGMENT_RIGHT;
	BANKSEL	_enuCurrSegment
	CLRF	_enuCurrSegment
	RETURN	
; exit point of _SSD_vidInit


;	code size estimation:
;	  111+   39 =   150 instructions (  378 byte)

	end
