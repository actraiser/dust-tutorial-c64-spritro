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

; store the pointers in the sprite pointer registers for Sprite#0 to Sprite #2
lda #sprite_pointer_ship
sta screen_ram + $3f8
lda #sprite_pointer_star_1
sta screen_ram + $3f9
lda #sprite_pointer_star_2
sta screen_ram + $3fa

; load our delay animation byte with $00
lda #$00
sta delay_animation_pointer

; setup is finished, we jump to the main routine
; we want the main routine to know where to put its code
main_address = *


jmp main
