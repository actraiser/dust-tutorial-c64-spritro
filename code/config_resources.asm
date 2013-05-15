; load external binaries


;* = $fe ; temporary Location for Background Color 
;!bin "resources/sprites.spr",1,0 ; get one byte from file offset 0 (first Byte)         
;sprite_background_color = *-1

;* = $02 ; temporary Location for Multicolor #1 Color
;!bin "resources/sprites.spr",1,1 ; get one byte from file offset 1 (second Byte)
;sprite_multicolor_1 = *-1

;* = $0100 ; temporary Location for Multicolor #2 Color
;!bin "resources/sprites.spr",1,2 ; get one byte from file offset 2 (third Byte)      
;sprite_multicolor_2 = *-1


* = address_sprites                  ; address to load the sprites to
!bin "resources/sprites.spr",1024,3  ; skip first three bytes, then load 16x64 Bytes from file

* = address_sid                         ; address to load the music data
!bin "resources/empty_1000.sid",, $7c+2  ; remove header from sid and cut off original loading address 

* = address_chars                     ; address to load the charset from
!bin "resources/rambo_font.ctm",384,24                ; skip first two bytes