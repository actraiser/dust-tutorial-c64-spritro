;============================================================
; sprite animation routine right to left
; high bit is initially set to start at outer right position 
;============================================================

move_ship  ldx #$00 
		   stx $d000
           stx $d001
loop	   inc $d000
		   bne loop
		   rts