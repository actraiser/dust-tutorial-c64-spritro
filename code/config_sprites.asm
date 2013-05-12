;============================================================
; configuration of sprites used in the intro
;
; Ship Sprite first 16*64Bytes of Sprite Location Address
; Star 1 Sprite next 8x64Bytes after Ship Sprite Location
; Star 2 Sprite next 8x64Bytes of Star 1 Location
;============================================================


; we need a couple of locations to count down frames
; for the animation of each Sprite

sprite_ship_current_frame	= $02
sprite_star_1_current_frame	= $03
sprite_star_2_current_frame	= $04

; the number of frames per sprite are stored here
sprite_frames_ship		= 16
sprite_frames_star_1	= 8
sprite_frames_star_2	= 8

; start addresses
sprite_pointer_ship		= address_sprites / $40
sprite_pointer_star_1	= sprite_pointer_ship + sprite_frames_ship
sprite_pointer_star_2	= sprite_pointer_star_1 + sprite_frames_star_1

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

; setup is finished, we jump to the main routine
main_address = *
jmp main
