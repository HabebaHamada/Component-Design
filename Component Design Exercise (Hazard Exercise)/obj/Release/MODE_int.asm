;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 17:40:19 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"MODE_int.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TIF_vidInit
	extern	_TIF_vidTask
	extern	_TIF_vidSetMode
	extern	_HIF_vidInit
	extern	_HIF_vidTask
	extern	_HIF_vidSetMode
	extern	_DIO_u8ReadChannel
	extern	_DIO_vidWriteChannel
	extern	_DIO_vidWritePort
	extern	_PBD_vidInit
	extern	_PBD_vidTask
	extern	_PBD_enuGetButtonState

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
	global	_MODE_vidTask
	global	_MODE_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_MODE_int_0	udata
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
_ModeState	res	1
_MODE_vidTask_PreviousState_1_18	res	1
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
code_MODE_int	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _MODE_vidTask	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PBD_enuGetButtonState
;   _PBD_enuGetButtonState
;   _PBD_enuGetButtonState
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _PBD_enuGetButtonState
;   _PBD_enuGetButtonState
;   _PBD_enuGetButtonState
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;3 compiler assigned registers:
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
_MODE_vidTask	;Function start
; 2 exit points
;	.line	36; "MODE_int.c"	PBD_tenuButtonId ButtonStateDown = PBD_enuGetButtonState(PBD_BUTTON_STEP_DOWN);
	MOVLW	0x00
	PAGESEL	_PBD_enuGetButtonState
	CALL	_PBD_enuGetButtonState
	PAGESEL	$
	BANKSEL	r0x1002
	MOVWF	r0x1002
;	.line	37; "MODE_int.c"	PBD_tenuButtonId ButtonStateUP = PBD_enuGetButtonState(PBD_BUTTON_STEP_UP);
	MOVLW	0x01
	PAGESEL	_PBD_enuGetButtonState
	CALL	_PBD_enuGetButtonState
	PAGESEL	$
	BANKSEL	r0x1003
	MOVWF	r0x1003
