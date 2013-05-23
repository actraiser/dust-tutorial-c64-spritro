;============================================================
; Updates horizontal position and Sprite Shape number within 
; animation of Sprite#0 - Sprite moves from right to left
;============================================================
 
ship_x_high         lda $d010                      ; load 9th Bit
                    eor #$01                       ; eor against #$01
                    sta $d010                      ; store into 9th bit

update_ship         dec $d000                      ; decrease X-Coord until zero
                    beq ship_x_high                ; switch 9th Bit of X-Coord

animate_ship        lda delay_animation_pointer    ; pointer is either #$01 or #$00
                    eor #$01                       ; eor flips between 0 and 1
                    sta delay_animation_pointer    ; store back into pointer
                    beq delay_animation            ; skip animation for this refresh if 0
                    lda sprite_ship_current_frame  ; load current frame number
                    bne dec_ship_frame             ; if not progress animation

reset_ship_frames   lda #sprite_frames_ship        ; load number of frames for ship
                    sta sprite_ship_current_frame  ; store into current frame counter
                    lda #sprite_pointer_ship       ; load original sprite shape pinter
                    sta screen_ram + $3f8          ; store in Sprite#0 pointer register

dec_ship_frame      inc screen_ram + $3f8          ; increase current pointer position
                    dec sprite_ship_current_frame  ; decrease current Frame
                    beq reset_ship_frames          ; if current frame is zero, reset

delay_animation     rts                            ; do nothing in this refresh, return