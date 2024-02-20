;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:37 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"pbd_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_DIO_u8ReadChannel
	extern	_DIO_vidWriteChannel
	extern	_DIO_vidWritePort
	extern	_PBD_enuBtnChannelId
	extern	_PBD_enuBtnConfig
	extern	__mulchar
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
	global	_PBD_enuGetButtonState
	global	_PBD_vidTask
	global	_PBD_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_pbd_prg_0	udata
r0x1038	res	1
r0x1039	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x1037	res	1
r0x1033	res	1
r0x1034	res	1
r0x1035	res	1
r0x1036	res	1
r0x102F	res	1
r0x1030	res	1
r0x1031	res	1
r0x1032	res	1
r0x1028	res	1
r0x1029	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
_strBtnInfo	res	9
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
code_pbd_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidReleaseState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;7 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;   STK01
;   r0x100D
;; Starting pCode block
_vidReleaseState	;Function start
; 2 exit points
;	.line	341; "pbd_prg.c"	static void vidReleaseState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x1009
	MOVWF	r0x1009
;	.line	345; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x1009,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	CLRF	r0x100B
	MOVF	r0x100A,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1009
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x100C
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x100B,W
	ADDWF	r0x100C,F
	MOVF	r0x1009,W
	MOVWF	STK01
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;;1	MOVWF	r0x100D
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
	BANKSEL	r0x1009
	MOVWF	r0x1009
;	.line	347; "pbd_prg.c"	if(u8BtnValue == PBD_PUSH_LEVEL)
	MOVF	r0x1009,W
	BTFSS	STATUS,2
	GOTO	_00190_DS_
;	.line	349; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	MOVF	r0x100A,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x100A
	MOVF	r0x100B,W
	BTFSC	STATUS,0
	INCFSZ	r0x100B,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x100B
	MOVLW	0x01
	ADDWF	r0x100A,W
	MOVWF	r0x1009
	CLRF	r0x100C
	RLF	r0x100C,F
	MOVF	r0x100B,W
	ADDWF	r0x100C,F
	MOVF	r0x1009,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x100C
	BTFSC	r0x100C,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	350; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_PUSH;
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x100B
	BTFSC	r0x100B,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00190_DS_
	RETURN	
; exit point of _vidReleaseState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidPreReleaseState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;10 compiler assigned registers:
;   r0x100E
;   STK00
;   r0x100F
;   r0x1010
;   r0x1011
;   STK01
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;; Starting pCode block
_vidPreReleaseState	;Function start
; 2 exit points
;	.line	309; "pbd_prg.c"	static void vidPreReleaseState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x100E
	MOVWF	r0x100E
;	.line	313; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x100E,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x100F
	MOVWF	r0x100F
	CLRF	r0x1010
	MOVF	r0x100F,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x100E
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x1011
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1010,W
	ADDWF	r0x1011,F
	MOVF	r0x100E,W
	MOVWF	STK01
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1012
	MOVWF	r0x1012
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
;	.line	315; "pbd_prg.c"	if(u8BtnValue == PBD_RELEASE_LEVEL)
	BANKSEL	r0x100E
	MOVWF	r0x100E
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00181_DS_
;	.line	317; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr++;
	MOVF	r0x100F,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x100E
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x1011
	MOVF	r0x1010,W
	BTFSC	STATUS,0
	INCFSZ	r0x1010,W
	ADDWF	r0x1011,F
	MOVLW	0x01
	ADDWF	r0x100E,W
	MOVWF	r0x1012
	CLRF	r0x1013
	RLF	r0x1013,F
	MOVF	r0x1011,W
	ADDWF	r0x1013,F
	MOVF	r0x1012,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1013
	BTFSC	r0x1013,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1014
	MOVWF	r0x1014
	INCF	r0x1014,F
	MOVF	r0x1012,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1013
	BTFSC	r0x1013,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	320; "pbd_prg.c"	PBD_enuBtnConfig[enuBtnId].u8DebounceThreshold)
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1012
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x1013
	MOVF	r0x1010,W
	BTFSC	STATUS,0
	INCFSZ	r0x1010,W
	ADDWF	r0x1013,F
	INCF	r0x1012,F
	BTFSC	STATUS,2
	INCF	r0x1013,F
	MOVF	r0x1012,W
	MOVWF	STK01
	MOVF	r0x1013,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;;1	MOVWF	r0x1015
	BANKSEL	r0x1014
	XORWF	r0x1014,W
	BTFSS	STATUS,2
	GOTO	_00183_DS_
