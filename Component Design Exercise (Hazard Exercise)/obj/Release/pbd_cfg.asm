;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:36 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"pbd_cfg.c"
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
	global	_PBD_enuBtnConfig

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

ID_pbd_cfg_0	code
_PBD_enuBtnConfig
	retlw 0x07
	retlw 0x01
	retlw 0x0a
	retlw 0x08
	retlw 0x01
	retlw 0x0a
	retlw 0x09
	retlw 0x01
	retlw 0x14

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_pbd_cfg	code

;	code size estimation:
;	    0+    0 =     0 instructions (    0 byte)

	end
