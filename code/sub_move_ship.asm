;============================================================
; sprite animation routine right to left
; high bit is initially set to start at outer right position 
;============================================================

move_ship  ldx #$80 
		   stx $d000
           stx $d001
           

           rts