;	.line	322; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState = PBD_RELEASED;
	MOVF	r0x100E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1011
	BTFSC	r0x1011,0
	BSF	STATUS,7
	MOVLW	0x05
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00183_DS_
_00181_DS_
;	.line	331; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x100F
	MOVF	r0x1010,W
	BTFSC	STATUS,0
	INCFSZ	r0x1010,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x1010
	MOVLW	0x01
	ADDWF	r0x100F,W
	MOVWF	r0x100E
	CLRF	r0x1011
	RLF	r0x1011,F
	MOVF	r0x1010,W
	ADDWF	r0x1011,F
	MOVF	r0x100E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1011
	BTFSC	r0x1011,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	332; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_PUSH;
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1010
	BTFSC	r0x1010,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
_00183_DS_
	RETURN	
; exit point of _vidPreReleaseState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidHoldState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;7 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   r0x1018
;   r0x1019
;   STK01
;   r0x101A
;; Starting pCode block
_vidHoldState	;Function start
; 2 exit points
;	.line	287; "pbd_prg.c"	static void vidHoldState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x1016
	MOVWF	r0x1016
;	.line	291; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x1016,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1017
	MOVWF	r0x1017
	CLRF	r0x1018
	MOVF	r0x1017,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1016
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x1019
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1018,W
	ADDWF	r0x1019,F
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1019,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;;1	MOVWF	r0x101A
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
;	.line	293; "pbd_prg.c"	if(u8BtnValue == PBD_RELEASE_LEVEL)
	BANKSEL	r0x1016
	MOVWF	r0x1016
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00173_DS_
;	.line	295; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	MOVF	r0x1017,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1017
	MOVF	r0x1018,W
	BTFSC	STATUS,0
	INCFSZ	r0x1018,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x1018
	MOVLW	0x01
	ADDWF	r0x1017,W
	MOVWF	r0x1016
	CLRF	r0x1019
	RLF	r0x1019,F
	MOVF	r0x1018,W
	ADDWF	r0x1019,F
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	296; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
	BANKSEL	r0x1017
	MOVF	r0x1017,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1018
	BTFSC	r0x1018,0
	BSF	STATUS,7
	MOVLW	0x04
	BANKSEL	INDF
	MOVWF	INDF
_00173_DS_
	RETURN	
; exit point of _vidHoldState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidPreHoldState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;9 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;   r0x101D
;   r0x101E
;   STK01
;   r0x101F
;   r0x1020
;   r0x1021
;; Starting pCode block
_vidPreHoldState	;Function start
; 2 exit points
;	.line	256; "pbd_prg.c"	static void vidPreHoldState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x101B
	MOVWF	r0x101B
