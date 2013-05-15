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
delay_animation_pointer     = $9e

; the number of frames per sprite are stored here
sprite_frames_ship		= 16

; start addresses
sprite_pointer_ship		= address_sprites / $40

; shared sprite colors
sprite_background_color = $00
sprite_multicolor_1  	= $0b
sprite_multicolor_2  	= $01

; individual sprite colors (to be defined)
sprite_ship_color		= $00


; initialize counters with frame numbers
lda #sprite_frames_ship
sta sprite_ship_current_frame

; store the pointers in the sprite pointer registers for Sprite#0 to Sprite #8
; we use Sprite#0 for the Ship, Sprite#1-4 for Star_1 and Sprite#5-7 for Star_2
lda #sprite_pointer_ship
sta screen_ram + $3f8



lda #$01        ; enable first Sprite
sta $d015

lda #$01        ; set multi color for all sprites
sta $d01c

lda #$01     ; all sprites overlay background
sta $d01b

; set high bit (9th Bit) only for Sprite#0 x-coord
lda #$01
sta $d010


; shared colors for sprites
lda #sprite_background_color
sta $d021
lda #sprite_multicolor_1
sta $d025
lda #sprite_multicolor_2
sta $d026

; individual colors for ship and the 7 star sprites
lda #sprite_ship_color
sta $d027


; load our delay animation byte with $00
lda #$00
sta delay_animation_pointer

; initial sprite positions with X/Y coords
lda #$e0
sta $d000
lda #$a0
sta $d001

