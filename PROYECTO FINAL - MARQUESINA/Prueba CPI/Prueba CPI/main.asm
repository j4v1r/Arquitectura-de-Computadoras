;
; Prueba CPI.asm
;
; Created: 14/12/2025 08:49:06 a. m.
; Author : Rogelio Colunga R
;


; Replace with your application code
; Programa de prueba para CPI
; Demuestra que CPI no modifica registros
LDI R16, 15      ; R16 = 15
CPI R16, 10      ; Comparar con 10 (R16 sigue siendo 15)
BREQ ERROR       ; No debería saltar (15 ? 10)
CPI R16, 15      ; Comparar con 15
BRNE ERROR       ; No debería saltar (15 = 15)

; Si llegamos aquí, CPI funciona correctamente
LDI R17, 0xAA    ; Código de éxito
OUT PORTB, R17   ; Mostrar éxito

ERROR:
LDI R17, 0x55    ; Código de error
OUT PORTB, R17   ; Mostrar error