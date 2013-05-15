
;============================================================
; check one key press
; first set the row to test and then mask out the bit for the key check
;============================================================

;+----+----------------------+-------------------------------------------------------------------------------------------------------+
;|    |                      |                                Peek from $dc01 (code in paranthesis):                                 |
;|row:| $dc00:               +------------+------------+------------+------------+------------+------------+------------+------------+
;|    |                      |   BIT 7    |   BIT 6    |   BIT 5    |   BIT 4    |   BIT 3    |   BIT 2    |   BIT 1    |   BIT 0    |
;+----+----------------------+------------+------------+------------+------------+------------+------------+------------+------------+
;|0.  | #%11111110 (254/$fe) | DOWN  ($  )|   F5  ($  )|   F3  ($  )|   F1  ($  )|   F7  ($  )| RIGHT ($  )| RETURN($  )|DELETE ($  )|
;|1.  | #%11111101 (253/$fd) |LEFT-SH($  )|   e   ($05)|   s   ($13)|   z   ($1a)|   4   ($34)|   a   ($01)|   w   ($17)|   3   ($33)|
;|2.  | #%11111011 (251/$fb) |   x   ($18)|   t   ($14)|   f   ($06)|   c   ($03)|   6   ($36)|   d   ($04)|   r   ($12)|   5   ($35)|
;|3.  | #%11110111 (247/$f7) |   v   ($16)|   u   ($15)|   h   ($08)|   b   ($02)|   8   ($38)|   g   ($07)|   y   ($19)|   7   ($37)|
;|4.  | #%11101111 (239/$ef) |   n   ($0e)|   o   ($0f)|   k   ($0b)|   m   ($0d)|   0   ($30)|   j   ($0a)|   i   ($09)|   9   ($39)|
;|5.  | #%11011111 (223/$df) |   ,   ($2c)|   @   ($00)|   :   ($3a)|   .   ($2e)|   -   ($2d)|   l   ($0c)|   p   ($10)|   +   ($2b)|
;|6.  | #%10111111 (191/$bf) |   /   ($2f)|   ^   ($1e)|   =   ($3d)|RGHT-SH($  )|  HOME ($  )|   ;   ($3b)|   *   ($2a)|   £   ($1c)|
;|7.  | #%01111111 (127/$7f) | STOP  ($  )|   q   ($11)|COMMODR($  )| SPACE ($20)|   2   ($32)|CONTROL($  )|  <-   ($1f)|   1   ($31)|
;+----+----------------------+------------+------------+------------+------------+------------+------------+------------+------------+

check_keyboard              
                        PRA  =  $dc00            ; CIA#1 (Port Register A)
                        DDRA =  $dc02            ; CIA#1 (Data Direction Register A)

                        PRB  =  $dc01            ; CIA#1 (Port Register B)
                        DDRB =  $dc03            ; CIA#1 (Data Direction Register B)

                        lda #%11111111  ; CIA#1 Port A = Ausgänge 
                        sta DDRA             

                        lda #%00000000  ; CIA#1 Port B = Eingänge
                        sta DDRB             

                        
            
check_space             lda #%01111111  ; select column to test 
                        sta PRA 
                        lda PRB         ; load current row information
                        and #%00010000  ; test 'space' key to exit 
                        beq exit_to_basic

check_d                 lda #%11111011  ; select column to test
                        sta PRA 
                        lda PRB         ; load current row information
                        and #%00000100  ; test 'd' key  
                        beq go_down

check_u                 lda #%11110111  ; select column to test
                        sta PRA 
                        lda PRB         ; load current row information
                        and #%01000000  ; test 'u' key 
                        beq go_up

                        rts             ; return     

go_up                   lda $d001
                        cmp #$1d        ; check if we are too high
                        beq skip
                        dec $d001       ; decrease y-coord for sprite 1
                        
                        rts

go_down                 lda $d001       ; increase y-coord for sprite 1
                        cmp #$ff        ; check if we are at the bottom low
                        beq skip
                        inc $d001
                        rts

exit_to_basic           lda #$00
                        sta $d015        ; turn off all sprites
                        jmp $ea81        ; jmp to regular interrupt routine
                        rts

skip                    rts