;	.line	260; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x101B,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x101C
	MOVWF	r0x101C
	CLRF	r0x101D
	MOVF	r0x101C,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x101B
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x101E
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x101D,W
	ADDWF	r0x101E,F
	MOVF	r0x101B,W
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
;	.line	262; "pbd_prg.c"	if(u8BtnValue == PBD_RELEASE_LEVEL)
	BANKSEL	r0x101B
	MOVWF	r0x101B
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00164_DS_
;	.line	264; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	MOVF	r0x101C,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x101B
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x101E
	MOVF	r0x101D,W
	BTFSC	STATUS,0
	INCFSZ	r0x101D,W
	ADDWF	r0x101E,F
	MOVLW	0x01
	ADDWF	r0x101B,W
	MOVWF	r0x101F
	CLRF	r0x1020
	RLF	r0x1020,F
	MOVF	r0x101E,W
	ADDWF	r0x1020,F
	MOVF	r0x101F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1020
	BTFSC	r0x1020,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	265; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
	BANKSEL	r0x101B
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101E
	BTFSC	r0x101E,0
	BSF	STATUS,7
	MOVLW	0x04
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00166_DS_
_00164_DS_
;	.line	269; "pbd_prg.c"	strBtnInfo[enuBtnId].u8HoldCntr++;
	BANKSEL	r0x101C
	MOVF	r0x101C,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x101B
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x101E
	MOVF	r0x101D,W
	BTFSC	STATUS,0
	INCFSZ	r0x101D,W
	ADDWF	r0x101E,F
	MOVLW	0x02
	ADDWF	r0x101B,W
	MOVWF	r0x101F
	CLRF	r0x1020
	RLF	r0x1020,F
	MOVF	r0x101E,W
	ADDWF	r0x1020,F
	MOVF	r0x101F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1020
	BTFSC	r0x1020,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	INCF	r0x1021,F
	MOVF	r0x101F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1020
	BTFSC	r0x1020,0
	BSF	STATUS,7
	MOVF	r0x1021,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	271; "pbd_prg.c"	PBD_enuBtnConfig[enuBtnId].u8HoldThreshold)
	BANKSEL	r0x101C
	MOVF	r0x101C,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x101C
	MOVF	r0x101D,W
	BTFSC	STATUS,0
	INCFSZ	r0x101D,W
	ADDLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x101D
	MOVLW	0x02
	ADDWF	r0x101C,F
	BTFSC	STATUS,0
	INCF	r0x101D,F
	MOVF	r0x101C,W
	MOVWF	STK01
	MOVF	r0x101D,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	SUBWF	r0x1021,W
	BTFSS	STATUS,0
	GOTO	_00166_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	273; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState = PBD_HOLD;
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101E
	BTFSC	r0x101E,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
_00166_DS_
	RETURN	
; exit point of _vidPreHoldState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidPushState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;8 compiler assigned registers:
;   r0x1022
;   STK00
;   r0x1023
;   r0x1024
;   r0x1025
;   STK01
;   r0x1026
;   r0x1027
;; Starting pCode block
_vidPushState	;Function start
; 2 exit points
;	.line	233; "pbd_prg.c"	static void vidPushState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x1022
	MOVWF	r0x1022
;	.line	237; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x1022,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1023
	MOVWF	r0x1023
	CLRF	r0x1024
	MOVF	r0x1023,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1022
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x1025
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDWF	r0x1025,F
	MOVF	r0x1022,W
	MOVWF	STK01
	MOVF	r0x1025,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1026
	MOVWF	r0x1026
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
;	.line	239; "pbd_prg.c"	if(u8BtnValue == PBD_RELEASE_LEVEL)
	BANKSEL	r0x1022
	MOVWF	r0x1022
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00154_DS_
;	.line	241; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	MOVF	r0x1023,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1022
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x1025
	MOVF	r0x1024,W
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDWF	r0x1025,F
	MOVLW	0x01
	ADDWF	r0x1022,W
	MOVWF	r0x1026
	CLRF	r0x1027
	RLF	r0x1027,F
	MOVF	r0x1025,W
	ADDWF	r0x1027,F
	MOVF	r0x1026,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1027
	BTFSC	r0x1027,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	242; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1025
	BTFSC	r0x1025,0
	BSF	STATUS,7
	MOVLW	0x04
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00156_DS_
_00154_DS_
;	.line	246; "pbd_prg.c"	strBtnInfo[enuBtnId].u8HoldCntr  = BTY_u8ZERO;
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1023
	MOVF	r0x1024,W
	BTFSC	STATUS,0
	INCFSZ	r0x1024,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x1024
	MOVLW	0x02
	ADDWF	r0x1023,W
	MOVWF	r0x1022
	CLRF	r0x1025
	RLF	r0x1025,F
	MOVF	r0x1024,W
	ADDWF	r0x1025,F
	MOVF	r0x1022,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1025
	BTFSC	r0x1025,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	247; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState = PBD_PRE_HOLD;
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1024
	BTFSC	r0x1024,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
_00156_DS_
	RETURN	
