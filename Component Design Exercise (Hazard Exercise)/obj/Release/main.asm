;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 17:39:59 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_PORT_vidInit
	extern	_DIO_u8ReadChannel
	extern	_DIO_vidWriteChannel
	extern	_DIO_vidWritePort
	extern	_MCU_vidInit
	extern	_SSD_vidInit
	extern	_SSD_vidTask
	extern	_SSD_SetDisplayedNumber
	extern	_PBD_vidInit
	extern	_PBD_vidTask
	extern	_PBD_enuGetButtonState
	extern	_TIF_vidInit
	extern	_TIF_vidTask
	extern	_TIF_vidSetMode
	extern	_HIF_vidInit
	extern	_HIF_vidTask
	extern	_HIF_vidSetMode
	extern	_MODE_vidInit
	extern	_MODE_vidTask
	extern	_SCHED_vidInit
	extern	_SCHED_vidStartScheduler
	extern	_SCHED_vidRtcInterrupt
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _vidInit
;   _SCHED_vidStartScheduler
;   _vidInit
;   _SCHED_vidStartScheduler
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	60; "main.c"	vidInit();
	CALL	_vidInit
;	.line	63; "main.c"	SCHED_vidStartScheduler();
	PAGESEL	_SCHED_vidStartScheduler
	CALL	_SCHED_vidStartScheduler
	PAGESEL	$
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _vidInit	;Function start
; 2 exit points
;has an exit
;functions called:
;   _PORT_vidInit
;   _MCU_vidInit
;   _SSD_vidInit
;   _PBD_vidInit
;   _MODE_vidInit
;   _SCHED_vidInit
;   _PORT_vidInit
;   _MCU_vidInit
;   _SSD_vidInit
;   _PBD_vidInit
;   _MODE_vidInit
;   _SCHED_vidInit
;; Starting pCode block
_vidInit	;Function start
; 2 exit points
;	.line	70; "main.c"	PORT_vidInit();
	PAGESEL	_PORT_vidInit
	CALL	_PORT_vidInit
	PAGESEL	$
;	.line	71; "main.c"	MCU_vidInit();
	PAGESEL	_MCU_vidInit
	CALL	_MCU_vidInit
	PAGESEL	$
;	.line	73; "main.c"	SSD_vidInit();
	PAGESEL	_SSD_vidInit
	CALL	_SSD_vidInit
	PAGESEL	$
;	.line	74; "main.c"	PBD_vidInit();
	PAGESEL	_PBD_vidInit
	CALL	_PBD_vidInit
	PAGESEL	$
;	.line	76; "main.c"	MODE_vidInit();
	PAGESEL	_MODE_vidInit
	CALL	_MODE_vidInit
	PAGESEL	$
;	.line	79; "main.c"	SCHED_vidInit();
	PAGESEL	_SCHED_vidInit
	CALL	_SCHED_vidInit
	PAGESEL	$
	RETURN	
; exit point of _vidInit


;	code size estimation:
;	   10+   14 =    24 instructions (   76 byte)

	end
