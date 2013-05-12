;==================================================================
; main.asm triggers all sub routines and runs the Interrupt Routine
;==================================================================

* = main_address      ; main_address was set after the last configuration file

main      sei         ; set interrupt disable flag
           
          jsr clear_screen     ; clear the screen
          jsr init_sid         ; init music routine 


          lda #%00000111        ; enable Sprites 0-2
          sta $d015

          lda #%00000111        ; set multi color
          sta $d01c


          lda #%00000111        ; all sprites overlay background
          sta $d01b

          lda #sprite_background_color
          sta $d021
          lda #sprite_multicolor_1
          sta $d025
          lda #sprite_multicolor_2
          sta $d026



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

           lda #<irq   ; point IRQ Vector to our custom irq routine
           ldx #>irq 
           sta $0314    ; store in $314/$315
           stx $0315   

           lda #$00    ; trigger first interrupt at row zero
           sta $d012

           cli                  ; clear interrupt disable flag
           jmp *                ; infinite loop


;============================================================
;    Our custom interrupt routines 
;============================================================

irq        dec $d019        ; acknowledge IRQ / clear register for next interrupt
           ;jsr play_sid     ; jump to play music routine
           jsr move_starfield ; move starfield
           jsr move_ship      ; move ship
           jsr check_keyboard ; check keyboard controls
           jsr check_joystick ; check joystick controls
           jmp $ea31 ; return to Kernel routine