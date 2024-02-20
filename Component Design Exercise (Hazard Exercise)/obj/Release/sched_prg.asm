;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:39 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"sched_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_MCU_vidInit
	extern	_SCHED_astrTCBConfig
	extern	__mulchar

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
	global	_SCHED_vidRtcInterrupt
	global	_SCHED_vidStartScheduler
	global	_SCHED_vidInit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_sched_prg_0	udata
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
_astrTCB	res	10
_u8TickCounter	res	1
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
code_sched_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _SCHED_vidRtcInterrupt	;Function start
; 0 exit points
;; Starting pCode block
_SCHED_vidRtcInterrupt	;Function start
; 0 exit points
;	.line	117; "sched_prg.c"	u8TickCounter++;
	BANKSEL	_u8TickCounter
	INCF	_u8TickCounter,F
;	.line	121; "sched_prg.c"	if(u8TickCounter == SCHED_u8MAX_TASK_DURATION)
	MOVF	_u8TickCounter,W
	XORLW	0x0a
	BTFSC	STATUS,2
_00149_DS_
	GOTO	_00149_DS_
	RETURN	

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidManageTemporalTasks	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;   _00139_DS_
;   __mulchar
;   __mulchar
;   _00139_DS_
;9 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
_vidManageTemporalTasks	;Function start
; 2 exit points
;	.line	89; "sched_prg.c"	for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
	BANKSEL	r0x101F
	CLRF	r0x101F
_00125_DS_
;	.line	91; "sched_prg.c"	if(astrTCB[u8Index].enuTaskStatus == SCHED_TASK_ACTIVE)
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1020
	MOVWF	r0x1020
	CLRF	r0x1021
	MOVF	r0x1020,W
	ADDLW	(_astrTCB + 0)
	MOVWF	r0x1022
	MOVLW	high (_astrTCB + 0)
	MOVWF	r0x1023
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1021,W
	ADDWF	r0x1023,F
	MOVF	r0x1022,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1023
	BTFSC	r0x1023,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	r0x1024,W
	BTFSS	STATUS,2
	GOTO	_00126_DS_
;	.line	93; "sched_prg.c"	if(astrTCB[u8Index].u8TaskCounter > BTY_u8ZERO)
	MOVF	r0x1020,W
	ADDLW	(_astrTCB + 0)
	MOVWF	r0x1020
	MOVF	r0x1021,W
	BTFSC	STATUS,0
	INCFSZ	r0x1021,W
	ADDLW	high (_astrTCB + 0)
	MOVWF	r0x1021
	INCF	r0x1020,F
	BTFSC	STATUS,2
	INCF	r0x1021,F
	MOVF	r0x1020,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1021
	BTFSC	r0x1021,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1022
	MOVWF	r0x1022
	MOVF	r0x1022,W
	BTFSC	STATUS,2
	GOTO	_00120_DS_
;	.line	95; "sched_prg.c"	astrTCB[u8Index].u8TaskCounter--;
	DECF	r0x1022,F
	MOVF	r0x1020,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1021
	BTFSC	r0x1021,0
	BSF	STATUS,7
	MOVF	r0x1022,W
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00126_DS_
_00120_DS_
;	.line	100; "sched_prg.c"	SCHED_astrTCBConfig[u8Index].u8TaskPeriod;
	MOVLW	0x04
	MOVWF	STK00
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1022
	MOVWF	r0x1022
	CLRF	r0x1023
	MOVF	r0x1022,W
	ADDLW	(_SCHED_astrTCBConfig + 0)
	MOVWF	r0x1022
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1023,W
	ADDLW	high (_SCHED_astrTCBConfig + 0)
	MOVWF	r0x1023
	MOVLW	0x03
	ADDWF	r0x1022,W
	MOVWF	r0x1024
	CLRF	r0x1025
	RLF	r0x1025,F
	MOVF	r0x1023,W
	ADDWF	r0x1025,F
	MOVF	r0x1024,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1025
	BTFSC	r0x1025,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	MOVF	r0x1020,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1021
	BTFSC	r0x1021,0
	BSF	STATUS,7
	MOVF	r0x1026,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	102; "sched_prg.c"	(*SCHED_astrTCBConfig[u8Index].pfTask)();
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1023
	BTFSC	r0x1023,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1021
	MOVWF	r0x1021
	CALL	_00139_DS_
	PAGESEL	_00126_DS_
	GOTO	_00126_DS_
