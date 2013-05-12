;===============================================================
; setting up all symbols we use in our code
; symbols are basically variables for address information
; for some people it is easier to remember words then hex numbers
;================================================================

screen_ram = $0400			; location of screen ram
address_sprites = $2000		;loading address for ship sprite
address_sid = $1001 	  ; loading address for sid tune
init_sid = $11ed      	  ; init routine for music
play_sid = $1004      	  ; play music routine
