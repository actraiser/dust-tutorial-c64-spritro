	;===============================================================
; subroutine to create a sprite for use with sprite_move routine
;===============================================================



					lda #$81
					sta $07F8
       

					lda #$81
					sta $07F9

					lda #$81
					sta $07Fa

					lda #$81
					sta $07Fb

  					ldy #$00				; current sprite_id (0-7)

					lda #$ff  
					sta $d015 					; enable sprite for sprite_id
					sta $d01c					; set multi color mode for sprite

					lda $d010					; load sprite x high bit register
					and #$00					; clear high bits for all sprites
					sta $d010


					lda #$50
					sta $d000

				 	lda #$A0
					sta $d002

					lda #$A0
					sta $d004

				 	lda #$50
					sta $d006



set_y_coord			lda #$50
					sta $d001
					sta $d003

					lda #$80
					sta $d005
					sta $d007

					lda #%00001010
					sta $d01d

					lda #%00001100
					sta $d017


					lda #$00
					sta $d028
					lda #$02
					sta $d029
					lda #$03
					sta $d02a
					lda #$04
					sta $d02b
					lda #$05
					sta $d02c
					lda #$06
					sta $d02d
					lda #$07
					sta $d02e


set_shared_color_1	lda #$00
					sta $d025
				
set_shared_color_2	lda #$01
					sta $d026

					jmp *