; exit point of _vidPushState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidPrePushState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;   __mulchar
;   __gptrget1
;   _DIO_u8ReadChannel
;   __gptrget1
;9 compiler assigned registers:
;   r0x1028
;   STK00
;   r0x1029
;   r0x102A
;   r0x102B
;   STK01
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
_vidPrePushState	;Function start
; 2 exit points
;	.line	201; "pbd_prg.c"	static void vidPrePushState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x1028
	MOVWF	r0x1028
;	.line	205; "pbd_prg.c"	u8BtnValue = DIO_u8ReadChannel(PBD_enuBtnConfig[enuBtnId].enuBtnChannelId);
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1029
	MOVWF	r0x1029
	CLRF	r0x102A
	MOVF	r0x1029,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1028
	MOVLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x102B
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x102A,W
	ADDWF	r0x102B,F
	MOVF	r0x1028,W
	MOVWF	STK01
	MOVF	r0x102B,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x102C
	MOVWF	r0x102C
	PAGESEL	_DIO_u8ReadChannel
	CALL	_DIO_u8ReadChannel
	PAGESEL	$
;	.line	207; "pbd_prg.c"	if(u8BtnValue == PBD_RELEASE_LEVEL)
	BANKSEL	r0x1028
	MOVWF	r0x1028
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	209; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr = BTY_u8ZERO;
	MOVF	r0x1029,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1028
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x102B
	MOVF	r0x102A,W
	BTFSC	STATUS,0
	INCFSZ	r0x102A,W
	ADDWF	r0x102B,F
	MOVLW	0x01
	ADDWF	r0x1028,W
	MOVWF	r0x102C
	CLRF	r0x102D
	RLF	r0x102D,F
	MOVF	r0x102B,W
	ADDWF	r0x102D,F
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102D
	BTFSC	r0x102D,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	210; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PRE_RELEASE;
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102B
	BTFSC	r0x102B,0
	BSF	STATUS,7
	MOVLW	0x04
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00148_DS_
_00146_DS_
;	.line	214; "pbd_prg.c"	strBtnInfo[enuBtnId].u8DebounceCntr++;
	BANKSEL	r0x1029
	MOVF	r0x1029,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1028
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x102B
	MOVF	r0x102A,W
	BTFSC	STATUS,0
	INCFSZ	r0x102A,W
	ADDWF	r0x102B,F
	MOVLW	0x01
	ADDWF	r0x1028,W
	MOVWF	r0x102C
	CLRF	r0x102D
	RLF	r0x102D,F
	MOVF	r0x102B,W
	ADDWF	r0x102D,F
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102D
	BTFSC	r0x102D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x102E
	MOVWF	r0x102E
	INCF	r0x102E,F
	MOVF	r0x102C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102D
	BTFSC	r0x102D,0
	BSF	STATUS,7
	MOVF	r0x102E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	217; "pbd_prg.c"	PBD_enuBtnConfig[enuBtnId].u8DebounceThreshold)
	BANKSEL	r0x1029
	MOVF	r0x1029,W
	ADDLW	(_PBD_enuBtnConfig + 0)
	MOVWF	r0x1029
	MOVF	r0x102A,W
	BTFSC	STATUS,0
	INCFSZ	r0x102A,W
	ADDLW	high (_PBD_enuBtnConfig + 0)
	MOVWF	r0x102A
	INCF	r0x1029,F
	BTFSC	STATUS,2
	INCF	r0x102A,F
	MOVF	r0x1029,W
	MOVWF	STK01
	MOVF	r0x102A,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x102C
	MOVWF	r0x102C
	XORWF	r0x102E,W
	BTFSS	STATUS,2
	GOTO	_00148_DS_
;	.line	219; "pbd_prg.c"	strBtnInfo[enuBtnId].enuBtnState    = PBD_PUSHED;
	MOVF	r0x1028,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102B
	BTFSC	r0x102B,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
_00148_DS_
	RETURN	
