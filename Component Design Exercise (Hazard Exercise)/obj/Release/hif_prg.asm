;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Tue Sep 20 01:35:01 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"hif_prg.c"
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
	global	_HIF_vidSetMode
	global	_HIF_vidTask
	global	_HIF_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_hif_prg_0	udata
r0x1004	res	1
_enuHifMode	res	1
_enuHifOldMode	res	1
_u8HifCounter	res	1
_enuHifBlinkState	res	1
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
code_hif_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidHazzardBlink	;Function start
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
;1 compiler assigned register :
;   STK00
;; Starting pCode block
_vidHazzardBlink	;Function start
; 2 exit points
;	.line	162; "hif_prg.c"	u8HifCounter++;
	BANKSEL	_u8HifCounter
	INCF	_u8HifCounter,F
;	.line	164; "hif_prg.c"	if(enuHifBlinkState == BLINK_OFF)
	BANKSEL	_enuHifBlinkState
	MOVF	_enuHifBlinkState,W
	BTFSS	STATUS,2
	GOTO	_00155_DS_
;;unsigned compare: left < lit(0x28=40), size=1
;	.line	166; "hif_prg.c"	if(u8HifCounter >= HIF_u8BLINK_OFF_THRESHOLD)
	MOVLW	0x28
	BANKSEL	_u8HifCounter
	SUBWF	_u8HifCounter,W
	BTFSS	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	168; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 0x08);
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	169; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 0x08);
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	170; "hif_prg.c"	enuHifBlinkState = BLINK_ON;
	MOVLW	0x01
	BANKSEL	_enuHifBlinkState
	MOVWF	_enuHifBlinkState
;	.line	171; "hif_prg.c"	u8HifCounter     = BTY_u8ZERO;
	BANKSEL	_u8HifCounter
	CLRF	_u8HifCounter
	GOTO	_00157_DS_
;;unsigned compare: left < lit(0x14=20), size=1
_00155_DS_
;	.line	179; "hif_prg.c"	if(u8HifCounter >= HIF_u8BLINK_ON_THRESHOLD)
	MOVLW	0x14
	BANKSEL	_u8HifCounter
	SUBWF	_u8HifCounter,W
	BTFSS	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	181; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	182; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	183; "hif_prg.c"	enuHifBlinkState = BLINK_OFF;
	BANKSEL	_enuHifBlinkState
	CLRF	_enuHifBlinkState
;	.line	184; "hif_prg.c"	u8HifCounter     = BTY_u8ZERO;
	BANKSEL	_u8HifCounter
	CLRF	_u8HifCounter
_00157_DS_
	RETURN	
; exit point of _vidHazzardBlink

;***
;  pBlock Stats: dbName = C
;***
;entry:  _HIF_vidSetMode	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
_HIF_vidSetMode	;Function start
; 2 exit points
;	.line	135; "hif_prg.c"	void HIF_vidSetMode(HIF_tenuMode enuHifSetMode)
	BANKSEL	r0x1004
	MOVWF	r0x1004
;;unsigned compare: left < lit(0x2=2), size=1
;	.line	137; "hif_prg.c"	if((enuHifSetMode < HIF_UNDEFINED_MODE) &&
	MOVLW	0x02
	SUBWF	r0x1004,W
	BTFSC	STATUS,0
	GOTO	_00136_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	138; "hif_prg.c"	(enuHifSetMode != enuHifMode))
	BANKSEL	_enuHifMode
	MOVF	_enuHifMode,W
;	.line	140; "hif_prg.c"	enuHifOldMode = enuHifMode;
	BANKSEL	r0x1004
	XORWF	r0x1004,W
	BTFSC	STATUS,2
	GOTO	_00136_DS_
	BANKSEL	_enuHifMode
	MOVF	_enuHifMode,W
	BANKSEL	_enuHifOldMode
	MOVWF	_enuHifOldMode
;	.line	141; "hif_prg.c"	u8HifCounter  = BTY_u8ZERO;
	BANKSEL	_u8HifCounter
	CLRF	_u8HifCounter
;	.line	142; "hif_prg.c"	enuHifBlinkState = BLINK_OFF;
	BANKSEL	_enuHifBlinkState
	CLRF	_enuHifBlinkState
;	.line	143; "hif_prg.c"	enuHifMode    = enuHifSetMode;
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	BANKSEL	_enuHifMode
	MOVWF	_enuHifMode
_00136_DS_
	RETURN	
; exit point of _HIF_vidSetMode

;***
;  pBlock Stats: dbName = C
;***
;entry:  _HIF_vidTask	;Function start
; 2 exit points
;has an exit
;functions called:
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _vidHazzardBlink
;   _SSD_SetDisplayedNumber
;   _SSD_SetDisplayedNumber
;   _vidHazzardBlink
;1 compiler assigned register :
;   STK00
;; Starting pCode block
_HIF_vidTask	;Function start
; 2 exit points
;	.line	106; "hif_prg.c"	switch(enuHifMode)
	BANKSEL	_enuHifMode
	MOVF	_enuHifMode,W
	BTFSC	STATUS,2
	GOTO	_00109_DS_
	MOVF	_enuHifMode,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00112_DS_
	GOTO	_00115_DS_
_00109_DS_
;	.line	109; "hif_prg.c"	if(enuHifMode != enuHifOldMode)
	BANKSEL	_enuHifOldMode
	MOVF	_enuHifOldMode,W
;	.line	111; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_LEFT, 18);
	BANKSEL	_enuHifMode
	XORWF	_enuHifMode,W
	BTFSC	STATUS,2
	GOTO	_00115_DS_
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	112; "hif_prg.c"	SSD_SetDisplayedNumber(SSD_SEGMENT_RIGHT, 18);
	MOVLW	0x12
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_SSD_SetDisplayedNumber
	CALL	_SSD_SetDisplayedNumber
	PAGESEL	$
;	.line	113; "hif_prg.c"	enuHifOldMode = enuHifMode;
	BANKSEL	_enuHifMode
	MOVF	_enuHifMode,W
	BANKSEL	_enuHifOldMode
	MOVWF	_enuHifOldMode
;	.line	119; "hif_prg.c"	break;
	GOTO	_00115_DS_
_00112_DS_
;	.line	122; "hif_prg.c"	vidHazzardBlink();
	CALL	_vidHazzardBlink
_00115_DS_
;	.line	127; "hif_prg.c"	}
	RETURN	
; exit point of _HIF_vidTask

;***
;  pBlock Stats: dbName = C
;***
;entry:  _HIF_vidInit	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_HIF_vidInit	;Function start
; 2 exit points
;	.line	93; "hif_prg.c"	enuHifMode       = HIF_OFF_MODE;
	BANKSEL	_enuHifMode
	CLRF	_enuHifMode
;	.line	94; "hif_prg.c"	enuHifOldMode    = HIF_OFF_MODE;
	BANKSEL	_enuHifOldMode
	CLRF	_enuHifOldMode
;	.line	95; "hif_prg.c"	u8HifCounter     = BTY_u8ZERO;
	BANKSEL	_u8HifCounter
	CLRF	_u8HifCounter
;	.line	96; "hif_prg.c"	enuHifBlinkState = BLINK_OFF;
	BANKSEL	_enuHifBlinkState
	CLRF	_enuHifBlinkState
	RETURN	
; exit point of _HIF_vidInit


;	code size estimation:
;	   81+   38 =   119 instructions (  314 byte)

	end
