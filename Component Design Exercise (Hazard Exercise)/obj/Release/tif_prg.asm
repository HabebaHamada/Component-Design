;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:40 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"tif_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_DIO_u8ReadChannel
	extern	_DIO_vidWriteChannel
	extern	_DIO_vidWritePort
	extern	_SSD_vidInit
	extern	_SSD_vidTask
	extern	_SSD_SetDisplayedNumber

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
	global	_TIF_vidSetMode
	global	_TIF_vidTask
	global	_TIF_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_tif_prg_0	udata
r0x1005	res	1
r0x1004	res	1
_enuTiMode	res	1
_enuTiOldMode	res	1
_u8TifCounter	res	1
_enuTifBlinkState	res	1
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
code_tif_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidBlinkMode	;Function start
; 2 exit points
;has an exit
;functions called:
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;2 compiler assigned registers:
;   r0x1004
;   STK00
;; Starting pCode block
_vidBlinkMode	;Function start
; 2 exit points
;	.line	162; "tif_prg.c"	static void vidBlinkMode(TIF_enuMode enuBlinkMode)
	BANKSEL	r0x1004
	MOVWF	r0x1004
;	.line	164; "tif_prg.c"	u8TifCounter++;
	BANKSEL	_u8TifCounter
	INCF	_u8TifCounter,F
;	.line	166; "tif_prg.c"	if(enuTifBlinkState == BLINK_OFF)
	BANKSEL	_enuTifBlinkState
	MOVF	_enuTifBlinkState,W
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;;unsigned compare: left < lit(0x1E=30), size=1
;	.line	168; "tif_prg.c"	if(u8TifCounter >= TIF_u8BLINK_OFF_THRESHOLD)
	MOVLW	0x1e
	BANKSEL	_u8TifCounter
	SUBWF	_u8TifCounter,W
	BTFSS	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	170; "tif_prg.c"	if(enuBlinkMode == TIF_RIGHT_BLINK_MODE)
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00149_DS_
;	.line	172; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	173; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, TIF_u8BLINK_SIGNAL);
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
	GOTO	_00150_DS_
_00149_DS_
;	.line	177; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, TIF_u8BLINK_SIGNAL);
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	178; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
_00150_DS_
;	.line	180; "tif_prg.c"	enuTifBlinkState = BLINK_ON;
	MOVLW	0x01
	BANKSEL	_enuTifBlinkState
	MOVWF	_enuTifBlinkState
;	.line	181; "tif_prg.c"	u8TifCounter     = BTY_u8ZERO;
	BANKSEL	_u8TifCounter
	CLRF	_u8TifCounter
	GOTO	_00158_DS_
;;unsigned compare: left < lit(0x1E=30), size=1
_00156_DS_
;	.line	190; "tif_prg.c"	if(u8TifCounter >= TIF_u8BLINK_OFF_THRESHOLD)
	MOVLW	0x1e
	BANKSEL	_u8TifCounter
	SUBWF	_u8TifCounter,W
	BTFSS	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	192; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	193; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	194; "tif_prg.c"	enuTifBlinkState = BLINK_OFF;
	BANKSEL	_enuTifBlinkState
	CLRF	_enuTifBlinkState
;	.line	195; "tif_prg.c"	u8TifCounter     = BTY_u8ZERO;
	BANKSEL	_u8TifCounter
	CLRF	_u8TifCounter
_00158_DS_
	RETURN	
; exit point of _vidBlinkMode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _TIF_vidSetMode	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1005
;; Starting pCode block
_TIF_vidSetMode	;Function start
; 2 exit points
;	.line	137; "tif_prg.c"	void TIF_vidSetMode(TIF_enuMode enuTifSetMode)
	BANKSEL	r0x1005
	MOVWF	r0x1005
;;unsigned compare: left < lit(0x3=3), size=1
;	.line	139; "tif_prg.c"	if((enuTifSetMode < TIF_UNDEFINED_MODE) &&
	MOVLW	0x03
	SUBWF	r0x1005,W
	BTFSC	STATUS,0
	GOTO	_00134_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	140; "tif_prg.c"	(enuTifSetMode != enuTiMode))
	BANKSEL	_enuTiMode
	MOVF	_enuTiMode,W
