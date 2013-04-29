;============================================================
; Spritro Tutorial
; Code by actraiser/Dustlayer
;
; http://dustlayer.com
; 
;============================================================

;============================================================
; index file which loads all source code and resources files
;============================================================

;============================================================
;    specify output file
;============================================================

!cpu 6502
!to "build/dustlayer-spritro.prg",cbm    ; output file

;============================================================
; BASIC loader with start address $c000
;============================================================

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152
* = $c000     				            ; start address for 6502 code

;============================================================
;  Main routine with IRQ setup and custom IRQ routine
;============================================================

!source "code/main.asm"

;============================================================
;    setup symbols, pointers
;============================================================

!source "code/init_symbols.asm"

;============================================================
; one-time called sub outines
;============================================================

!source "code/sub_clear_screen.asm"

;============================================================
;    subroutines called during custom IRQ
;============================================================

!source "code/sub_sprite_logo.asm"
!source "code/sub_sprite_ship.asm"
!source "code/sub_keyboard.asm"
!source "code/sub_joystick.asm"
!source "code/sub_music.asm"

;============================================================
; load resource files (fonts, graphics, music)
;============================================================

!source "code/load_resources.asm"
