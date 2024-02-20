;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 17:40:20 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"sched_cfg.c"
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
	global	_SCHED_astrTCBConfig

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

ID_sched_cfg_0	idata
_SCHED_astrTCBConfig
	db	low (_SSD_vidTask+0), high (_SSD_vidTask+0)
	db	0x00
	db	0x05
	db	low (_PBD_vidTask+0), high (_PBD_vidTask+0)
	db	0x00
	db	0x0a
	db	low (_MODE_vidTask+0), high (_MODE_vidTask+0)
	db	0x00
	db	0x0a
	db	low (_HIF_vidTask+0), high (_HIF_vidTask+0)
	db	0x00
	db	0x0a
	db	low (_TIF_vidTask+0), high (_TIF_vidTask+0)
	db	0x00
	db	0x0a

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_sched_cfg	code

;	code size estimation:
;	    0+    0 =     0 instructions (    0 byte)

	end
