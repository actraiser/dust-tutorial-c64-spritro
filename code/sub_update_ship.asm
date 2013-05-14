;============================================================
; sprite animation routine right to left
; high bit is initially set to start at outer right position 
;============================================================

update_ship jmp animate_ship    ; animate ship by pointing to next shape
            jmp move_ship       ; move ship by one pixel
            rts
          
animate_ship lda sprite_ship_current_frame ; load current frame number
             bne dec_ship_frame             ; if not 0 decrease it
             rts

dec_ship_frame  inc screen_ram + $3f8 ; increase current pointer position
                dec sprite_ship_current_frame ; decrease current Frame
                beq reset_ship_frames
                rts

reset_ship_frames   lda #sprite_frames_ship        ; if 0 load frame count for ship
                    sta sprite_ship_current_frame  ; store into current frame counter
                    lda #sprite_pointer_ship
                    sta screen_ram + $3f8
                    rts                

delay_frame          


move_ship    rts