_00139_DS_
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	BANKSEL	PCLATH
	MOVWF	PCLATH
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BANKSEL	PCL
	MOVWF	PCL
_00126_DS_
;	.line	89; "sched_prg.c"	for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
	BANKSEL	r0x101F
	INCF	r0x101F,F
;;unsigned compare: left < lit(0x5=5), size=1
	MOVLW	0x05
	SUBWF	r0x101F,W
	BTFSS	STATUS,0
	GOTO	_00125_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	RETURN	
; exit point of _vidManageTemporalTasks

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SCHED_vidStartScheduler	;Function start
; 2 exit points
;has an exit
;functions called:
;   _vidManageTemporalTasks
;   _vidManageTemporalTasks
;; Starting pCode block
_SCHED_vidStartScheduler	;Function start
; 2 exit points
_00114_DS_
;	.line	71; "sched_prg.c"	if(u8TickCounter > BTY_u8ZERO)
	MOVLW	0x00
	BANKSEL	_u8TickCounter
	IORWF	_u8TickCounter,W
	BTFSC	STATUS,2
	GOTO	_00114_DS_
;	.line	74; "sched_prg.c"	u8TickCounter--;
	DECF	_u8TickCounter,F
;	.line	76; "sched_prg.c"	vidManageTemporalTasks();
	CALL	_vidManageTemporalTasks
	GOTO	_00114_DS_
	RETURN	
; exit point of _SCHED_vidStartScheduler

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SCHED_vidInit	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mulchar
;   __mulchar
;   __mulchar
;   __mulchar
;9 compiler assigned registers:
;   r0x1027
;   STK00
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;; Starting pCode block
_SCHED_vidInit	;Function start
; 2 exit points
;	.line	54; "sched_prg.c"	for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
	BANKSEL	r0x1027
	CLRF	r0x1027
_00106_DS_
;	.line	56; "sched_prg.c"	astrTCB[u8Index].u8TaskCounter = 
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x1027
	MOVF	r0x1027,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	CLRF	r0x1029
	MOVF	r0x1028,W
	ADDLW	(_astrTCB + 0)
	MOVWF	r0x1028
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1029,W
	ADDLW	high (_astrTCB + 0)
	MOVWF	r0x1029
	MOVLW	0x01
	ADDWF	r0x1028,W
	MOVWF	r0x102A
	CLRF	r0x102B
	RLF	r0x102B,F
	MOVF	r0x1029,W
	ADDWF	r0x102B,F
;	.line	57; "sched_prg.c"	SCHED_astrTCBConfig[u8Index].u8TaskDelay;
	MOVLW	0x04
	MOVWF	STK00
	MOVF	r0x1027,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x102C
	MOVWF	r0x102C
	CLRF	r0x102D
	MOVF	r0x102C,W
	ADDLW	(_SCHED_astrTCBConfig + 0)
	MOVWF	r0x102C
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x102D,W
	ADDLW	high (_SCHED_astrTCBConfig + 0)
	MOVWF	r0x102D
	MOVLW	0x02
	ADDWF	r0x102C,F
	BTFSC	STATUS,0
	INCF	r0x102D,F
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
	MOVF	r0x102A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102B
	BTFSC	r0x102B,0
	BSF	STATUS,7
	MOVF	r0x102E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	59; "sched_prg.c"	astrTCB[u8Index].enuTaskStatus = SCHED_TASK_ACTIVE;
	BANKSEL	r0x1028
	MOVF	r0x1028,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1029
	BTFSC	r0x1029,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	54; "sched_prg.c"	for(u8Index=0; u8Index<SCHED_TASKS_NUMBER; u8Index++)
	BANKSEL	r0x1027
	INCF	r0x1027,F
;;unsigned compare: left < lit(0x5=5), size=1
	MOVLW	0x05
	SUBWF	r0x1027,W
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3247: created from rifx:00000000047558B0
	RETURN	
; exit point of _SCHED_vidInit


;	code size estimation:
;	  194+   62 =   256 instructions (  636 byte)

	end
