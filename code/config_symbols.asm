;===============================================================
; setting up some general symbols we use in our code
;================================================================

;============================================================
; symbols
;============================================================

; usable zero page bytes:
; Free: $02, $FB-$FE
; Temp Storage: $22-$29, $57-$60 (used by some Kernel Routines) 
; If no datasette or RS232 is used: $9E-$9F, $A5-$A7, $A9-$AB, $B0-$B6, $F7-$FA
; Used by attache devices: $90-$C2 (except $A0-$A2 used for internal clock)
; Required for Basic: $03-$56 und $73-$8B.

screen_ram      = $0400     ; location of screen ram
init_sid        = $11ed     ; init routine for music
play_sid        = $1004     ; play music routine
delay_counter   = $90       ; used to time color switch in the border
pra             = $dc00     ; CIA#1 (Port Register A)
prb             = $dc01     ; CIA#1 (Port Register B)
ddra            = $dc02     ; CIA#1 (Data Direction Register A)
ddrb            = $dc03     ; CIA#1 (Data Direction Register B)

lda #$00 				; initialize delay_counter
sta delay_counter