;	.line	142; "tif_prg.c"	enuTiOldMode = enuTiMode;
	BANKSEL	r0x1005
	XORWF	r0x1005,W
	BTFSC	STATUS,2
	GOTO	_00134_DS_
	BANKSEL	_enuTiMode
	MOVF	_enuTiMode,W
	BANKSEL	_enuTiOldMode
	MOVWF	_enuTiOldMode
;	.line	143; "tif_prg.c"	u8TifCounter = BTY_u8ZERO;
	BANKSEL	_u8TifCounter
	CLRF	_u8TifCounter
;	.line	144; "tif_prg.c"	enuTifBlinkState = BLINK_OFF;
	BANKSEL	_enuTifBlinkState
	CLRF	_enuTifBlinkState
;	.line	145; "tif_prg.c"	enuTiMode    = enuTifSetMode;
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	BANKSEL	_enuTiMode
	MOVWF	_enuTiMode
_00134_DS_
	RETURN	
; exit point of _TIF_vidSetMode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _TIF_vidTask	;Function start
; 2 exit points
;has an exit
;functions called:
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _vidBlinkMode
;   _vidBlinkMode
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _vidBlinkMode
;   _vidBlinkMode
;1 compiler assigned register :
;   STK00
;; Starting pCode block
_TIF_vidTask	;Function start
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3=3), size=1
;	.line	102; "tif_prg.c"	switch(enuTiMode)
	MOVLW	0x03
	BANKSEL	_enuTiMode
	SUBWF	_enuTiMode,W
	BTFSC	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	MOVLW	HIGH(_00125_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00125_DS_
	BANKSEL	_enuTiMode
	ADDWF	_enuTiMode,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00125_DS_
	GOTO	_00109_DS_
	GOTO	_00112_DS_
	GOTO	_00113_DS_
_00109_DS_
;	.line	107; "tif_prg.c"	if(enuTiMode != enuTiOldMode)
	BANKSEL	_enuTiOldMode
	MOVF	_enuTiOldMode,W
;	.line	109; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
	BANKSEL	_enuTiMode
	XORWF	_enuTiMode,W
	BTFSC	STATUS,2
	GOTO	_00116_DS_
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	110; "tif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	111; "tif_prg.c"	enuTiOldMode = enuTiMode;
	BANKSEL	_enuTiMode
	MOVF	_enuTiMode,W
	BANKSEL	_enuTiOldMode
	MOVWF	_enuTiOldMode
;	.line	117; "tif_prg.c"	break;
	GOTO	_00116_DS_
_00112_DS_
;	.line	120; "tif_prg.c"	vidBlinkMode(TIF_RIGHT_BLINK_MODE);
	MOVLW	0x01
	CALL	_vidBlinkMode
;	.line	121; "tif_prg.c"	break;
	GOTO	_00116_DS_
_00113_DS_
;	.line	124; "tif_prg.c"	vidBlinkMode(TIF_LEFT_BLINK_MODE);
	MOVLW	0x02
	CALL	_vidBlinkMode
_00116_DS_
;	.line	129; "tif_prg.c"	}
	RETURN	
; exit point of _TIF_vidTask

;***
;  pBlock Stats: dbName = C
;***
;entry:  _TIF_vidInit	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_TIF_vidInit	;Function start
; 2 exit points
;	.line	89; "tif_prg.c"	enuTiMode        = TIF_OFF_MODE;
	BANKSEL	_enuTiMode
	CLRF	_enuTiMode
;	.line	90; "tif_prg.c"	enuTiOldMode     = TIF_OFF_MODE;
	BANKSEL	_enuTiOldMode
	CLRF	_enuTiOldMode
;	.line	91; "tif_prg.c"	u8TifCounter     = BTY_u8ZERO;
	BANKSEL	_u8TifCounter
	CLRF	_u8TifCounter
;	.line	92; "tif_prg.c"	enuTifBlinkState = BLINK_OFF;
	BANKSEL	_enuTifBlinkState
	CLRF	_enuTifBlinkState
	RETURN	
; exit point of _TIF_vidInit


;	code size estimation:
;	  106+   47 =   153 instructions (  400 byte)

	end
