;============================================================
; Spritro Tutorial
; Code by actraiser/Dustlayer
; Tutorial at http://goo.gl/ZDRDF
;
; (c) 2013 http://dustlayer.com
;
;============================================================
; This is the index file which loads all code and resources
;============================================================

;------------------------------------------------------------
;                         START                             
;------------------------------------------------------------

;============================================================
;    specify output file so all we need to do to build is 
;      to either run 'dust compile' or 'acme index.asm'
;============================================================

!cpu 6502
!to "build/dustlayer-spritro.prg",cbm    ; output file

;============================================================
; resourcefiles like character sets, music or sprite shapes
; are usually explicitly loaded to a specific location in
; memory. The addresses and loading is handled here
;============================================================

!source "code/config_resources.asm"

;============================================================
; a BASIC loader will help us RUN the intro when loaded
; into the C64 as opposed to manually type SYS49152
;============================================================

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152


;============================================================
;  we assemble all our actual 6502 code starting at $c000
;============================================================

* = $c000     ; start_address were all the assembled 
			  ; code will be consecutively written to

;============================================================
; config files to define and initialize symbols/sprite data 
;============================================================

!source "code/config_symbols.asm"
!source "code/config_sprites.asm"

;============================================================
;  main routine with our custom interrupt
;============================================================
!source "code/main.asm"

;============================================================
; one-time called subroutines
;============================================================

!source "code/sub_clear_screen.asm"
!source "code/sub_write_text.asm"

;============================================================
;    subroutines called repeatly during custom 
;============================================================

!source "code/sub_update_ship.asm"
!source "code/sub_check_keyboard.asm"
!source "code/sub_color_cycle.asm"

;============================================================
; any data like strings of text or tables of information
;============================================================

!source "code/data_text.asm"

;------------------------------------------------------------
;                         THE END                             
;------------------------------------------------------------








