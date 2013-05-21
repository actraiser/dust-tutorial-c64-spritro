;===================================
; main.asm triggers all subroutines 
; and runs the Interrupt Routine
;===================================

main      sei               ; set interrupt disable flag

          jsr clear_screen  ; clear the screen
          jsr init_sid      ; init music routine 
          jsr write_text    ; write three lines of text

          lda #$00                    ; load our delay animation byte with #$00
          sta delay_animation_pointer ; we EOR against #$01 to flip between colors later

          lda #$01             ; initialize delay_counter for
          sta delay_counter    ; side-borders color switching

          ldy #$7f    ; $7f = %01111111
          sty $dc0d   ; Turn off CIAs Timer interrupts ($7f = %01111111)
          sty $dd0d   ; Turn off CIAs Timer interrupts ($7f = %01111111)
          lda $dc0d   ; by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
          lda $dd0d   ; by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
           
          lda #$01    ; Set Interrupt Request Mask...
          sta $d01a   ; ...we want IRQ by Rasterbeam (%00000001)

          lda #<irq   ; point IRQ Vector to our custom irq routine
          ldx #>irq 
          sta $0314    ; store in $314/$315
          stx $0315   

          lda #$00    ; trigger interrupt at row zero
          sta $d012

          lda #$06    ; set border to blue color
          sta $d020

          cli         ; clear interrupt disable flag
          jmp *       ; infinite loop


;================================
; Our custom interrupt routines 
;================================

irq        dec $d019          ; acknowledge IRQ / clear register for next interrupt
           jsr color_cycle    ; put color cycle on text
           jsr play_sid       ; jump to play music routine
           jsr update_ship    ; move ship
           jsr check_keyboard ; check keyboard controls


;=============================
; Open Top/Bottom borders
;=============================

           lda #$00       ; clear potential garbage in $3fff
           sta $3fff

           lda #$f9       ; wait until Raster Line 249
           cmp $d012
           bne *-3

           lda $d011      ; Trick the VIC and open the border
           and #$f7
           sta $d011

           lda #$ff       ; Wait until Raster Line 255
           cmp $d012
           bne *-3

           lda $d011      ; Reset bit 3 for the next frame
           ora #$08
           sta $d011

           jmp $ea31      ; return to Kernel routine