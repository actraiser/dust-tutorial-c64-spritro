write_text lda line1,x      ; read characters from line1 table of text...
           sta $0428,x      ; ...and store in screen ram near the center
           lda line2,x      ; read characters from line1 table of text...
           sta $0478,x      ; ...and put 2 rows below line1
           inx 
           cpx #$28         ; finished when all 40 cols of a line are processed
           bne write_text
           rts