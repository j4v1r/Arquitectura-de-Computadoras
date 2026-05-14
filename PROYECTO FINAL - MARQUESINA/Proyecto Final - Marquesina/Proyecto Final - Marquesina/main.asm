;
; Proyecto Final - Marquesina.asm
;
; Created: 13/12/2025 03:27:36 p. m.
; Author : Rogelio Colunga R
;


; Replace with your application code
	.def digs=r16
	.def cont=r17

	.def cont1=r18
	.def cont2=r19
	.def cont3=r20

	.def ltr7=r21
	.def ltr6=r22
	.def ltr5=r23
	.def ltr4=r24
	.def ltr3=r25
	.def ltr2=r26
	.def ltr1=r27
	.def ltr0=r28

	ldi cont,$01
	ldi ltr7,$88;A
	ldi ltr6,$F1;L
	ldi ltr5,$B0;E
	ldi ltr4,$C7;J
	ldi ltr3,$88;A
	ldi ltr2,$EA;d
	ldi ltr1,$FA;r
	ldi ltr0,$81;O


reset_delay: ldi cont1,75

multdigitos: rcall an7
		rcall an6
		rcall an5
		rcall an4
		rcall an3
		rcall an2
		rcall an1
		rcall an0
		
		dec cont1
		brne multdigitos

		rcall desplazamiento
		rcall digito_final
		rjmp reset_delay

an7:ldi digs,$7F
	out portd,digs
	out portb,ltr7
	rcall lazo3
	ret

an6:ldi digs,$BF
	out portd,digs
	out portb,ltr6
	rcall lazo3
	ret

an5:ldi digs,$DF
	out portd,digs
	out portb,ltr5
	rcall lazo3
	ret

an4:ldi digs,$EF
	out portd,digs
	out portb,ltr4
	rcall lazo3
	ret

an3:ldi digs,$F7
	out portd,digs
	out portb,ltr3
	rcall lazo3
	ret

an2:ldi digs,$FB
	out portd,digs
	out portb,ltr2
	rcall lazo3
	ret

an1:ldi digs,$FD
	out portd,digs
	out portb,ltr1
	rcall lazo3
	ret

an0:ldi digs,$FE
	out portd,digs
	out portb,ltr0
	rcall lazo3
	ret

desplazamiento:mov ltr7,ltr6
			   mov ltr6,ltr5
			   mov ltr5,ltr4
			   mov ltr4,ltr3
			   mov ltr3,ltr2
			   mov ltr2,ltr1
			   mov ltr1,ltr0
			   inc cont
			   ret
				
digito_final:cpi cont,20
			 breq reset_ciclo

			 cpi cont,1
			 breq ltrO

			 cpi cont,2
			 breq espacio

			 cpi cont,3
			 breq ltrC

			 cpi cont,4
			 breq ltrO

			 cpi cont,5
			 breq ltrL

			 cpi cont,6
			 breq ltrU

			 cpi cont,7
			 breq ltrN

			 cpi cont,8
			 breq ltrG

			 cpi cont,9
			 breq ltrA

			 cpi cont,10
			 breq espacio

			 cpi cont,11
			 breq espacio

			 cpi cont,12
			 breq ltrA

			 cpi cont,13
			 breq ltrL

			 cpi cont,14
			 breq ltrE

			 cpi cont,15
			 breq ltrJ

			 cpi cont,16
			 breq ltrA

			 cpi cont,17
			 breq ltrN

			 cpi cont,18
			 breq ltrD

			 cpi cont,19
			 breq ltrR

reset_ciclo:ldi cont,$01
	  ldi ltr0,$81
	  ret

ltrA:ldi ltr0,$88
	 ret

ltrL:ldi ltr0,$F1
	 ret

ltrE:ldi ltr0,$B0
	 ret

ltrJ:ldi ltr0,$C7
	 ret

ltrN:ldi ltr0,$EA
	 ret

ltrD:ldi ltr0,$C2
	 ret

ltrR:ldi ltr0,$FA
	 ret

ltrO:ldi ltr0,$81
	 ret

espacio:ldi ltr0,$FF
		ret

ltrC:ldi ltr0,$B1
	 ret

ltrU:ldi ltr0,$C1
	 ret

ltrG:ldi ltr0,$A1
	 ret

lazo3:	ldi cont2,80
lazo2:	ldi cont3,100
lazo1:	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	dec cont3
	brne lazo1
	dec cont2
	brne lazo2
	ret