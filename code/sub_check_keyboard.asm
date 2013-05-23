
;===============================
; check for a single key press
;===============================


check_keyboard              

                        lda #%11111111  ; CIA#1 Port A set to output 
                        sta ddra             
                        lda #%00000000  ; CIA#1 Port B set to inputt
                        sta ddrb             
            
check_space             lda #%01111111  ; select row 8
                        sta pra 
                        lda prb         ; load column information
                        and #%00010000  ; test 'space' key to exit 
                        beq exit_to_basic

check_d                 lda #%11111011  ; select row 3
                        sta pra 
                        lda prb         ; load column information
                        and #%00000100  ; test 'd' key  
                        beq go_down

check_u                 lda #%11110111  ; select row 4
                        sta pra 
                        lda prb         ; load column information
                        and #%01000000  ; test 'u' key 
                        beq go_up
                        rts             ; return     

go_up                   lda $d001
                        cmp #$1e        ; check Y-coord whether we are too high
                        beq skip        ; if top of screen reached, skip
                        dec $d001       ; decrease y-coord for sprite 1
                        rts

go_down                 lda $d001       ; increase y-coord for sprite 1
                        cmp #$ff        ; check Y-coord whether whether we are too low
                        beq skip        ; if bottom of border was reached, skip
                        inc $d001
                        rts

exit_to_basic           lda #$00
                        sta $d015        ; turn off all sprites
                        jmp $ea81        ; jmp to regular interrupt routine
                        rts

skip                    rts              ; don't change Y-Coordinate