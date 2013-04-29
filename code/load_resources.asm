; load sprites

* = $2000                   				 ; address to load the sprites
!bin "resources/uridium.spd",2560,1024       ; skip first 1k of data and only load the specified amount
