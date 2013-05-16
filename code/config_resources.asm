; load external binaries

* = address_sprites                  ; address to load the sprites to
!bin "resources/sprites.spr",1024,3  ; skip first three bytes, then load 16x64 Bytes from file

* = address_sid                         ; address to load the music data
!bin "resources/empty_1000.sid",, $7c+2  ; remove header from sid and cut off original loading address 

* = address_chars                     ; address to load the charset from
!bin "resources/rambo_font.ctm",384,24                ; skip first two bytes