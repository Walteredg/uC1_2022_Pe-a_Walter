;--------------------------------------------------------------
; @file	    P2_Display_7SEG
; @author   Walter Edgardo Peña Meza
; @date	    15/01/2023
; @brief    En un display de 7seg, se muestran los valores del 0-9 si es que el boton no está presionado,
;	    si el boton se mantiene presionado se muestran valores del A-F, con un retardo de 1s.
; @ide:	    MPLAB X IDE v6.00
; @OSC:	    Se utilizo un oscilador de 4MHz para obtener los retardos pedidos.
;------------------------------------------------------------------
    
PROCESSOR 18F57Q84
#include "bt_config.inc"   /*config statements should precede project file includes.*/
#include <xc.inc>
#include "DELAYS.inc"


PSECT resetVect,class=CODE,reloc=2
resetVect:
    goto Main
    
PSECT CODE
    
Main:
    CALL    Config_OSC,1
    CALL    Config_Port,1
    MOVLW 00000000B	    ;limpiamos D
    MOVWF TRISD

Num1:
    MOVLW	11111001B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num2
    GOTO	Alfa	    ; boton presionado 
    
Num2:
    MOVLW	10100100B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num3
    GOTO	Alfa
Num3:
    MOVLW	10110000B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num4
    GOTO	Alfa
    
Num4:
   
    MOVLW	10011001B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num5
   GOTO 	Alfa
Num5:
    MOVLW	10010010B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num6
    GOTO	Alfa

Num6:
    MOVLW	10000010B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num7
    GOTO	Alfa
    
Num7:
    MOVLW	11111000B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num8
    GOTO	Alfa

Num8:
    MOVLW	10000000B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num9
    GOTO	Alfa

Num9:
    MOVLW	10010000B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfa
    
Alfa:
    MOVLW	00001000B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfb
    
    
Alfb:
    MOVLW	00000011B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfc


Alfc:
    MOVLW	01000110B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfd

    
Alfd:
    MOVLW	00100001B
    MOVWF	PORTD
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfe

    
Alfe:
    MOVLW	00000110B
    MOVWF	PORTD,1
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alff
 
    
Alff:
    BANKSEL	PORTD
    SETF	LATD,1
    MOVLW	00001110B
    MOVWF	PORTD,1
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    CALL	Delay_250ms
    BTFSC	PORTA,3,0   ;PORTA <3> = 0  -  BUTTON PRESS
    GOTO	Num1
    GOTO	Alfa


Config_OSC:
    ;configuración del oscilador interno a una frecuencia de 4MHz
    BANKSEL	OSCCON1
    MOVLW	0x60	    ;seleccionamos el bloque del oscilador interno con un div:1
    MOVWF	OSCCON1,1
    MOVLW	0x02	    ;seleccionamos una frecuencia de 4MHz
    MOVWF	OSCFRQ,1 
    RETURN

Config_Port:		    ; PORT-LAT-ANSEL-TRIS LED_RF3, BUTTON:RA3
    ;config PORTD
    BANKSEL	PORTD
    CLRF	PORTD,1	    ;PORTF = 0 
    bsf		LATD,7,1	    ;LATF = 1
    CLRF	ANSELD,1    ;ANSELF<7:F> = 0 - PORT D DIGITAL

    
    ;config Button
    BANKSEL PORTA
    CLRF    PORTA,1	    ;PORTA<7:0> = 0 
    CLRF    ANSELA,1	    ;PORTA digital
    BSF	    TRISA,3,1	    ;RA3 como entrada
    BSF	    WPUA,3,1	    ;Activamos la resistencia pull-up del pin RA3
    RETURN
    
END resetVect