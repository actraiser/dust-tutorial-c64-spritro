; load external binaries

* = $d021 ; Background Color Register
!bin "resources/sprites.spr",1,0 ; get one byte from file offset 0 (first Byte)         

* = $d025 ; Multicolor #1 Register
!bin "resources/sprites.spr",1,1 ; get one byte from file offset 1 (second Byte)

* = $d026 ; Multicolor #2 Register
!bin "resources/sprites.spr",1,2 ; get one byte from file offset 2 (third Byte)       

* = address_sprites                  ; address to load the sprites to
!bin "resources/sprites.spr",2048,3  ; skip first three bytes, then load 32x64 Bytes from file

* = address_sid                         ; address to load the music data
!bin "resources/empty_1000.sid",, $7c+2  ; remove header from sid and cut off original loading address 
