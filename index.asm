;============================================================
; Spritro Tutorial
; Code by actraiser/Dustlayer
; SID used: Empty 512 Bytes by 4-Mat
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
; setup symbols and sprites 
;============================================================

!source "code/config_symbols.asm"
!source "code/config_sprites.asm"

;============================================================
; load resource files (fonts, graphics, music)
;============================================================

!source "code/config_resources.asm"


;============================================================
; one-time called subroutines
;============================================================

!source "code/sub_clear_screen.asm"

;============================================================
;    subroutines called during custom IRQ
;============================================================

!source "code/sub_move_ship.asm"
!source "code/sub_move_starfield.asm"
!source "code/sub_check_keyboard.asm"
!source "code/sub_check_joystick.asm"
!source "code/sub_play_music.asm"

;============================================================
;  Main routine with custom interrupt
;============================================================
!source "code/main.asm"