; exit point of _vidPrePushState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidUpdateBtnState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   _vidPrePushState
;   _vidPushState
;   _vidPreHoldState
;   _vidHoldState
;   _vidPreReleaseState
;   _vidReleaseState
;   __mulchar
;   _vidPrePushState
;   _vidPushState
;   _vidPreHoldState
;   _vidHoldState
;   _vidPreReleaseState
;   _vidReleaseState
;5 compiler assigned registers:
;   r0x102F
;   STK00
;   r0x1030
;   r0x1031
;   r0x1032
;; Starting pCode block
_vidUpdateBtnState	;Function start
; 2 exit points
;	.line	162; "pbd_prg.c"	static void  vidUpdateBtnState(PBD_tenuButtonId enuBtnId)
	BANKSEL	r0x102F
	MOVWF	r0x102F
;	.line	164; "pbd_prg.c"	switch(strBtnInfo[enuBtnId].enuBtnState)
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1030
	MOVWF	r0x1030
	CLRF	r0x1031
	MOVF	r0x1030,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1030
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1031,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x1031
	MOVF	r0x1030,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1031
	BTFSC	r0x1031,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1032
	MOVWF	r0x1032
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x6=6), size=1
	MOVLW	0x06
	SUBWF	r0x1032,W
	BTFSC	STATUS,0
	GOTO	_00132_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	MOVLW	HIGH(_00138_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00138_DS_
	BANKSEL	r0x1032
	ADDWF	r0x1032,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00138_DS_
	GOTO	_00124_DS_
	GOTO	_00125_DS_
	GOTO	_00126_DS_
	GOTO	_00127_DS_
	GOTO	_00128_DS_
	GOTO	_00129_DS_
_00124_DS_
;	.line	167; "pbd_prg.c"	vidPrePushState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidPrePushState
;	.line	168; "pbd_prg.c"	break;
	GOTO	_00132_DS_
_00125_DS_
;	.line	171; "pbd_prg.c"	vidPushState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidPushState
;	.line	172; "pbd_prg.c"	break;
	GOTO	_00132_DS_
_00126_DS_
;	.line	175; "pbd_prg.c"	vidPreHoldState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidPreHoldState
;	.line	176; "pbd_prg.c"	break;
	GOTO	_00132_DS_
_00127_DS_
;	.line	179; "pbd_prg.c"	vidHoldState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidHoldState
;	.line	180; "pbd_prg.c"	break;
	GOTO	_00132_DS_
_00128_DS_
;	.line	183; "pbd_prg.c"	vidPreReleaseState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidPreReleaseState
;	.line	184; "pbd_prg.c"	break;
	GOTO	_00132_DS_
_00129_DS_
;	.line	187; "pbd_prg.c"	vidReleaseState(enuBtnId);
	BANKSEL	r0x102F
	MOVF	r0x102F,W
	CALL	_vidReleaseState
_00132_DS_
;	.line	192; "pbd_prg.c"	}
	RETURN	
; exit point of _vidUpdateBtnState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PBD_enuGetButtonState	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;5 compiler assigned registers:
;   r0x1033
;   STK00
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
_PBD_enuGetButtonState	;Function start
; 2 exit points
;	.line	130; "pbd_prg.c"	PBD_tenuButtonState PBD_enuGetButtonState(PBD_tenuButtonId enuButtonId)
	BANKSEL	r0x1033
	MOVWF	r0x1033
;;unsigned compare: left < lit(0x3=3), size=1
;	.line	134; "pbd_prg.c"	if(enuButtonId < PBD_BUTTONS_NUM)
	MOVLW	0x03
	SUBWF	r0x1033,W
	BTFSC	STATUS,0
	GOTO	_00118_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
;	.line	136; "pbd_prg.c"	enuReturn = strBtnInfo[enuButtonId].enuBtnState;
	MOVLW	0x03
	MOVWF	STK00
	MOVF	r0x1033,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1034
	MOVWF	r0x1034
	CLRF	r0x1035
	MOVF	r0x1034,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1033
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x1036
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1035,W
	ADDWF	r0x1036,F
	MOVF	r0x1033,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1036
	BTFSC	r0x1036,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1034
	MOVWF	r0x1034
	GOTO	_00119_DS_
_00118_DS_
;	.line	140; "pbd_prg.c"	enuReturn = PBD_UNDEFINED;
	MOVLW	0x06
	BANKSEL	r0x1034
	MOVWF	r0x1034
