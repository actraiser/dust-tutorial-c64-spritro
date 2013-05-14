;============================================================
; configuration of sprites used in the intro
;
; Ship Sprite first 16*64Bytes of Sprite Location Address
; Star 1 Sprite next 8x64Bytes after Ship Sprite Location
; Star 2 Sprite next 8x64Bytes of Star 1 Location
;============================================================


; we need a couple of locations to count down frames
; for the animation of each Sprite

sprite_ship_current_frame	= $fb
sprite_star_1_current_frame	= $fc
sprite_star_2_current_frame	= $fd
delay_animation_pointer     = $9e

; the number of frames per sprite are stored here
sprite_frames_ship		= 16
sprite_frames_star_1	= 8
sprite_frames_star_2	= 8

; start addresses
sprite_pointer_ship		= address_sprites / $40
sprite_pointer_star_1	= sprite_pointer_ship + sprite_frames_ship
sprite_pointer_star_2	= sprite_pointer_star_1 + sprite_frames_star_1

; shared sprite colors
sprite_background_color = $00
sprite_multicolor_1  	= $0b
sprite_multicolor_2  	= $01

; individual sprite colors (to be defined)
sprite_ship_color		= $00
sprite_star_1_color		= $00
sprite_star_2_color		= $00


; initialize counters with frame numbers
lda #sprite_frames_ship
sta sprite_ship_current_frame
lda #sprite_frames_star_1
sta sprite_star_1_current_frame
lda #sprite_frames_star_2
sta sprite_star_2_current_frame

; store the pointers in the sprite pointer registers for Sprite#0 to Sprite #8
; we use Sprite#0 for the Ship, Sprite#1-4 for Star_1 and Sprite#5-7 for Star_2
lda #sprite_pointer_ship
sta screen_ram + $3f8
lda #sprite_pointer_star_1
sta screen_ram + $3f9
sta screen_ram + $3fa
sta screen_ram + $3fb
sta screen_ram + $3fc
lda #sprite_pointer_star_2
sta screen_ram + $3fd
sta screen_ram + $3fe
sta screen_ram + $3ff

; load our delay animation byte with $00
lda #$00
sta delay_animation_pointer

; initial sprite positions for X and Y

; Sprite#0
lda #$ff
sta $d000
lda #$80
sta $d001

; X for Sprite#1-7 is #$00
lda #$20
sta $d002
sta $d004
sta $d006
sta $d008
sta $d00a
sta $d00c
sta $d00e


; Sprite#1
lda #$20
sta $d003

; Sprite#2
lda #$50
sta $d005

; Sprite#3
lda #$90
sta $d007

; Sprite#4
lda #$a0
sta $d009

; Sprite#5
lda #$b0
sta $d00b

; Sprite#6
lda #$d0
sta $d00d

; Sprite#7
lda #$f0
sta $d00f


; set high bit only for ship as it starts on the outer right
lda #$01
sta $d010

; setup is finished, we jump to the main routine
; we want the main routine to know where to put its code
main_address = *


jmp main
