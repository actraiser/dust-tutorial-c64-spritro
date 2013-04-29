;==================================================================
; main.asm triggers all sub routines and runs the Interrupt Routine
;==================================================================

           sei         ; set interrupt disable flag
            
           jsr clear_screen     ; clear the screen
           jsr init_sid         ; init music routine 

           ldy #$7f    ; $7f = %01111111
           sty $dc0d   ; Turn off CIAs Timer interrupts ($7f = %01111111)
           sty $dd0d   ; Turn off CIAs Timer interrupts ($7f = %01111111)
           lda $dc0d   ; by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
           lda $dd0d   ; by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
          
           lda #$01    ; Set Interrupt Request Mask...
           sta $d01a   ; ...we want IRQ by Rasterbeam (%00000001)

           lda $d011   ; Bit#0 of $d011 indicates if we have passed line 255 on the screen
           and #$7f    ; it is basically the 9th Bit for $d012
           sta $d011   ; we need to make sure it is set to zero for our intro.

           lda #<top   ; point IRQ Vector to our custom irq routine
           ldx #>top 
           sta $314    ; store in $314/$315
           stx $315   

           lda #$00    ; trigger first interrupt at row zero
           sta $d012

           cli                  ; clear interrupt disable flag
           jmp *                ; infinite loop


;============================================================
;    Our first custom interrupt routines follow
;    everything which must run 60 times per second 
;============================================================

top        dec $d019        ; acknowledge IRQ / clear register for next interrupt
           
           lda #$9c    ; trigger bottom interrupt at raster line 156
           sta $d012

           lda $09          ; set background color for upper half of the scren
           sta $d021

           lda #<bottom   ; point IRQ Vector to our next irq routine
           ldx #>bottom
           sta $314    ; store in $314/$315
           stx $315   
           +stabilize           ; call a macro

           jsr play_sid         ; jump to play music routine



 


bottom     dec $d019        ; acknowledge IRQ / clear register for next interrupt
           lda $06              ; set background color for lower half of the screen
           sta $d021
           
           lda #<top   ; point IRQ Vector to our next irq routine
           ldx #>top
           sta $314    ; store in $314/$315
           stx $315   

           jmp $ea81        ; return to kernel interrupt routine
