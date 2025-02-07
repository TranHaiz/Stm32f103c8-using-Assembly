RCC_APB2ENR EQU 0x40021018	
	
GPIOA_CRL	EQU 0x40010800
GPIOA_CRH	EQU 0x40010804
GPIOA_IDR	EQU 0x40010808
GPIOA_ODR	EQU 0x4001080C

GPIOB_CRL	EQU 0x40010C00
GPIOB_CRH	EQU 0x40010C04
GPIOB_IDR	EQU 0x40010C08
GPIOB_ODR	EQU 0x40010C0C

	EXPORT __main
	AREA MAIN, CODE, READONLY
__main
	LDR	R1,=RCC_APB2ENR
	LDR R0,[R1]			;read the APB2ENR
	ORR R0,R0,#0xFC		;enable the clocks for GPIOs
	STR R0,[R1]			;write R0 to APB2ENR
	
	LDR R1,=GPIOA_CRL
	LDR R0,=0x3
	STR R0,[R1]			
	
LOOP
	LDR R0, =GPIOA_ODR
	MVN R1, R1
	STR R1,[R0]
	BL delay
	B LOOP

delay
	LDR R7,=12345678
ve	SUBS R7, R7, #1
	BNE ve
	BX LR
	END