_00119_DS_
;	.line	143; "pbd_prg.c"	return (enuReturn);
	BANKSEL	r0x1034
	MOVF	r0x1034,W
	RETURN	
; exit point of _PBD_enuGetButtonState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PBD_vidTask	;Function start
; 2 exit points
;has an exit
;functions called:
;   _vidUpdateBtnState
;   _vidUpdateBtnState
;1 compiler assigned register :
;   r0x1037
;; Starting pCode block
_PBD_vidTask	;Function start
; 2 exit points
;	.line	117; "pbd_prg.c"	for(u8Index=0;u8Index<PBD_BUTTONS_NUM; u8Index++)
	BANKSEL	r0x1037
	CLRF	r0x1037
_00112_DS_
;	.line	119; "pbd_prg.c"	vidUpdateBtnState((PBD_tenuButtonId)u8Index);
	BANKSEL	r0x1037
	MOVF	r0x1037,W
	CALL	_vidUpdateBtnState
;	.line	117; "pbd_prg.c"	for(u8Index=0;u8Index<PBD_BUTTONS_NUM; u8Index++)
	BANKSEL	r0x1037
	INCF	r0x1037,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVLW	0x03
	SUBWF	r0x1037,W
	BTFSS	STATUS,0
	GOTO	_00112_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	RETURN	
; exit point of _PBD_vidTask

;***
;  pBlock Stats: dbName = C
;***
;entry:  _PBD_vidInit	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;6 compiler assigned registers:
;   r0x1038
;   STK00
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
_PBD_vidInit	;Function start
; 2 exit points
;	.line	96; "pbd_prg.c"	for(u8Index=0;u8Index<PBD_BUTTONS_NUM;u8Index++)
	BANKSEL	r0x1038
	CLRF	r0x1038
_00106_DS_
;	.line	98; "pbd_prg.c"	strBtnInfo[u8Index].enuBtnState     = PBD_RELEASED;
	MOVLW	0x03
	MOVWF	STK00
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1039
	MOVWF	r0x1039
	CLRF	r0x103A
	MOVF	r0x1039,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x103B
	MOVLW	high (_strBtnInfo + 0)
	MOVWF	r0x103C
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x103A,W
	ADDWF	r0x103C,F
	MOVF	r0x103B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103C
	BTFSC	r0x103C,0
	BSF	STATUS,7
	MOVLW	0x05
	BANKSEL	INDF
	MOVWF	INDF
;	.line	99; "pbd_prg.c"	strBtnInfo[u8Index].u8DebounceCntr  = BTY_u8ZERO;
	BANKSEL	r0x1039
	MOVF	r0x1039,W
	ADDLW	(_strBtnInfo + 0)
	MOVWF	r0x1039
	MOVF	r0x103A,W
	BTFSC	STATUS,0
	INCFSZ	r0x103A,W
	ADDLW	high (_strBtnInfo + 0)
	MOVWF	r0x103A
	MOVLW	0x01
	ADDWF	r0x1039,W
	MOVWF	r0x103B
	CLRF	r0x103C
	RLF	r0x103C,F
	MOVF	r0x103A,W
	ADDWF	r0x103C,F
	MOVF	r0x103B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103C
	BTFSC	r0x103C,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	100; "pbd_prg.c"	strBtnInfo[u8Index].u8HoldCntr      = BTY_u8ZERO;
	MOVLW	0x02
	BANKSEL	r0x1039
	ADDWF	r0x1039,F
	BTFSC	STATUS,0
	INCF	r0x103A,F
	MOVF	r0x1039,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103A
	BTFSC	r0x103A,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	96; "pbd_prg.c"	for(u8Index=0;u8Index<PBD_BUTTONS_NUM;u8Index++)
	BANKSEL	r0x1038
	INCF	r0x1038,F
;;unsigned compare: left < lit(0x3=3), size=1
	MOVLW	0x03
	SUBWF	r0x1038,W
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	RETURN	
; exit point of _PBD_vidInit


;	code size estimation:
;	  721+  200 =   921 instructions ( 2242 byte)

	end
