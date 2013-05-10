;===============================================================
; setting up all symbols we use in our code
; symbols are basically variables for address information
; for some people it is easier to remember words then hex numbers
;================================================================

address_sprites = $2000		;loading address for ship sprite
address_sid = $1001 	  ; loading address for sid tune
init_sid = $11ed      	  ; init routine for music
play_sid = $1004      	  ; play music routine

sprite_pointer_ship = $58 ; sprite pointer for space ship
sprite_ship_number_frames = $0f ; ship has 16 frames/shapes

sprite_pointer_star_1 = $59 ; sprite pointer for star type 1
sprite_star_1_number_frames = $08 ; star #1 has 8frames/shapes

sprite_pointer_star_2 = $60 ; sprite pointer for star type 2
sprite_star_2_number_frames = $08 ; star #2 has 8 frames/shapes


sprite_1 = $58		  ; sprite pointer for Sprite#1 (ship)
sprite_2 = $58		  ; sprite pointer for Sprite#2 (ship)
sprite_3 = $58		  ; sprite pointer for Sprite#3 (ship)
sprite_4 = $58		  ; sprite pointer for Sprite#4 (ship)
sprite_5 = $58		  ; sprite pointer for Sprite#5 (ship)
sprite_6 = $58		  ; sprite pointer for Sprite#6 (ship)
sprite_7 = $58		  ; sprite pointer for Sprite#7 (ship)

star_sprite_0 = $58		  ; sprite pointer for Sprite#0 (logo)
logo_sprite_1 = $58		  ; sprite pointer for Sprite#1 (logo)
logo_sprite_2 = $58		  ; sprite pointer for Sprite#2 (logo)
logo_sprite_3 = $58		  ; sprite pointer for Sprite#3 (logo)
logo_sprite_4 = $58		  ; sprite pointer for Sprite#4 (logo)
logo_sprite_5 = $58		  ; sprite pointer for Sprite#5 (logo)
logo_sprite_6 = $58		  ; sprite pointer for Sprite#6 (logo)
logo_sprite_7 = $58		  ; sprite pointer for Sprite#7 (logo)

screen_ram = $0400		  ; start of screen ram
char_ram   = $3000		  ; start of our copied characters
