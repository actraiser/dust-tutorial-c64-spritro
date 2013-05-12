;============================================================
; sprite animation routine right to left
; high bit is initially set to start at outer right position 
;============================================================

move_ship  inc $07f8
		   cmp #$90
		   bne reset_ship 
		   rts

reset ship lda #$80
		   sta $07f8
           rts