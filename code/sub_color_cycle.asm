;============================================================
; color cycle over text using the sprite pointer of the 
; ship to get the next color 
;============================================================

color_cycle ldx #$00
			
color_init  lda sprite_ship_current_frame

		    cmp #$0f
		    beq color_inc
			adc #$01   		; make sure we don't have a black color


color_inc 	sta $d828,x      ; increase colors
            sta $d878,x      ; increate colors
            sbc #$01 		 ; substract 1 from color value in accumulator

			cmp #$00 		 ; if color value becomes 0 (black)...
			beq color_exit	 ; ...then skip this frame 

            inx    			 ; increase x-position counter 
            cpx #$28         ; finished when all 40 cols of a line are processed
            bne color_inc    ; if not finished write new color into register
color_exit  rts

