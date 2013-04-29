; load sprites

* = address_ship_sprite             				 ; address to load the sprites
!bin "resources/uridium.spd",2560,1024      		 ; skip first 1k of data and only load the specified amount

* = address_sid                         ; address to load the music data
!bin "resources/jeff_donald.sid",, $7c+2  ; remove header from sid and cut off original loading address 
