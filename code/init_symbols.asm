;===============================================================
; setting up all symbols we use in our code
; symbols are basically variables for address information
; for some people it is easier to remember words then hex numbers
;================================================================

address_ship_sprite = $2000		;loading address for ship sprite
address_sid = $1000 	  ; loading address for sid tune
init_sid = $1000      	  ; init routine for music
play_sid = $1006      	  ; play music routine

ship_sprite_0 = $58		  ; sprite pointer for Sprite#0 (ship)
ship_sprite_1 = $58		  ; sprite pointer for Sprite#1 (ship)
ship_sprite_2 = $58		  ; sprite pointer for Sprite#2 (ship)
ship_sprite_3 = $58		  ; sprite pointer for Sprite#3 (ship)
ship_sprite_4 = $58		  ; sprite pointer for Sprite#4 (ship)
ship_sprite_5 = $58		  ; sprite pointer for Sprite#5 (ship)
ship_sprite_6 = $58		  ; sprite pointer for Sprite#6 (ship)
ship_sprite_7 = $58		  ; sprite pointer for Sprite#7 (ship)

logo_sprite_0 = $58		  ; sprite pointer for Sprite#0 (logo)
logo_sprite_1 = $58		  ; sprite pointer for Sprite#1 (logo)
logo_sprite_2 = $58		  ; sprite pointer for Sprite#2 (logo)
logo_sprite_3 = $58		  ; sprite pointer for Sprite#3 (logo)
logo_sprite_4 = $58		  ; sprite pointer for Sprite#4 (logo)
logo_sprite_5 = $58		  ; sprite pointer for Sprite#5 (logo)
logo_sprite_6 = $58		  ; sprite pointer for Sprite#6 (logo)
logo_sprite_7 = $58		  ; sprite pointer for Sprite#7 (logo)

screen_ram = $0400		  ; start of screen ram
char_ram   = $3000		  ; start of our copied characters

