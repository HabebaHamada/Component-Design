;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW64)
; This file was generated Thu Nov 10 14:55:35 2022
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"mcu_prg.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3f3a
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_SCHED_vidInit
	extern	_SCHED_vidStartScheduler
	extern	_SCHED_vidRtcInterrupt
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
	extern	___sdcc_saved_fsr

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
	global	_MCU_vidInit
	global	_myIntr

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
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _myIntr	;Function start
; 0 exit points
;functions called:
;   _SCHED_vidRtcInterrupt
;   _SCHED_vidRtcInterrupt
;; Starting pCode block
_myIntr	;Function start
; 0 exit points
;	.line	88; "mcu_prg.c"	void myIntr(void) __interrupt 0
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	91; "mcu_prg.c"	GIE =0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	94; "mcu_prg.c"	TMR0IF =0;
	BCF	_INTCONbits,2
;	.line	97; "mcu_prg.c"	SCHED_vidRtcInterrupt();
	PAGESEL	_SCHED_vidRtcInterrupt
	CALL	_SCHED_vidRtcInterrupt
	PAGESEL	$
;	.line	100; "mcu_prg.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_mcu_prg	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _MCU_vidInit	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_MCU_vidInit	;Function start
; 2 exit points
;	.line	65; "mcu_prg.c"	T0CS = 0;
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	68; "mcu_prg.c"	PSA = 0;
	BCF	_OPTION_REGbits,3
;	.line	71; "mcu_prg.c"	PS0 = 0;
	BCF	_OPTION_REGbits,0
;	.line	72; "mcu_prg.c"	PS1 = 1;
	BSF	_OPTION_REGbits,1
;	.line	73; "mcu_prg.c"	PS2 = 0;
	BCF	_OPTION_REGbits,2
;	.line	76; "mcu_prg.c"	GIE =1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	77; "mcu_prg.c"	PEIE =1;
	BSF	_INTCONbits,6
;	.line	78; "mcu_prg.c"	TMR0IE = 1;
	BSF	_INTCONbits,5
;	.line	79; "mcu_prg.c"	TMR0IF = 0;
	BCF	_INTCONbits,2
	RETURN	
; exit point of _MCU_vidInit


;	code size estimation:
;	   33+    9 =    42 instructions (  102 byte)

	end