;	.line	38; "MODE_int.c"	PBD_tenuButtonId ButtonStateHazzard = PBD_enuGetButtonState(PBD_BUTTON_HAZZARD);
	MOVLW	0x02
	PAGESEL	_PBD_enuGetButtonState
	CALL	_PBD_enuGetButtonState
	PAGESEL	$
	BANKSEL	r0x1004
	MOVWF	r0x1004
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	42; "MODE_int.c"	switch(ModeState)
	MOVLW	0x04
	BANKSEL	_ModeState
	SUBWF	_ModeState,W
	BTFSC	STATUS,0
	GOTO	_00146_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	MOVLW	HIGH(_00188_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00188_DS_
	BANKSEL	_ModeState
	ADDWF	_ModeState,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00188_DS_
	GOTO	_00109_DS_
	GOTO	_00127_DS_
	GOTO	_00118_DS_
	GOTO	_00136_DS_
_00109_DS_
;	.line	45; "MODE_int.c"	if(ButtonStateDown == PBD_PUSHED)
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	47; "MODE_int.c"	ModeState = LEFT_BLINK;
	MOVLW	0x02
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00117_DS_
_00116_DS_
;	.line	49; "MODE_int.c"	else if(ButtonStateUP == PBD_PUSHED)
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	51; "MODE_int.c"	ModeState = RIGHT_BLINK;
	MOVLW	0x01
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00117_DS_
_00113_DS_
;	.line	53; "MODE_int.c"	else if(ButtonStateHazzard == PBD_PUSHED)
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	55; "MODE_int.c"	PreviousState = IDLE;
	BANKSEL	_MODE_vidTask_PreviousState_1_18
	CLRF	_MODE_vidTask_PreviousState_1_18
;	.line	56; "MODE_int.c"	ModeState = HAZZARD_BLINK;
	MOVLW	0x03
	BANKSEL	_ModeState
	MOVWF	_ModeState
_00117_DS_
;	.line	62; "MODE_int.c"	HIF_vidSetMode(HIF_OFF_MODE);
	MOVLW	0x00
	PAGESEL	_HIF_vidSetMode
	CALL	_HIF_vidSetMode
	PAGESEL	$
;	.line	63; "MODE_int.c"	TIF_vidSetMode(TIF_OFF_MODE);
	MOVLW	0x00
	PAGESEL	_TIF_vidSetMode
	CALL	_TIF_vidSetMode
	PAGESEL	$
;	.line	65; "MODE_int.c"	break;
	GOTO	_00146_DS_
_00118_DS_
;	.line	68; "MODE_int.c"	if(ButtonStateUP == PBD_PUSHED)
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00125_DS_
;	.line	70; "MODE_int.c"	ModeState = IDLE;
	BANKSEL	_ModeState
	CLRF	_ModeState
	GOTO	_00126_DS_
_00125_DS_
;	.line	72; "MODE_int.c"	else if(ButtonStateDown == PBD_PUSHED)
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00122_DS_
;	.line	74; "MODE_int.c"	ModeState = LEFT_BLINK;
	MOVLW	0x02
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00126_DS_
_00122_DS_
;	.line	76; "MODE_int.c"	else if(ButtonStateHazzard == PBD_PUSHED)
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00126_DS_
;	.line	78; "MODE_int.c"	PreviousState = LEFT_BLINK;
	MOVLW	0x02
	BANKSEL	_MODE_vidTask_PreviousState_1_18
	MOVWF	_MODE_vidTask_PreviousState_1_18
;	.line	79; "MODE_int.c"	ModeState = HAZZARD_BLINK;
	MOVLW	0x03
	BANKSEL	_ModeState
	MOVWF	_ModeState
_00126_DS_
;	.line	85; "MODE_int.c"	HIF_vidSetMode(HIF_OFF_MODE);
	MOVLW	0x00
	PAGESEL	_HIF_vidSetMode
	CALL	_HIF_vidSetMode
	PAGESEL	$
;	.line	86; "MODE_int.c"	TIF_vidSetMode(TIF_LEFT_BLINK_MODE);
	MOVLW	0x02
	PAGESEL	_TIF_vidSetMode
	CALL	_TIF_vidSetMode
	PAGESEL	$
;	.line	88; "MODE_int.c"	break;
	GOTO	_00146_DS_
_00127_DS_
;	.line	90; "MODE_int.c"	if(ButtonStateUP == PBD_PUSHED)
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00134_DS_
;	.line	92; "MODE_int.c"	ModeState = RIGHT_BLINK;
	MOVLW	0x01
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00135_DS_
_00134_DS_
;	.line	94; "MODE_int.c"	else if(ButtonStateDown == PBD_PUSHED)
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00131_DS_
;	.line	96; "MODE_int.c"	ModeState = IDLE;
	BANKSEL	_ModeState
	CLRF	_ModeState
	GOTO	_00135_DS_
_00131_DS_
;	.line	98; "MODE_int.c"	else if(ButtonStateHazzard == PBD_PUSHED)
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00135_DS_
;	.line	100; "MODE_int.c"	PreviousState = RIGHT_BLINK;
	MOVLW	0x01
	BANKSEL	_MODE_vidTask_PreviousState_1_18
	MOVWF	_MODE_vidTask_PreviousState_1_18
;	.line	101; "MODE_int.c"	ModeState = HAZZARD_BLINK;
	MOVLW	0x03
	BANKSEL	_ModeState
	MOVWF	_ModeState
_00135_DS_
;	.line	107; "MODE_int.c"	HIF_vidSetMode(HIF_OFF_MODE);
	MOVLW	0x00
	PAGESEL	_HIF_vidSetMode
	CALL	_HIF_vidSetMode
	PAGESEL	$
;	.line	108; "MODE_int.c"	TIF_vidSetMode(TIF_RIGHT_BLINK_MODE);
	MOVLW	0x01
	PAGESEL	_TIF_vidSetMode
	CALL	_TIF_vidSetMode
	PAGESEL	$
;	.line	110; "MODE_int.c"	break;
	GOTO	_00146_DS_
_00136_DS_
;	.line	112; "MODE_int.c"	if(ButtonStateUP == PBD_PUSHED)
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00143_DS_
;	.line	114; "MODE_int.c"	ModeState = HAZZARD_BLINK;
	MOVLW	0x03
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00144_DS_
_00143_DS_
;	.line	116; "MODE_int.c"	else if(ButtonStateDown == PBD_PUSHED)
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	118; "MODE_int.c"	ModeState = HAZZARD_BLINK;
	MOVLW	0x03
	BANKSEL	_ModeState
	MOVWF	_ModeState
	GOTO	_00144_DS_
_00140_DS_
;	.line	120; "MODE_int.c"	else if(ButtonStateHazzard == PBD_PUSHED)
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00144_DS_
;	.line	122; "MODE_int.c"	ModeState = PreviousState;
	BANKSEL	_MODE_vidTask_PreviousState_1_18
	MOVF	_MODE_vidTask_PreviousState_1_18,W
	BANKSEL	_ModeState
	MOVWF	_ModeState
_00144_DS_
;	.line	128; "MODE_int.c"	HIF_vidSetMode(HIF_ON_MODE);
	MOVLW	0x01
	PAGESEL	_HIF_vidSetMode
	CALL	_HIF_vidSetMode
	PAGESEL	$
;	.line	129; "MODE_int.c"	TIF_vidSetMode(TIF_OFF_MODE);
	MOVLW	0x00
	PAGESEL	_TIF_vidSetMode
	CALL	_TIF_vidSetMode
	PAGESEL	$
_00146_DS_
;	.line	133; "MODE_int.c"	}
	RETURN	
; exit point of _MODE_vidTask

;***
;  pBlock Stats: dbName = C
;***
;entry:  _MODE_vidInit	;Function start
; 2 exit points
;has an exit
;functions called:
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;   _HIF_vidSetMode
;   _TIF_vidSetMode
;; Starting pCode block
_MODE_vidInit	;Function start
; 2 exit points
;	.line	25; "MODE_int.c"	ModeState = IDLE;
	BANKSEL	_ModeState
	CLRF	_ModeState
;	.line	29; "MODE_int.c"	HIF_vidSetMode(HIF_UNDEFINED_MODE);
	MOVLW	0x02
	PAGESEL	_HIF_vidSetMode
	CALL	_HIF_vidSetMode
	PAGESEL	$
;	.line	30; "MODE_int.c"	TIF_vidSetMode(TIF_UNDEFINED_MODE);
	MOVLW	0x03
	PAGESEL	_TIF_vidSetMode
	CALL	_TIF_vidSetMode
	PAGESEL	$
	RETURN	
; exit point of _MODE_vidInit


;	code size estimation:
;	  134+   62 =   196 instructions (  516 byte)

	end
